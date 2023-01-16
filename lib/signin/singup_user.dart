import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fuel/login/SignIn.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/startup/who_are_you.dart';


class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  _SignUpUserState createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 102, 208, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return WhoAreYou();
            }));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return NavBar();
              }));
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: screenwidth,
            height: screenheight * .4,
            padding: const EdgeInsets.only(bottom:50.0),
            //margin: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: Container(
                width: 400,
                height: 380,
                padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0 ),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignment: Alignment.center,
                child: const Image(image: AssetImage('assets/car 2.jpg'))),
          ),
          Container(
            child: Card(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Container(
                  height: 1200,
                  decoration: const BoxDecoration(
                    color:Color.fromRGBO(62, 102, 208, 1),
                  ),
                  padding: const EdgeInsets.only(left: 20.0, top: 0.0, bottom: 20.0),
                  alignment: Alignment.centerLeft,
                  child: const MyCustomForm(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();


//saving form after validation
//   void _SignIn() {
//     final isValid = _formKey.currentState.validate();
//     if (!isValid) {
//       return;
//     }
//   }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
            child: Text(
              "User Sign Up ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                  return 'Please Correct Name';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'User Name',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
                  return 'Please Enter valid Licence';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Vehical licence / Insurance No',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)){
                  return 'Please enter valid E-mail';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'E-mail',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                  return 'Please Enter vehicle type';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Vehical Type',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[p e t r a l d i s P E T R A L D I S]+$').hasMatch(value!)){
                  return 'Please Correct Fuel type';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Fuel Type',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
                  return 'Please Enter valid phone number';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Phone number',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                  return 'Please Enter current place';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Current Place',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(110, 20, 100, 5),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.blueAccent, width: 5),
                  ),
                ),
              ),
              onPressed: (){
                if (_formKey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SignIn()));
                }
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
