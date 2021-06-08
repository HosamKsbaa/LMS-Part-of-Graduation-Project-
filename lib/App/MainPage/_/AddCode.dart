import  'package:flutter/material.dart';

  
class AddCode extends StatelessWidget {
  const AddCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Row(children: [
              Padding( padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.link
                ),
                
              ),
             Text("Join by Code",
             style: TextStyle(fontSize: 18)
              ),
              ]),
            
            ),
            body: Column (
               mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Center(
                  child: Container(

                    child:  Column(children: [

                       
                    Padding( padding:  EdgeInsets.only(top: 70),
                      child: Container(
                        width: 280,
                        child: TextField(
                          decoration : InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          fillColor: Colors.white,
                          hintText: "Code",
                          suffixIcon: Icon(Icons.link),
                          filled: true
                            ),
                        )
                      )
                    ),

                    Padding( padding: EdgeInsets.only(top: 50),
                      child: FlatButton(
                        onPressed: ()=>{
                          
                        },
                        child: Container(
                            child: Center(child: Text("Add")),
                           width: 100,
                           height: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.white,
                             border: Border.all(
                             width: 1.0, color: const Color(0xff707070)),
                           ),
                         )
                      )
                    ),
                         
                         






                    ],),

                    width: 350,
                    height: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33.0),
                      gradient: LinearGradient(
                        begin: Alignment(-0.89, -0.78),
                        end: Alignment(0.88, 0.84),
                        colors: [
                          const Color(0xff03a1ee),
                          const Color(0xffcb4848)
                        ],
                        stops: [0.0, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  )
                )


              
            ],) 
        )
    );
     
  }
}
