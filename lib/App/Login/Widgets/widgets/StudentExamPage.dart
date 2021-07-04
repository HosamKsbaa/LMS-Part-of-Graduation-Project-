// import 'package:flutter/material.dart';
//
//
//
// class Exam extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             resizeToAvoidBottomInset: false,
//             appBar: AppBar(
//               title: Row(children: [
//                  Padding(padding: EdgeInsets.only( right: 5),
//                    child: Icon(Icons.laptop_windows,
//                    size: 18,
//
//                    ),
//                  ),
//
//                  Padding( padding: EdgeInsets.only(right: 100),
//                    child: Text('Operating Systems',
//                    style: TextStyle(fontSize: 18),)
//                  ),
//
//                   Padding( padding: EdgeInsets.only(right: 5),
//                     child: Icon(Icons.timer,
//                     size: 20,),
//                   ),
//
//                   Text("30:00",
//                   style: TextStyle(fontSize: 18),)
//               ]),
//                backgroundColor:  const Color(0xff104987),
//             ),
//             body: Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//
//       children: [
//
//         Padding( padding: EdgeInsets.only(bottom: 20 , right : 180),
//           child: Container(
//             child: Row(children: [
//
//               Padding( padding: EdgeInsets.only(left: 5),
//                 child: Text("Questions",
//                 style: TextStyle(fontSize: 20),),
//               ),
//               Padding( padding: EdgeInsets.only(left: 5),
//                 child: Text("1",
//                 style: TextStyle(fontSize: 20),),
//               ),
//              Padding( padding: EdgeInsets.only(left: 5),
//                 child: Text("/",
//                 style: TextStyle(fontSize: 20),),
//               ),
//               Padding( padding: EdgeInsets.only(left: 5),
//                 child: Text("20",
//                 style: TextStyle(fontSize: 20),),
//               ),
//
//
//             ],),
//
//             width: 170,
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30.0),
//               color: const Color(0xffffb0b0),
//               border: Border.all(width: 1.0, color: const Color(0xff707070)),
//             )
//             ),
//         ),
//
//
//
//
//         Padding( padding: EdgeInsets.only(bottom: 120),
//           child: Center(
//             child: Container(
//               child: Column(children: [
//
//                Padding( padding: EdgeInsets.only(top: 20),
//                 child: Text("Which layer is responsible for routing ?",
//                 style: TextStyle(fontSize: 18),),
//               ),
//
//              Padding( padding: EdgeInsets.only(top: 15, left: 10),
//                child: Row(
//                  children : [
//                  Radio() ,
//                 Padding( padding: EdgeInsets.only(left: 2),
//                  child: Text("Network Layer",
//                  style: TextStyle(fontSize: 18),),
//                )
//                  ]),
//              ),
//               Padding( padding: EdgeInsets.only(top: 15, left: 10),
//                child: Row(
//                  children : [
//                  Radio() ,
//                 Padding( padding: EdgeInsets.only(left: 2),
//                  child: Text("Datalink Layer",
//                  style: TextStyle(fontSize: 18),),
//                )
//                  ]),
//              ),
//               Padding( padding: EdgeInsets.only(top: 15, left: 10),
//                child: Row(
//                  children : [
//                  Radio() ,
//                 Padding( padding: EdgeInsets.only(left: 2),
//                  child: Text("Transport Layer",
//                  style: TextStyle(fontSize: 18),),
//                )
//                  ]),
//              ),
//               Padding( padding: EdgeInsets.only(top: 15, left: 10),
//                child: Row(
//                  children : [
//                  Radio() ,
//                 Padding( padding: EdgeInsets.only(left: 2),
//                  child: Text("Physical Layer",
//                  style: TextStyle(fontSize: 18),),
//                )
//                  ]),
//              ),
//
//
//                Padding( padding: EdgeInsets.only(top: 55 , left: 20),
//                  child: Row(
//                    children:[
//
//                        Padding( padding: EdgeInsets.only(left: 20),
//                          child: IconButton(
//                              icon: const Icon(Icons.arrow_forward_ios),
//                              tooltip: 'Next Question',
//                              iconSize: 40,
//                              color:  const Color(0xff33cef5),
//                              onPressed: () {
//                              }
//                             )
//                        ),
//
//                        Padding( padding: EdgeInsets.only(left: 40),
//                          child: FlatButton(
//                           onPressed: () => {},
//                            child: Container(
//                              child: Row(children: [
//
//                              Padding( padding: EdgeInsets.only(left: 19),
//                                child: Text("Submit",
//                                style: TextStyle(fontSize: 18),)
//                              )
//
//
//
//                              ],),
//                              width: 100,
//                              height: 50,
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(26.0),
//                                color: const Color(0xffffb0b0),
//                                border: Border.all(width: 1.0, color: const Color(0xff707070)),
//                              ),
//                              )
//                                                 )
//                          )
//
//
//
//                  ])
//                )
//
//
//
//
//               ],),
//
//
//               width: 350,
//               height: 450,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(19.0),
//                 color: const Color(0xffffffff),
//                 border: Border.all(width: 1.0, color: const Color(0xff707070)),
//               ),
//             )
//           ),
//         ),
//
//
//     ],)
//         )
//     );
//   }
// }
//
