import 'package:flutter/material.dart';
import 'package:flutter_application/utils/route.dart';
import 'package:velocity_x/velocity_x.dart';
class LoginPage extends StatefulWidget {
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton=false;

  final _formKey=GlobalKey<FormState>();
  moveToHome(BuildContext context) async{
   if(_formKey.currentState.validate()){
                    
          setState(() {
           changeButton=true;
           });
          await Future.delayed(Duration(seconds: 1));
          await Navigator.pushNamed(context, MyRoute.homeRoute);
          setState(() {
          changeButton=false;
          });
   }            

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
            children:[Image.asset("assets/images/login_image.png"),
         SizedBox(
             height: 20,
         ),
            Text("Welcome $name",
            style: TextStyle(
              fontSize: 25,
            ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:16.0, horizontal:32.0),
              child: Column(
                children:[
                TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter username",
                  labelText: "Username",
                ),
                validator: (value){
                  if(value.isEmpty)
                  return "username cannot be empty";
                  else
                  return null;
                },
                onChanged: (value){
                  name=value;
                  setState(() {
                    
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password",
                ),
                 validator: (value){
                  if(value.isEmpty)
                  return "password cannot be empty";
                  else if(value.length<6)
                  return "password should have atleast length of 6";
                  else
                  return null;
                },
              ),
              SizedBox(
               height:20,
             ),
             Material(
                 color: context.theme.buttonColor,
                    borderRadius: BorderRadius.circular(changeButton?50:8),
                  child: InkWell(
                  onTap: ()=> moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds:1),
                    width:  changeButton?50:150,
                   height:50,
                   alignment: Alignment.center,
                   child:changeButton?Icon(Icons.done) :Text(
                     "Login",
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                     ),
                   ),
                  
                 ),
               ),
             ),
            // ElevatedButton(
              // child: Text("Login"),
            // style: TextButton.styleFrom(minimumSize: Size(150, 40)),
  
            //   onPressed: (){
             //    Navigator.pushNamed(context, MyRoute.homeRoute);
            //   },
            // ),
                ]
              ),
            ),
             
            ],
            
        ),
          ),
      ),
    );
  }
}