import 'package:flutter/material.dart';
import 'package:screen_printing_app/selectors/result.dart';
import 'package:screen_printing_app/selectors/selected.dart';
import './selector.dart';

class SelectorsSum extends StatefulWidget {
  @override
  _SelectorsSum createState() => _SelectorsSum();
}

class _SelectorsSum extends State<SelectorsSum> {
  final produtos = {
    'produto': ['Camiseta', 'Regata', 'Polo'],
    'malha': ['Algodao', 'PV', 'Piquet'],
    'color': ['Branca', 'Clara', 'Escura'],
    'quantidade': ['    12', '13 a 24', '25 a 50', 'até 100', 'até 250', 'até 500'],
    'silk' : ['2', '3', '4', '5', '6', '7','8'],
  };

  var itemSelecionado = 'Camista';
  var productType = '';
  var meshType = '';
  var colorType = '';
  var amount = '';
  var silk = '';
  var totalValue = 0.0;
  var totalFinal = 'R\$ 0.00';

  _selecionado(itemSelecionado) {
    this.itemSelecionado = itemSelecionado;
    setState(() {
      for (var item in this.produtos['produto']) {
        if (item == this.itemSelecionado) {
          this.productType = item;
        }
      } /* for product end */
      for (var item in this.produtos['malha']) {
        if (item == this.itemSelecionado) {
          this.meshType = item;
        }
      } /* for mesh end */
      for (var item in this.produtos['color']) {
        if (item == this.itemSelecionado) {
          this.colorType = item;
        }
      } /*  for color end */

      for (var item in this.produtos['quantidade']) {
        if (item == this.itemSelecionado) {
          this.amount = item;
        }
      }  /* amount end */
      for (var item in this.produtos['silk']) {
        if (item == this.itemSelecionado) {
          this.silk = item;
        }
      } 

      // print(this.productType);
      // print(this.meshType);
      // print(this.colorType);
      // print(this.amount);
    });
  } /* selecionado end */

  _sumValue() {
     switch (this.meshType) {
   case 'PV':
    { 
       switch (this.colorType ) {
          case 'Clara':
            {
              this.totalValue = 28;
            }
          break;  
            case 'Escura':
            {
              this.totalValue = 32;
            }
          break;  
            default:
            {
              this.totalValue = 36;
            }
          } /* color switch end */
      
    }  /* CASE PV end */
   break;  
    case 'Piquet':
    {
      this.totalValue = this.totalValue + 28.0;
    }
   break;  
    default:
    {
      this.totalValue = this.totalValue + 20.0;
    }
  }  /* mesh end */
    
   switch (this.productType ) {
   case 'Regata':
    {
      this.totalValue = this.totalValue * 0.2;
    }
   break;  
    case 'Polo':
    {
      this.totalValue = this.totalValue * 0.35;
    }
   break;  
    default:
    {
      this.totalValue = this.totalValue  * 0.22;
    }
  } /* switch produto end */
  
     setState(() {
      this.totalFinal = 'R\$' + this.totalValue.toStringAsFixed(2);
    });
    
    print('${this.productType} - ${this.meshType} - ${this.colorType}');
    print(this.totalValue);
  }

  _cleanSelectors() {
    setState(() {
      this.productType = '';
      this.meshType = '';
      this.colorType = '';
      this.amount = '';
      this.silk = '';
      this.totalValue = 0.0;
      this.totalFinal ='R\$ 0.00';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Result(this.totalFinal),
        this.productType.isEmpty
            ? Selector(produtos['produto'], _selecionado, 'Camiseta', 'Produto')
            : Selected(this.productType),
        this.meshType.isEmpty
            ? Selector(produtos['malha'], _selecionado, 'Algodao', 'Malha')
            : Selected(this.meshType),
        this.colorType.isEmpty
            ? Selector(produtos['color'], _selecionado, 'Branca', 'Cor')
            : Selected(this.colorType),
        this.amount.isEmpty
            ? Selector(produtos['quantidade'], _selecionado, '    12', 'Quant.')
            : Selected(this.amount),
        this.silk.isEmpty
            ? Selector(produtos['silk'], _selecionado, '2', 'Silk.')
            : Selected(this.silk),               
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: _sumValue,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right:20),
              padding: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: _cleanSelectors,
                child: Icon(Icons.clear),
              ),
            )
          ],
        ),
      ],
    );
  }
}
