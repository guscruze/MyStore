import 'package:flutter/material.dart';
import 'package:aprendiendomystore/persistence/server_connection.dart';

void main () => runApp(CustomerFormView());

class CustomerFormView extends StatelessWidget {
  const CustomerFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Registro de clientes';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.purple[800],
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name,_address,_cellphone,_email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_pin_rounded ,size:50,color:Colors.purple[800],),
              const Text ('Nombre del Cliente', style: TextStyle(fontSize: 30),),
            ],
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pro favor agregue un texto';
              }else{
                setState(() {
                  this._name = value;
                });
              }return null;
            },
          ),
          SizedBox(width: 100.0,
            height: 50.0,),
          Row(
            children: [
              Icon(Icons.home ,size:50,color:Colors.purple[800],),
              const Text ('Direccion', style: TextStyle(fontSize: 30),),
            ],
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pro favor agregue un texto';
              }else{
                setState(() {
                  this._address = value;
                });
              }return null;
            },
          ),
          SizedBox(width: 100.0,
            height: 50.0,),
          Row(
            children: [
              Icon(Icons.phone ,size:50,color:Colors.purple[800],),
              const Text ('Telefono', style: TextStyle(fontSize: 30),),
            ],
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pro favor agregue un texto';
              }else{
                setState(() {
                  this._cellphone = value;
                });
              }return null;
            },
          ),
          SizedBox(width: 100.0,
            height: 50.0,),
          Row(
            children: [
              Icon(Icons.email ,size:50,color:Colors.purple[800],),
              const Text ('Email', style: TextStyle(fontSize: 30),),
            ],
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pro favor agregue un texto';
              }else{
                setState(() {
                  this._email = value;
                });
              }return null;
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var srvcon=ServerConnection();
                  srvcon.insert('Customers', this._name+';'+this._address+';'+this._cellphone+';'+this._email).then ((value){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Datos insertados en el servidor')),
                    );
                  });
                }
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}