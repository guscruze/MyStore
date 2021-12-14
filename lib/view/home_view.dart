import 'package:aprendiendomystore/model/store.dart';
import 'package:aprendiendomystore/persistence/database_manager.dart';
import 'package:aprendiendomystore/view/stores_view.dart';
import 'package:aprendiendomystore/view/suggestions_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'customer_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> images = [
    "images/listado_tiendas.png",
    "images/generar_pedido.png",
    "images/registro_clientes.png",
    "images/buzon_sugerencias.png"
  ];

  @override
  void initState(){
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen(
        (message) {
          if (message.notification != null){
            print(message.notification!.body);
            print(message.notification!.title);
          }
          print(message);
        },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
        (messagge) {
          final routeMessagge = messagge.data["route"];
          print(routeMessagge);
          Navigator.of(context).pushNamed(routeMessagge);
        },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tienda mi barrio"),
          backgroundColor: Colors.purple[800],
        ),
        body: Container(
            padding: EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 24.0,
              ),
              itemBuilder: (context, index) => buildCell(context, index),
            )),
      ),
    );
  }

  Widget buildCell(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _navigateTo(context, index);
      }, // handle your image tap here
      child: Image.asset(
        images[index],
        fit: BoxFit.cover, // this is the solution for border
        width: 110.0,
        height: 110.0,
      ),
    );
  }

  _navigateTo(context, int index) {

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresListView()),
      );
    }

    else if(index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresListView()),
      );
    }

    else if(index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomerFormView()),
      );
    }

    else if(index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuggestionView()),
      );
    }
    return;
  }
}