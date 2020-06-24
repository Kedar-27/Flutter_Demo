import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
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
          trailing: MediaQuery.of(context).size.width > 460 ?
          FlatButton.icon(
              icon:  const Icon(Icons.delete),
              label:  const Text('Delete'),
              textColor:Theme.of(context).errorColor ,
              onPressed: () => deleteTransaction(transaction.id)
          )
              :IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => deleteTransaction(transaction.id)
          )
      ),
    );
  }
}