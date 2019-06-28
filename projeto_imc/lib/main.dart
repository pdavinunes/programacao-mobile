import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Calculo do IMC', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String msg = "Digite seu peso e altura";
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  GlobalKey<FormState> formControlador = GlobalKey<FormState>();
  double imc;


  void apagar(){
    setState(() {
      peso.clear();
      altura.clear();
      formControlador = GlobalKey<FormState>();
      msg = "Digite seu peso e altura";
    });
  }

  void calcular(){
    setState(() {
      if(formControlador.currentState.validate()){
        imc = double.parse(peso.text)/(double.parse(altura.text)*double.parse(altura.text));
        msg = 'Seu imc é ${imc.toStringAsPrecision(4)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Calculo IMC"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.refresh), onPressed: apagar)
            ],
            backgroundColor: Colors.purpleAccent),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              key: formControlador,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person, color: Colors.purpleAccent, size: 140),
                TextFormField(
                    validator: (valor){
                      if(valor.isEmpty){
                        return "Peso não fornecido";
                      }
                    },
                    controller: peso,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.purpleAccent, fontSize: 25),
                    decoration: InputDecoration(
                        labelText: "Peso (kg)",
                        labelStyle: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold))),
                TextFormField(
                    validator: (valor){
                      if(valor.isEmpty){
                        return "Altura não fornecida";
                      }
                    },
                    controller: altura,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.purpleAccent, fontSize: 25),
                    decoration: InputDecoration(
                        labelText: "Altura (m)",
                        labelStyle: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold))),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: RaisedButton(
                      onPressed: calcular,
                      child: Text("Calcular!",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      color: Colors.purpleAccent),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(msg, style: TextStyle(
                      fontSize: 20, color: Colors.purpleAccent,
                      fontWeight: FontWeight.bold)),
                )


              ],
            ))
        )
    );
  }
}
