import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import './transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(
      id: 't0',
      title: 'New Shoes',
      amount: 123.123,
      date: DateTime.now()
    ),
    Transaction(
        id: 't1',
        title: 'New Shoes',
        amount: 123.123,
        date: DateTime.now()
    )
  ];


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to indivi:dually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(

            width: double.infinity,
              child: Card(child: Text('Chart Widget'),)
          ),
          Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(decoration: InputDecoration(labelText: 'Title'),),
                      TextField(decoration: InputDecoration(labelText: 'Title'),),
                      FlatButton(child: Text('Add Transaction'),
                        onPressed: () => {},
                        textColor: Colors.purple,)
                    ],

          ),)
          ),
          Column(
            children: transactions.map((transaction) =>
                Card(child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        child: Text(transaction.amount.toString(),
                          style: TextStyle(color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),

                        ),
                        padding: EdgeInsets.all(10) ,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.purple
                        ),
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(transaction.title,
                          style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                      )
                      ),
                  Text(DateFormat.yMMMMd().format(transaction.date),
                          style: TextStyle(color: Colors.grey,
                      )),
                    ],),
                  ],
                ))
            ).toList(),
          ),
        ],
      ),
    );
  }
}

