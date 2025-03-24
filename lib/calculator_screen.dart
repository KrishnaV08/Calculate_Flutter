import 'package:calculator_application_1/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String num1 = "";
  String operand = "";
  String num2 = "";
  String history = "";
  var items = [    
    'Basic',
    'Scientific',
    'Conversion',
   
  ];
  String select="Basic";


  void handleChange(newValue) {
    setState(() {
      select=newValue;
    });
    Navigator.pushNamed(context, '/$newValue');
  }



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
        actions: [
          
          DropdownButton(
            alignment: Alignment.topRight,
                value: select,
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    // onTap: () => handleSelection(values),
                    child: Text(items),
                  );
                }).toList(),
              onChanged: (String? newValue) { 
                  handleChange(newValue);
              }
              
              ),],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,

                child: Container(
                  alignment: Alignment.bottomRight,

                  child: Text(
                    history,
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,

                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "$num1$operand$num2".isEmpty ? "0" : "$num1$operand$num2",
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Wrap(
                children:
                    Btn.buttonValues
                        .map(
                          (value) => SizedBox(
                            width:
                                value == Btn.n0
                                    ? screenSize.width / 2
                                    : (screenSize.width / 4),
                            height: screenSize.height / 8,
                            child: buildButton(value),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleTap(value) {
    String allOp = "+-×÷%";
    String allNums = "1234567890.";
    if (value == "AC") {
      setState(() {
        num1 = "";
        operand = "";
        num2 = "";
        history="";
      });
    }else if(value=="-" && num1=="" ) {
      setState(() {
        num1+="-";
      });

    }else if(value=="-" && operand=="×" && num2.isEmpty){
      setState(() {
        num2+="-";
      });

    } else if (allOp.contains(value) && (num2.isNotEmpty || num1.isEmpty)) {
    } else if (value == "⌫") {
      setState(() {
        if (operand.isEmpty) {
          num1 = num1.substring(0, num1.length - 1);
        } else if (!operand.isEmpty && num2.isEmpty) {
          operand = "";
        } else if (!num2.isEmpty) {
          num2 = num2.substring(0, num2.length - 1);
        }
      });
    } else if (value == "=") {
      setState(() {
        String temp=num1;
        if (num2.isEmpty) {
          operand = "";
        } else if (operand == "+") {
          num1 = (double.parse(num1) + double.parse(num2)).toString();
        } else if (operand == "-") {
          num1 = (double.parse(num1) - double.parse(num2)).toString();
        } else if (operand == "×") {
          num1 = (double.parse(num1) * double.parse(num2)).toString();
        } else if (operand == "÷") {
          num1 = (double.parse(num1) / double.parse(num2)).toString();
        } else if (operand == "%") {
          num1 = (double.parse(num1) % double.parse(num2)).toString();
        }
        if(num2.isNotEmpty) {
          history+="$temp$operand$num2\n";
        }
        operand = "";
        num2 = "";
        
      });
    } else if (operand.isEmpty && allNums.contains(value)) {
      setState(() {
        if (value == ".") {
          if (num1.contains(".")) {
          } else if (num1.isEmpty) {
            num1 = "0";
            num1 += value;
          } else {
            num1 += value;
          }
        } else {
          num1 += value;
        }
      });
    } else if (allOp.contains(value) && operand.isEmpty) {
      setState(() {
        operand += value;
      });
    } else if (allNums.contains(value) && operand.length == 1) {
      setState(() {
        if (value == ".") {
          if (num2.isEmpty) {}
          if (num2.contains(".")) {
          } else if (num2.isEmpty) {
            num2 = "0";
            num2 += value;
          } else {
            num2 += value;
          }
        } else {
          num2 += value;
        }
      });
    } else if (allOp.contains(value) && operand.length == 1) {
      setState(() {
        operand = value;
      });
    }
  }

  void holdTap(value) {
    setState(() {
      if(value=="⌫"){
        num1="";
        operand="";
        num2="";
      }
    });
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColor(value),

        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        child: InkWell(
          onTap: () => handleTap(value),
          onLongPress: () => holdTap(value),
          child: Center(
            child: Text(
              value,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Color getBtnColor(value) {
    return [Btn.del, Btn.clr, Btn.per].contains(value)
        ? const Color.fromARGB(255, 129, 129, 129)
        : [
          Btn.multiply,
          Btn.subtract,
          Btn.add,
          Btn.divide,
          Btn.equal,
        ].contains(value)
        ? Colors.orange
        : const Color.fromARGB(255, 58, 58, 58);
  }


  
}

