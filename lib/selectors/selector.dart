import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Selector extends StatefulWidget {
   final String firstSelected;
   final List<String> lista;
   final String texto;   
   final Function (String novoItem) dropDownItemSelected;

  Selector(
    this.lista, 
    this.dropDownItemSelected, 
    this.firstSelected,
    this.texto
    );

  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  var _itemSelecionado = '';
  String get itemSelecionado{
    return _itemSelecionado;
  }
  
  @override
  Widget build(BuildContext context) {
    this._itemSelecionado = widget.firstSelected;
    return Card(
      elevation: 6,
      child: Row(
      children: <Widget>[
         Container(
            margin: EdgeInsets.fromLTRB(4, 5, 0, 0),
            width: 70,
            height: 55,
            color:Colors.lightBlue[50],          
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment:CrossAxisAlignment.center,            
              children: <Widget>[              
                Container(                             
                    // child: Image.asset('lib/images/color_icon-SMALL.png'),
                    child: Icon(Icons.featured_play_list)                  
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(1, 5, 0, 0),
                  child:Text(widget.texto)
                 )
              ],
            ),
          ),
        Container(
          alignment: AlignmentDirectional.bottomEnd,
          height: 50,
          width: 320,
          color: Colors.lightBlue[100],
          child: Column(
            children: <Widget>[
              DropdownButton<String>(              
                  items:widget.lista.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: Colors.blueGrey

                        ),
                      ),
                    );
                  }).toList(),                            
                  onChanged: (String novoItemSelecionado) {
                                  
                      widget.dropDownItemSelected(novoItemSelecionado);
                      setState(() {
                        this._itemSelecionado = novoItemSelecionado; 
                      });        
                    },                           
                    value:_itemSelecionado),
            ],
          ),
        ),
      ],
    ),
    );
  }
 
        
}