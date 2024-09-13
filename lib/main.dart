import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculadoraHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculadoraHome extends StatefulWidget {
  @override
  _CalculadoraHomeState createState() => _CalculadoraHomeState();
}

class _CalculadoraHomeState extends State<CalculadoraHome> {
  String _output = "0";
  String _operand = "";
  double _num1 = 0;
  double _num2 = 0;

  buttonPressed(String buttonText) {
  if (buttonText == "CLEAR") {
    _output = "0";
    _num1 = 0;
    _num2 = 0;
    _operand = "";
  } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
    _num1 = double.parse(_output);
    _operand = buttonText;
    _output = "0";
  } else if (buttonText == ".") {
    if (_output.contains(".")) {
      return;
    } else {
      _output = _output + buttonText;
    }
  } else if (buttonText == "=") {
    _num2 = double.parse(_output);

    if (_operand == "+") {
      _output = (_num1 + _num2).toString();
    }
    if (_operand == "-") {
      _output = (_num1 - _num2).toString();
    }
    if (_operand == "x") {
      _output = (_num1 * _num2).toString();
    }
    if (_operand == "/") {
      _output = (_num1 / _num2).toString();
    }

    _num1 = 0;
    _num2 = 0;
    _operand = "";
  } else {
    if (_output == "0") {
      _output = buttonText;
    } else {
      _output = _output + buttonText;
    }
  }

  setState(() {
    // Mantener la cadena como tal, sin convertir a número
  });
}


  Widget buildButton(String buttonText) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(8.0), // Agrega padding alrededor del botón
      child: OutlinedButton(
        child: Padding(
          padding: EdgeInsets.all(24.0), // Padding interno del botón
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x")
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+")
                ],
              ),
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
