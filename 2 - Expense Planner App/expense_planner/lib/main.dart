import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown ,  DeviceOrientation.portraitUp]);

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
        primarySwatch: Colors.yellow,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  color: Colors.black
              ),
            button: TextStyle(
                color: Colors.black
            ),
          ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                )
            )
        ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Theme.of(context).primaryColor,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //region Variables
  final List<Transaction> _userTransactions = [
    //Transaction(
       // id: 't0', title: 'New Shoes', amount: 123.123, date: DateTime.now()),
    //Transaction(
       // id: 't1', title: 'New Clothes', amount: 123.123, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions{
      return _userTransactions.where((element) => element.date.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
  }

  bool _showChart = false;





  //endregion

  //region Methods

  void _addTransaction(String title, double amount , DateTime selectedDate) {
    final newTransaction = Transaction(
        id: selectedDate.toString(),
        title: title,
        amount: amount,
        date: selectedDate);

    setState(() {
      this._userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {

    this._userTransactions.removeWhere((transaction) => transaction.id == id);

  }


  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return NewTransaction(this._addTransaction);
        });
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text('Expense Planner'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => this._startAddNewTransaction(context),
        )
      ],
    );


    final availableHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height -
        MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    final transactionListWidget = Container(
        height: availableHeight * 0.7,
        child: TransactionList(this._userTransactions,_deleteTransaction)
    );

    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;


    return Scaffold(
      appBar: appBar ,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Switch(value: this._showChart, onChanged: (value){
                setState(() {
                  this._showChart = value;
                });
               },
              ),
              ]
            ),

           if(!isLandscape)
             Container(
               height: availableHeight * 0.3,
               child: Chart(this._recentTransactions)
           ),

            if(!isLandscape)
              transactionListWidget,


           if (isLandscape)
             _showChart ? Container(
                height: availableHeight * 0.8,
                child: Chart(this._recentTransactions)
            )
                : transactionListWidget
          ],
        ),
      ),



      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => this._startAddNewTransaction(context),
      ),
    );
  }
}
