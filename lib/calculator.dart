import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Operator{
  NULL,
  ADD,
  MINUS,
  MULTIPLY,
  DIVIDE
}
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text = "";
  String curr ="";
  double answer =0;
  Operator operator =Operator.NULL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
              child: Text(
            'BASIC CALCULATOR',
            style: TextStyle(
                color: Colors.lightBlue, fontFamily: 'PottaOne', fontSize: 35),
          )),
          SizedBox(
            height: 50,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                height: 120,
                width: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'PottaOne',
                          letterSpacing: 1.5),
                    ),
                    SizedBox(height: 15.0,),
                    Text(
                      answer.toString(),
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontFamily: 'PottaOne',
                          letterSpacing: 1.5),
                    ),
                  ],
                )),
            color: Colors.blueGrey.withOpacity(0.6),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 100,
              width: 700,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: EdgeInsets.all(20),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: CircleBorder(),
                      color: Colors.blue.withOpacity(0.9),
                      child: TextButton(
                        onPressed: () {
                          curr +=index.toString();
                          setState(() {
                            text += index.toString();
                          });
                        },
                        child: Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            child: Text(
                              (index).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontSize: 20),
                            )),
                      ),
                    );
                  })),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: CircleBorder(),
                color: Colors.lightBlueAccent.withOpacity(0.9),
                child: TextButton(
                  onPressed: () {
                    calculateAnswer();
                    setState(() {
                      if(curr.isEmpty)
                        text = text.substring(0,text.length-3);
                      text += ' + ';
                    });
                    curr = "";
                    operator = Operator.ADD;
                  },
                  child: Container(
                      height: 70,
                      width: 70,
                      alignment: Alignment.center,
                      child: Text(
                        ("+").toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 30),
                      )),
                ),
              ),

              SizedBox(
                width: 30,
              ),

              Card(
                shape: CircleBorder(),
                color: Colors.lightBlueAccent.withOpacity(0.9),
                child: TextButton(
                  onPressed: () {
                    calculateAnswer();
                    setState(() {
                      if(curr.isEmpty)
                        text = text.substring(0,text.length-3);
                      text += " - ";
                    });
                    if(answer!=0)
                    operator = Operator.MINUS;
                    curr = "";
                  },
                  child: Container(
                      height: 70,
                      width: 70,
                      alignment: Alignment.center,
                      child: Text(
                        ("-").toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 30),
                      )),
                ),
              ),

              SizedBox(width: 30,),
              Card(
                shape: CircleBorder(),
                color: Colors.lightBlueAccent.withOpacity(0.9),
                child: TextButton(
                  onPressed: () {
                    calculateAnswer();
                    setState(() {
                      if(curr.isEmpty)
                        text = text.substring(0,text.length-3);
                      text += " x ";
                    });
                    if(answer!=0)
                      operator = Operator.MULTIPLY;
                    curr = "";
                  },
                  child: Container(
                      height: 70,
                      width: 70,
                      alignment: Alignment.center,
                      child: Text(
                        ("X").toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 30),
                      )),
                ),
              ),

              SizedBox(width: 30,),
              Card(
                shape: CircleBorder(),
                color: Colors.lightBlueAccent.withOpacity(0.9),
                child: TextButton(
                  onPressed: () {
                    calculateAnswer();
                    setState(() {
                      if(curr.isEmpty)
                        text = text.substring(0,text.length-3);
                      text += " / ";
                    });
                    if(answer!=0)
                      operator = Operator.DIVIDE;
                    curr = "";
                  },
                  child: Container(
                      height: 70,
                      width: 70,
                      alignment: Alignment.center,
                      child: Text(
                        ("/").toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 30),
                      )),
                ),
              ),

              SizedBox(width: 30,),
              Card(
                shape: CircleBorder(),
                color: Colors.lightGreenAccent.withOpacity(0.9),
                child: TextButton(
                  onPressed: () {
                      calculateAnswer();
                      operator = Operator.NULL;
                      curr="";
                      setState(() {
                        text ="";
                      });
                  },
                  child: Container(
                      height: 70,
                      width: 70,
                      alignment: Alignment.center,
                      child: Text(
                        ("=").toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 30),
                      )),
                ),
              ),
              SizedBox(width: 30,),
            ],
          )
        ],
      ),
    );
  }

  void calculateAnswer(){
    try {
      double cur = double.parse(curr);
      switch (operator) {
        case Operator.NULL:
          setState(() {
            answer = cur;
          });
          break;
        case Operator.ADD:
          setState(() {
            answer += cur;
          });
          break;
        case Operator.MINUS:
          setState(() {
            answer -= cur;
          });
          break;
        case Operator.MULTIPLY:
          setState(() {
            answer *= cur;
          });
          break;
        case Operator.DIVIDE:
          setState(() {
            answer /= cur;
          });
          break;
      }
    }catch(e){
      print(e);
    }
  }
}

