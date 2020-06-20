import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  //region Variables
  final Function addTransactions ;
  //endregion

  //region Constructor
  NewTransaction(this.addTransactions);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = this.titleController.text;
    final enteredAmount = double.parse(this.amountController.text);

    if( enteredTitle.isEmpty || enteredAmount >= 0){
      return;
    }


    this.widget.addTransactions(enteredTitle,enteredAmount);

    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: this.titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: this.amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => this.submitData,
              ),
              FlatButton(
                child: Text('Add Transaction'),
                onPressed:  submitData ,
                textColor: Colors.purple,
              )
            ],
          ),
        )
    );
  }
}
