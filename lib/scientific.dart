import 'package:flutter/material.dart';

class Scientific extends StatefulWidget {
  const Scientific({super.key});

  @override
  State<Scientific> createState() => _ScientificState();
}

class _ScientificState extends State<Scientific> {

  var items = [    
    'Basic',
    'Scientific',
    'Conversion',
   
  ];
  String select="Scientific";


  void handleChange(newValue) {
    setState(() {
      select=newValue;
    });
    Navigator.pushNamed(context, '/$newValue');
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
    );
  }
}