import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

              return Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: ListTile(
                    leading: FittedBox(
                      child: CircleAvatar(
                          radius: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              '\$${transaction.amount.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )),
                    ),
                    title: Text(transaction.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    subtitle: Text(DateFormat.yMMMMd().format(transaction.date),
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTransaction(transaction.id))),
              );

//          Card(
//                child: Row(
//                  children: [
//                    Container(
//                      margin:
//                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//                      child: Text(
//                        '\$${transaction.amount.toStringAsFixed(2)}',
//                        style: Theme.of(context).textTheme.headline6
//                      ),
//                      padding: EdgeInsets.all(10),
//                      decoration: BoxDecoration(
//                        border: Border.all(color: Theme.of(context).primaryColor),
//                      ),
//                    ),
//                    Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Text(transaction.title,
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 16,
//                            )),
//                        Text(DateFormat.yMMMMd().format(transaction.date),
//                            style: TextStyle(
//                              color: Colors.grey,
//                            )),
//                      ],
//                    ),
//                  ],
//                )
//        );
            },
            itemCount: this.transactions.length,
          );
  }
}
