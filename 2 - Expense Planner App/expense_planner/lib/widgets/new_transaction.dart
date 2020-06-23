import 'dart:io';
import 'package:expense_planner/widgets/adaptive_flat_button.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  //region Variables
  final Function addTransactions ;
  //endregion

  //region Constructor
  NewTransaction(this.addTransactions);

  @override
  _NewTransactionState createState() => _NewTransactionState();
  //endregion

}

class _NewTransactionState extends State<NewTransaction> {
  //region Variables
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  //endregion


   //region Methods
  void _submitData(){
    final enteredTitle = this._titleController.text;
    final enteredAmount = double.parse(this._amountController.text);

    if( enteredTitle.isEmpty || enteredAmount < 0 || _selectedDate == null){
      this._selectedDate = null;
      return;
    }


    this.widget.addTransactions(enteredTitle, enteredAmount, this._selectedDate);

    this._selectedDate = null;

    Navigator.of(context).pop();

  }

  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020,6), lastDate:  DateTime.now()
    ).then((selectedDate){
        setState(() {
          if(selectedDate == null){
            return;
          }
          this._selectedDate = selectedDate;
        });

    });



  }

   //endregion


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: this._titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: this._amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => this._submitData,
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(this._selectedDate == null ? 'No date chosen':
                        'Selected Date: ${DateFormat.yMd().format(this._selectedDate)}'),
                      ),
                      AdaptiveFlatButton(title:'Choose Date', completionHandler: this._presentDatePicker)
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Add Transaction'),
                  onPressed:  _submitData ,
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                )
              ],
            ),
          )
      ),
    );
  }
}
