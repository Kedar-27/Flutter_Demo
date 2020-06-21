import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //region Variables
  final List<Transaction> transactions;

  //endregion

  //region Constructor
  TransactionList(this.transactions);
  //endregion



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: this.transactions.isEmpty ? 
      Column( children: [
        Text('No transactions added yet!.',style: Theme.of(context).textTheme.headline6,),
        SizedBox(height: 20,),
        Container(
            height: 270,
            child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,))
      ],) : 
      ListView.builder(
        itemBuilder: (context, index){
          final transaction = this.transactions[index];

        return Card(
                child: Row(
                  children: [
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: Text(
                        '\$${transaction.amount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headline6
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(transaction.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        Text(DateFormat.yMMMMd().format(transaction.date),
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ],
                )
        );

        },
        itemCount: this.transactions.length,
      ),
    );
  }
}
