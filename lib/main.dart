import 'package:flutter/material.dart';
import 'package:screen_printing_app/selectors/selectors_sum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Printing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Screen Printing App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var icon;

     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                             
        title: Row(
          children: <Widget>[
            Container(
              height: 60,
              child: FittedBox(
                child: Image.asset('lib/images/SilkCost-white-icon2.png')
                ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(widget.title)
              )
          ],
        ),       
      ),
      drawer: Image.asset('lib/images/color_icon-SMALL.png' ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[          
          SelectorsSum()
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
