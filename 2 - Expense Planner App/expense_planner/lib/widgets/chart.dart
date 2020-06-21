import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';


class Chart extends StatelessWidget {
  //region Variables
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionsValues {

    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i< this.recentTransactions.length; i++){
        if (weekDay.day == this.recentTransactions[i].date.day
            && weekDay.month == this.recentTransactions[i].date.month
            && weekDay.year == this.recentTransactions[i].date.year ){

          totalSum += this.recentTransactions[i].amount;
        }
      }
     return {'day': DateFormat.E().format(weekDay).substring(0,1) , 'amount': totalSum};
    });

    }

    double get maxSpending{

      return this.groupedTransactionsValues.fold(0.0, (sum, element) => sum += element['amount']);

    }


  //endregion

  Chart(this.recentTransactions);



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((transaction){
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(label: transaction['day'],
                  spendingAmount: transaction['amount'],
                  spendingPercentageOfTotal: (transaction['amount'] as double) / maxSpending
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
