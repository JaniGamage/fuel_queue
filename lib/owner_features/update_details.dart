
import 'package:flutter/material.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/owner_features/owner_dashboard.dart';
import 'package:fuel/user_features/user_dashboard.dart';
import 'package:widget_mask/widget_mask.dart';

List<String> items = [
  "Petral oct 92" , "Petal oct 95" , "Super diesel" , "Diesel"
];
final _formKey = GlobalKey<FormState>();
class UpdateDetails extends StatefulWidget {
  const UpdateDetails({Key? key}) : super(key: key);
  @override
  State<UpdateDetails> createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  String dropdownValue = "Petral oct 92";
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return UserDashboard();
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20,),
              WidgetMask(
                blendMode: BlendMode.srcATop,
                  childSaveLayer: true,
                  mask: Image(image: AssetImage('assets/logo.jpg') , width: 350, height: 350,),
                  child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        color: Color.fromRGBO(62, 102, 208, 1),
                      ),)
                      //child: Image(image: AssetImage('assets/logo.jpg') , width: 350, height: 350,))
              ),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 20,),
                    Text('Update Detais' , style: TextStyle(fontSize: 30.0 , color: Colors.white , fontWeight: FontWeight.bold)),
                    Text('Fuel Type:' , style: TextStyle(fontSize: 25.0 , color: Colors.white )),
                    DropdownButton<String>(
                      onChanged: (String? newValue){
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      value: dropdownValue,
                      style: TextStyle(color: Colors.black , fontSize: 20),
                      icon: Icon(Icons.arrow_drop_down , color: Colors.black, size: 40,),
                      items: items.map<DropdownMenuItem<String>>(
                              (String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                    Text('Fuel arrival time:' , style: TextStyle(fontSize: 25.0 , color: Colors.white )),
                    Container(
                      width: 200,
                      height: 30,
                      child: TextFormField(
                        decoration: const InputDecoration(
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          return (value != null ) ? 'Please enter a arrival time' : null;
                        },
                      ),
                    ),
                    Text('Current Capacity:' , style: TextStyle(fontSize: 25.0 , color: Colors.white )),
                    Container(
                      width: 200,
                      height: 30,
                      child: TextFormField(
                        decoration: const InputDecoration(
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          return (value != null ) ? 'Please enter current capacity' : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20 , top: 30),
                      child: TextButton(onPressed: (){
                        if (_formKey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerDashboard()));
                        }
                      },
                          child: Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(border: Border.all(color: Colors.white) , borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: Center(child: Text("Submit" , style: TextStyle(color: Colors.white),)))),
                    )
                  ],
                ),
                width: screenwidth*.8,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromRGBO(62, 102, 208, 1),
                ),
              )
              // Container(
              //   width: 300,
              //     height: 300,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Colors.pink
              //     ),
              //     child: Image(image: AssetImage('assets/logo.jpg') , width: 350, height: 350,)),
            ],
          )
        ],
      ),
    );
  }
}
