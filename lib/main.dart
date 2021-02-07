import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _contadorPessoas = 0;
  String _infoTexto = "Pode entrar!";
  
  void changeCount(int sinal){
    setState(() {
      _contadorPessoas += sinal;
      changeText();
    });
  }

  void changeText(){
    if(_contadorPessoas > 5){
      _infoTexto = "Lotado, aguarde!";
    }
    else if(_contadorPessoas<0){
      _infoTexto = "Clickou errado, amigo?";
    }
    else{
      _infoTexto = "Pode entrar!";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pessoas: $_contadorPessoas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding: EdgeInsets.all(10.0), 
                  child: FlatButton(
                    child: Text("+1", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0)),
                    onPressed: (){changeCount(1);},
                  )
                ),
                Padding(
                  padding: EdgeInsets.all(10.0), 
                  child: FlatButton(
                    child: Text("-1", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0)),
                    onPressed: (){changeCount(-1);},
                  )
                )
              ]
            ),
            Text(_infoTexto, style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0))
          ],
        )
      ]
    );
  }
}

