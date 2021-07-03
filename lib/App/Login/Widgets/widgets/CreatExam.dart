import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Custom_Choice.dart';



void main() => runApp((CreateExam()));



class CreateExam extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Row(children: [
                
             Text("Network II",
             style: TextStyle(fontSize: 25)

             ),
    
              ]),
              
            ),
            body: Column(
  
  mainAxisAlignment: MainAxisAlignment.center,
      children: [

        
       Padding( padding:  EdgeInsets.only(bottom: 40),
         child: Center(
         child : Container(
           child:  Column(children: [
           
           Padding( padding:  EdgeInsets.only(top: 5 , right : 170),
             child: Text("Question 1",
             style: TextStyle(fontSize: 25,
             color: Colors.white
             )
             ),
           ),

           Padding( padding: EdgeInsets.only(top: 10),
             child: Container(
               width: 320 ,
               height: 70,
               child: TextField(
                 decoration: InputDecoration(
                   hintText: "Type your Question",
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
           ),

       
         Row(
           children :[ 
            Padding( padding: EdgeInsets.only(left: 200),
              child: IconButton(
                        icon: const Icon(Icons.add_photo_alternate),
                        tooltip: 'Insert a photo',
                        iconSize: 30,
                        color:  const Color(0xff33cef5),
                        onPressed: () {
                        }
                       ),
            ),


            IconButton(
            icon: const Icon(Icons.add_a_photo),
            tooltip: 'Capture a photo',
            iconSize: 25,
            color:  const Color(0xff33cef5),
            onPressed: () {
            }
           )
           ]),

           Row(
             children: [


                Padding( padding: EdgeInsets.only(left: 20),
                  child: Container(
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
                ),

                 Padding( padding: EdgeInsets.only(left: 50),
                   child: IconButton(
                             icon: const Icon(Icons.add_circle_outline),
                             tooltip: 'Capture a photo',
                             iconSize: 35,
                             color:  const Color(0xff33cef5),
                             onPressed: () {

                                Choice();
                              
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
          ),

             ],
                    
             ),
              Choice(),
               Choice(),
                Choice()
        




           ],),
           width: 370,
           height: 500,
          decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(29.0),
         color: const Color(0xff104987),
         border: Border.all(width: 1.0, color: const Color(0xff104987)),
          ),
         )
          ),
       ),
    
    ])
        )
    );
  }
}
