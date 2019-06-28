import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _msg = "Pode entrar!";

  void _qtdPessoas(int acao) {
    setState(() {
      _pessoas += acao;

      if (_pessoas >= 10) {
        _msg = "Lotado!";
        _pessoas = 10;
      } else if (_pessoas >= 0) {
        _msg = "Pode Entrar!";
      } else {
        _msg = "Mundo Invertido";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("img/croco-bit.jpg", fit: BoxFit.cover, height: 1000),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $_pessoas',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.none)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    onPressed: () => {_qtdPessoas(1)}),
                FlatButton(
                    child: Text(" -1",
                        style: TextStyle(color: Colors.white, fontSize: 40.0)),
                    onPressed: () => {_qtdPessoas(-1)})
              ],
            ),
            Text(
              _msg,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none
              ),
            )
          ],
        ),
      ],
    );
  }
}
