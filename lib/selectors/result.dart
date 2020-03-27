import 'package:flutter/material.dart';

class Result extends StatelessWidget {
final String result;

  const Result(this.result);
  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 10, 28, 10),
      decoration: BoxDecoration( 
        color:Colors.black,       
        border: Border.all(
          color:Colors.blueAccent,
          width: 1.0
        ),
        // color: Colors.grey[100]
      ) ,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end,        
        children: <Widget>[
          Text(
            result,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.grey[100],              
            ),
            ),
        ],
      ),
    );
  }
}