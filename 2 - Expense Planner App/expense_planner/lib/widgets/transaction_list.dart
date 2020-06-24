import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  //region Variables
  final List<Transaction> transactions;
  final Function deleteTransaction;
  //endregion

  //region Constructor
  TransactionList(this.transactions, this.deleteTransaction);
  //endregion

  @override
  Widget build(BuildContext context) {
    return this.transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => Column(
                  children: [
                    Text(
                      'No transactions added yet!.',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                ))
        : ListView.builder(
            itemBuilder: (context, index) {
              final transaction = this.transactions[index];
              return TransactionItem(transaction: transaction, deleteTransaction: this.deleteTransaction);
            },
            itemCount: this.transactions.length,
          );
  }
}


