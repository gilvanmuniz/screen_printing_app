import 'package:flutter/material.dart';
import 'package:screen_printing_app/selectors/selected.dart';
import './selector.dart';

class SelectorsSum extends StatefulWidget {
  @override
  _SelectorsSum createState() => _SelectorsSum();
}

class _SelectorsSum extends State<SelectorsSum> {
  final produtos = {
    'produto': ['Camiseta', ' Regata', 'Polo'],
    'malha': ['Algodao', 'PV', 'Piquet'],
    'color': ['Branca', 'Clara', 'Escura'],
  };

  var itemSelecionado = 'Camista';
  var meshType = '';
  var colorType = '';
  var productType = '';
  var totalValue = 0.0;

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
      }
      // print(this.productType);
      // print(this.meshType);
      // print(this.colorType);
    });
  } /* selecionado end */

  _sumValue() {
    if (this.productType == 'Camiseta') {
      this.totalValue = this.totalValue + 20.0;
    }
    if (this.meshType == 'PV') {
      this.totalValue = this.totalValue + 10.0;
    }
    print('${this.productType} - ${this.meshType} - ${this.colorType}');
    print(this.totalValue);
  }

  _cleanSelectors() {
    setState(() {
      this.productType = '';
      this.meshType = '';
      this.colorType = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        this.productType.isEmpty
            ? Selector(produtos['produto'], _selecionado, 'Camiseta', 'Produto')
            : Selected(this.productType),
        this.meshType.isEmpty
            ? Selector(produtos['malha'], _selecionado, 'Algodao', 'Malha')
            : Selected(this.meshType),
        this.colorType.isEmpty
            ? Selector(produtos['color'], _selecionado, 'Branca', 'Cor')
            : Selected(this.colorType),
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
