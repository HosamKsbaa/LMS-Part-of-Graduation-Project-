import 'package:flutter/material.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Row(children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.book,
                ),
              ),
              Text('My Courses')
            ]),
          ),
          body: FlatButton(
      onPressed: () =>{},
     child: Card(
       child: Container(
         
           width: 400,
         height: 120,
           child:  Row(children: [
             Padding( padding : EdgeInsets.only(right: 10),
             child: Image(image: AssetImage("assets/images/icon3.png") , width: 100, height :100)
           ),
             Column(children: [
             Padding( padding: EdgeInsets.only(top: 8),
               child: Text("Operating Systems",
               style:  TextStyle(fontSize: 18),),
             ),
            Row(children: [
              Icon(Icons.account_circle),
              Text("Dr.Mohamed Ahmed ",
             style:  TextStyle(fontSize: 18),)
              ],),
              Row(children: [
              Icon(Icons.account_balance),
              Text("Hall 1208",
             style:  TextStyle(fontSize: 18),)
              ],),
              Row(children: [
              Icon(Icons.timer),
              Text("9 AM",
             style:  TextStyle(fontSize: 18),)
              ],)
             ],)
             ],),
         )
     )

     )));

  }
}