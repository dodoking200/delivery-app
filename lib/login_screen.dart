import 'package:flutter/material.dart';
import 'Register_Screen.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF950),
        title: Center(
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.grey, fontSize: 30.0, letterSpacing: 7.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Form(
            key: _formKey,  // Use the form key here
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Welcome',
                    style: TextStyle(fontSize: 30.0, letterSpacing: 7.0),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
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
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
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
                    hintText: 'Password',
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
                    child: Text('Sign in'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // perform login here
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: Row(
                    children: [
                      Text('Don\'t have an account? '),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text('Register now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0, color: Color(0xFFFFF950)),
      ),
    );
  }
}
