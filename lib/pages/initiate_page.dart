import 'package:flutter/material.dart';
import 'game_page.dart';

class InitiatePage extends StatefulWidget {
  @override
  _InitiatePageState createState() => _InitiatePageState();
}

class _InitiatePageState extends State<InitiatePage> {
  final _player1Controller = TextEditingController();
  final _player2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Player Names'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _player1Controller,
                decoration: InputDecoration(labelText: 'Player 1 Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Player 1 name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _player2Controller,
                decoration: InputDecoration(labelText: 'Player 2 Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Player 2 name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(
                          player1Name: _player1Controller.text,
                          player2Name: _player2Controller.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Play'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
