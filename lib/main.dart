import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H-Company',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var _selected = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("H-Company"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _displayDialog(context);
              },
              child: Text("Integrantes del equipo"),
            ),
            Text(_selected)
          ],
        ),
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    _selected = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: SimpleDialog(
            title: Text('Integrantes'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "Juan Jesus Vazquez Lozoria");
                },
                child: const Text('Juan Jesus Vazquez Lozoria'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "Rosa María Medina Rodríguez");
                },
                child: const Text('Rosa María Medina Rodríguez'),
              ),
            ],
            elevation: 10,
            //backgroundColor: Colors.green,
          ),
        );
      },
    );

    if (_selected != null) {
      setState(() {
        _selected = _selected;
      });
    }
  }
}
