import 'dart:ui';

import 'package:calculator_application_1/button.dart';
import 'package:calculator_application_1/models/exchange.dart';
import 'package:calculator_application_1/services/remote_services.dart';
import 'package:flutter/material.dart';

class Conversion extends StatefulWidget {
  const Conversion({super.key});

  @override
  State<Conversion> createState() => ConversionState();
}

class ConversionState extends State<Conversion> {
  String num1 = "";

  String num2 = "";

  bool isDark=true;

  Exchange? rates;

  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    rates = await RemoteServices().getRates();
    if (rates != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  var items = ['Basic',  'Conversion'];
  String select = "Conversion";


  String first = "usd";
  String second = "usd";

  String? firstSelect;
  String? secondSelect;

  void handleChange(newValue) {
    setState(() {
      select = newValue;
    });
    Navigator.pushNamed(context, '/$newValue');
  }

  void firstChage(newValue) {
    setState(() {
      firstSelect = newValue;
      first = firstSelect as String;
      num1 = "0";
      num2 = "0";
    });
    handleTap("AC");
  }

  void secondChange(newValue) {
    setState(() {
      secondSelect = newValue;
      second = secondSelect as String;
      num2 = "0";
      num1 = "0";
    });
    handleTap("AC");
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // print(rates?.conversionRates);

    return Scaffold(
      backgroundColor: isDark?Colors.black:const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        actions: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              child: Icon(
                Icons.bedtime,
                color: isDark?Colors.deepPurple:Colors.purpleAccent,
                size: 24.0,
                // color: isDark?Colors.grey:const Color.fromARGB(255, 101, 101, 101),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark?const Color.fromARGB(255, 139, 139, 139):const Color.fromARGB(255, 92, 92, 92),
                 ),
            ),
          ),

          DropdownButton(
            alignment: Alignment.topRight,
            value: select,
            
            // Array list of items
            items:
                items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    // onTap: () => handleSelection(values),
                    child: Text(items),
                    
                  );
                }).toList(),
            onChanged: (String? newValue) {
              handleChange(newValue);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  // width: screenSize.width,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              num1.isEmpty ? "0" : num1,
                              style: TextStyle(fontSize: 48,
                                color:
                            isDark == true
                                ? const Color.fromARGB(255, 196, 196, 196)
                                : const Color.fromARGB(255, 90, 90, 90),
                              
                              ),
                              
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              num2.isEmpty ? "0" : num2,
                              style: TextStyle(fontSize: 48,
                              color:
                            isDark == true
                                ? const Color.fromARGB(255, 196, 196, 196)
                                : const Color.fromARGB(255, 90, 90, 90),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          DropdownButton(
                            alignment: Alignment.topRight,
                            value: firstSelect,
                            hint: Text("Select a currency",style: TextStyle(color: isDark?Colors.grey:const Color.fromARGB(255, 91, 91, 91)),),
                            style: TextStyle(color: isDark?Colors.grey:const Color.fromARGB(255, 91, 91, 91)),
                            // Array list of items
                            items:
                                rates?.conversionRates.keys.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    // onTap: () => handleSelection(values),
                                    child: Text(items,style: TextStyle(color:const Color.fromARGB(255, 212, 212, 212)),),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              firstChage(newValue);
                            },
                          ),
                      
                          DropdownButton(
                            alignment: Alignment.topRight,
                            value: secondSelect,
                            hint: Text("Select a currency",style: TextStyle(color: isDark?Colors.grey:const Color.fromARGB(255, 91, 91, 91)),),
                            style: TextStyle(color: isDark?Colors.grey:const Color.fromARGB(255, 91, 91, 91)),
                            // Array list of items
                            items:
                                rates?.conversionRates.keys.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    // onTap: () => handleSelection(values),
                                    child: Text(items,style: TextStyle(color: const Color.fromARGB(255, 203, 203, 203)),),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              secondChange(newValue);
                            },
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              String? temp = firstSelect;
                              firstSelect = secondSelect;
                              secondSelect = temp;
                              temp = num1;
                              num1 = num2;
                              num2 = temp;
                              handleTap("Enter");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("🔃", style: TextStyle(fontSize: 20, color: isDark?Colors.grey:const Color.fromARGB(255, 91, 91, 91))),
                          ),
                          style: ElevatedButton.styleFrom(
                backgroundColor: isDark?const Color.fromARGB(255, 90, 90, 90):const Color.fromARGB(255, 205, 205, 205),
                 ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: screenSize.height / 2,

              child: Wrap(
                children:
                    Btn.conversionValues
                        .map(
                          (value) => SizedBox(
                            width:
                                (value == Btn.clr || value == Btn.del)
                                    ? (screenSize.width / 2)
                                    : (screenSize.width / 3),
                            height: screenSize.height / 9,
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
    setState(() {
      if (value == "RESET") {
        num1 = "";
        num2 = "";
        firstSelect = null;
        secondSelect = null;
      } else if (value != "AC") {
        if (value == "⌫") {
          (num1.length > 1)
              ? num1 = num1.substring(0, num1.length - 1)
              : handleTap("AC");
        } else if (value == "Enter") {
        } else {
          num1 += value;
        }

        // if((first=="pounds" || first=="aud" ) && value=="AC"){
        //   num1="";
        //   num2="";
        // }

        num2 = (double.parse(num1) *
                ((rates?.conversionRates[secondSelect] ?? 1.0) /
                    (rates?.conversionRates[firstSelect] ?? 1.0)))
            .toStringAsFixed(3);
        // num1=double.parse(num1).toStringAsFixed(1);
      } else {
        num1 = "";
        num2 = "";
      } 
    });
  }

  void holdTap(value) {
    setState(() {
      if (value == "⌫") {
        num1 = "";
        num2 = "";
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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
              color:
                    isDark
                        ?  const Color.fromARGB(255, 221, 221, 221)
                        : value!="RESET" ?const Color.fromARGB(255, 94, 94, 94):const Color.fromARGB(255, 221, 221, 221),
                        ),
            ),
          ),
        ),
      ),
    );
  }

  Color getBtnColor(value) {
    return [Btn.del, Btn.clr, Btn.per].contains(value)
        ? isDark
            ? const Color.fromARGB(255, 129, 129, 129)
            : const Color.fromARGB(255, 160, 160, 160)
        : [
          Btn.multiply,
          Btn.subtract,
          Btn.add,
          Btn.divide,
          Btn.equal,
          "Enter",
        ].contains(value)
        ? isDark
            ? Colors.orange
            : const Color.fromARGB(255, 252, 157, 15)
        : value == "RESET"
        ? isDark? const Color.fromARGB(255, 255, 58, 58):const Color.fromARGB(255, 255, 60, 60)
        : isDark == true
        ? const Color.fromARGB(255, 58, 58, 58)
        : const Color.fromARGB(255, 201, 201, 201);
  }
}
