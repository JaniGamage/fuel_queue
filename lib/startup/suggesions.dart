import 'package:flutter/material.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/startup/neaarest_station.dart';

class Suggesions extends StatelessWidget {
  const Suggesions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(62, 102, 208, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return NearestLocation();
            }));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu,size: 30,color: Colors.white,),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return NavBar();
              }));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Image(image: AssetImage('assets/loc.jpg') , width: 300, height: 300,),
              SingleChildScrollView(
                child: Container(
                  width: screenwidth*.9,
                  height: 600,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(194, 227, 246, 1),
    );
  }
}
