import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  List<Widget> bottomIcons = [
    Icon(Icons.home)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0xFFFFF950),
          title: Center(child: Text(
            'login',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 30.0,
                letterSpacing: 7.0
            ),
          )
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            children: [
              Center(
                child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 7.0
                    )
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFA4FDAA),
                    hintStyle: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 7.0
                    ),
                    hintText: 'phone number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFA4FDAA),
                    hintStyle: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 7.0
                    ),
                    hintText: 'Passwod',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width : 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                ),
              ),
              SizedBox(
                height: 60.0,
              ),

            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 50.0,
              color: Color(0xFFFFF950)
          ),
        )
    );
  }
}