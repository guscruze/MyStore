import 'package:flutter/material.dart';
import 'package:aprendiendomystore/persistence/server_connection.dart';

void main () => runApp(SuggestionView());

class SuggestionView extends StatelessWidget {
  const SuggestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Sugerencias';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.purple[800],
        ),
        body: const MySuggestionForm(),
      ),
    );
  }
}

class MySuggestionForm extends StatefulWidget {
  const MySuggestionForm({Key? key}) : super(key: key);

  @override
  MySuggestionFormState createState() {
    return MySuggestionFormState();
  }
}

class MySuggestionFormState extends State<MySuggestionForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name,_suggestion;

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
              const Text ('Nombre', style: TextStyle(fontSize: 30),),
            ],
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor agregue un texto';
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
              Icon(Icons.live_help ,size:50,color:Colors.purple[800],),
              const Text ('Sugerencia', style: TextStyle(fontSize: 30),),
            ],
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor agregue un texto';
              }else{
                setState(() {
                  this._suggestion = value;
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
                  srvcon.insertSuggestion('Suggestions', this._name+';'+this._suggestion).then ((value){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sugerencia enviada')),
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