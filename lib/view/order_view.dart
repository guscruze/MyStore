import 'package:aprendiendomystore/model/product.dart';
import 'package:flutter/material.dart';

class OrderListView extends StatefulWidget {

  final List<Product> LstOr;

  OrderListView(this.LstOr);

  @override
  _OrderListViewState createState() => _OrderListViewState();

}


class _OrderListViewState extends State<OrderListView> {
  final _biggerFont = const TextStyle(fontSize: 25.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
        backgroundColor: Colors.purple[800],
        actions: <Widget>[
          /*PopupMenuButton<int>(
            onSelected: (item) => handleTap(item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Ver en google maps')),
              PopupMenuItem<int>(value: 1, child: Text('Carrito de compra')),
            ],
          ),*/
        ],
      ),
      body: _buildOrderList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('Pedido confirmado');
        },
        label: Text('Confirmar pedido'),
        icon: Icon(Icons.offline_pin),
      ),
    );
  }

  Widget _buildOrderList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.LstOr.length,
        itemBuilder: (context, i) {
          return _buildRow(widget.LstOr[i]);
        });
  }

  Widget _buildRow(Product pdt) {
    return ListTile(
      title: Text(
        pdt.nombre,
        style: _biggerFont,
      ),
      subtitle: Text("COP  " +
          pdt.precio.toString(),
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }
}