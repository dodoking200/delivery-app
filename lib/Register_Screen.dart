import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
final _formKey = GlobalKey<FormState>();
class _RegisterScreenState extends State<RegisterScreen> {
  File _selectedImage;

Future<void> _pickImage() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  if (result != null && result.files.single.path != null) {
    setState(() {
      _selectedImage = File(result.files.single.path); // this part isn't working , it supposed to put the selected image in the image avatar
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFF950),
          title: Center(
              child: Text(
                'login',
                style: TextStyle(
                    color: Colors.grey, fontSize: 30.0, letterSpacing: 7.0),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(60.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  imageProfile(),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Name is required';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'Name must contain only letters and spaces';
                      }
                      return null; // Return null if validation passes
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFA4FDAA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      hintText: 'Full name',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Phone number is required';
                      } else if (value.length != 10) {
                        return 'Phone number should be 10 digits';
                      } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                        return 'Phone number should only contain digits';
                      }
                      return null; // Return null if validation passes
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFA4FDAA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Location is required';
                      }
                      return null; // Return null if validation passes
                    },
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFA4FDAA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      hintText: 'location',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null; // Return null if validation passes
                    },
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFA4FDAA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      hintText: 'password',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 40.0,
                    color: Colors.blue,
                    width: double.infinity,
                    child: MaterialButton(

                      child: Text(
                          'Submit'
                      ),
                      onPressed: (){
                        if (_formKey.currentState.validate()) {

                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(height: 50.0, color: Color(0xFFFFF950)),
        ));

  }
  Widget imageProfile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _pickImage,  // Trigger image picking when tapped
            child: _selectedImage == null
                ? CircleAvatar(
              radius: 100,  // Size of the circle
              backgroundColor: Color(0xFFA4FDAA),  // Green background
              child: Icon(
                Icons.person,  // Icon when no image is selected
                size: 60,  // Icon size
                color: Colors.white,  // Icon color
              ),
            )
                : ClipOval(
              child: Image.file(
                _selectedImage,
                width: 200,  // Width of the avatar
                height: 200,  // Height of the avatar
                fit: BoxFit.cover,  // Ensures the image fits inside the circle
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }



}
