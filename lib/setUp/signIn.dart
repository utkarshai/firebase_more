import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_more/pages/home.dart';
import 'package:flutter/material.dart';
class LogInPage extends StatefulWidget {

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String _email, _password;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
TextFormField(
  validator: (input) {
    if(input.isEmpty){
      return 'please type an email';
    }
  } ,
  onSaved: (input)=> _email=input,
  decoration: InputDecoration(
    labelText: "email",
  ),
),
TextFormField(
  validator: (input) {
    if(input.length<6){
      return 'your password shoould be of 6 characters';
    }
  } ,
  onSaved: (input)=> _password=input,
  decoration: InputDecoration(
    labelText: "password",
  ),
  obscureText: true,
),
RaisedButton(
  onPressed: signIn,
  child: Text("Sign In"),
),
          ],
        ),
        ),
    );
  }
  Future<void> signIn() async {
    final formState = _formkey.currentState;

    if(formState.validate()){
      formState.save();
      try{
        AuthResult user = await  FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user: user.user)));
      }catch(e){
        print(e.message);
        print("e rror!!!!!!!");
      }
      
    }
  }
}