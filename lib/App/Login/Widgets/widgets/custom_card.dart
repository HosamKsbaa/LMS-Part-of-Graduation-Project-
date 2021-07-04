import 'package:flutter/material.dart';



class CustomCard extends StatelessWidget {
  const CustomCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding( padding : EdgeInsets.only(top:10),
      child:Card(
        child: ListTile(
          onTap: () => {},
            leading: Image(image: AssetImage("assets/id.png.png")),
          title: Text("Mohameed Ahmed Ibrahim",
          style : TextStyle(fontSize: 18)
          ),
          subtitle: Column(children: [
              Row(children: [
               Padding( padding : EdgeInsets.only(top: 5),
               child: Icon(Icons.account_balance, size:15),
             ),
             Padding( padding : EdgeInsets.only(left: 8, top: 5),
               child: Text("Ahram Canadian University",
               style : TextStyle(fontSize: 18))
             ),
               
            ],),
               Row(children: [
              Padding( padding : EdgeInsets.only( top:5),
              child: Icon(Icons.supervisor_account, size:20)
            ),
             Padding( padding : EdgeInsets.only(left: 8, top: 5),
               child: Text("Student",
               style : TextStyle(fontSize: 18))
             )
             ])
              
              ],)
            )
          )
      );
    
  }
}