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

    ImageProvider<Object> imgsrc= AssetImage('assets/imgs.png');
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 66, 66, 66),
      

      body:  Padding(
        padding: const EdgeInsets.only(top: 240),
        child: Center(
          
          child: Column(children:[ 
            FadeInImage(placeholder: imgsrc,
            image: imgsrc,height: 80,width: 80,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
              
              child: Text("Basic Calculator"),
              onPressed:() { 
                Navigator.pushNamed(context, "/Basic");
                }),
            ),]
            ),
        ),
      ),
    );
  }
}


