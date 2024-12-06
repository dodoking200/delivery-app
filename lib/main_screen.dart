import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Color(0xFFFFF950),

       leading:  IconButton(icon: Icon(Icons.search) ,onPressed:(){print('hello');} ,color: Color(0xFF000000) ),

       actions: [Container(child: IconButton(icon: Icon(Icons.person) ,onPressed:(){print('hello');} , color: Color(0xFF000000))),

       ],

     ),
       body: Center(child: Text('hi')),

       bottomNavigationBar: BottomAppBar(
         color: Color(0xFFFFF950),
         child: Row(
           children: [
             Expanded(child: IconButton(icon: Icon(Icons.home) ,onPressed:(){print('hello');} ,)),
             Expanded(child: IconButton(icon: Icon(Icons.store) ,onPressed:(){print('hello');} ,)),
             Expanded(child: IconButton(icon: Icon(Icons.shop_two) ,onPressed:(){print('hello');} ,)),
             Expanded(child: IconButton(icon: Icon(Icons.favorite) ,onPressed:(){print('hello');} ,))
           ],
         ),
       ),
   );
  }
}