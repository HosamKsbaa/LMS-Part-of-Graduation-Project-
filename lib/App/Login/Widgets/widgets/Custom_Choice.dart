import 'package:flutter/material.dart';


class Choice extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Padding( padding: EdgeInsets.only(left: 20),
                  child:Row(
                    children:[ Container(
                                 width: 150 ,
                                 height: 70,
                                 child: TextField(
                     decoration: InputDecoration(
                       hintText: "First Choice",
                       filled: true,
                       fillColor: Colors.white,
                       enabledBorder: OutlineInputBorder(
                         borderSide : BorderSide(color: Colors.blueAccent),
                         borderRadius: BorderRadius.all(Radius.circular(30)),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderSide : BorderSide(color: Colors.blueAccent),
                         borderRadius: BorderRadius.all(Radius.circular(30)),
                       ),
                     )
                     )
                               )
                                  ,
                     Padding( padding: EdgeInsets.only(left: 50),
                     child: IconButton(
                               icon: const Icon(Icons.add_circle_outline),
                               tooltip: 'Capture a photo',
                               iconSize: 35,
                               color:  const Color(0xff33cef5),
                               onPressed: () {
                               }
                              ),
                                   ),
                  
                            Padding( padding: EdgeInsets.only(left: 10),
                              child: IconButton(
                               icon: const Icon(Icons.beenhere),
                               tooltip: 'Capture a photo',
                               iconSize: 35,
                               color : Colors.green,
                               onPressed: () {
                               }
                              )
                            )
                   ]
                  )
                  );
    
  }
}