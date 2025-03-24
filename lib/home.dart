import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  var items = [    
    'Basic',
    'Scientific',
    'Conversion',
   
  ];
  String select="Home";


  void handleChange(newValue) {
    setState(() {
      select=newValue;
    });
    Navigator.pushNamed(context, '/$select');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body:  Center(child: ElevatedButton(
        child: Text("Basic Calculator"),
        onPressed:() { 
          Navigator.pushNamed(context, "/Basic");
          }),
        ),
    );
  }
}


