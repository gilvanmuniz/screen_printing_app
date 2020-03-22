import 'package:flutter/material.dart';

class Selected extends StatelessWidget {
  final String selected;
  Selected(this.selected);
  @override
  Widget build(BuildContext context) {
    return Card(       
         elevation: 6,         
         child: Row(
           mainAxisAlignment:MainAxisAlignment.end,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Container(
               width:200,
               height: 55,
               padding: EdgeInsets.only(left:55, top:15),                
               decoration: BoxDecoration(
                 border:Border.all()
               ),
                 child: Text(
                     selected,
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w900,
                   color: Colors.blueGrey                 
                   ),
                 ),
             ),
           ],
         ),
       );
  }
}