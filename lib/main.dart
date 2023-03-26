import 'dart:convert';

import 'package:flutter/material.dart';
import 'user.dart';
import 'package:http/http.dart' as http ;

void main(){
  runApp(MaterialApp(
    home: login(),
  ));
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _mailFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool _iseye=false;
  bool _ispressed= false;
  bool _isFocused1 = false;
  bool _isFocused2 = false;
  bool _isFocused3 = false;
  bool _isFocused4 = false;
  Schema user = Schema('','','','');

  final _formkey = GlobalKey<FormState>();
  save(String name, String phone, String email, String password) async{
    http.Response res = await http.post(Uri.parse('http://10.0.2.2:3000/signup'),

        body: {
          'name' : name,
          'phone': phone,
          'email' : email,
          'password' : password,
        });
      print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FORM'),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body:
      Container(
        height: 1000,
        width: 550,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background4.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Container(
            height: 500,
            width: 300,

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0,),
                  Text('SIGN UP',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,

                  ) ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            focusNode: _nameFocusNode,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.white),
                              // prefixIcon: Icon(Icons.person),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10.0),

                              ),

                              prefixIcon: Icon(Icons.person, color: _isFocused1 && _nameController.text.length > 0 ? Colors.green : Colors.black45),
                            ),
                            controller: _nameController,
                            onChanged: (value){
                              user.name = value;
                              setState(() {
                                _isFocused1 = _nameFocusNode.hasFocus;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),

                          TextFormField(
                            focusNode: _phoneFocusNode,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: Colors.white),
                              // prefixIcon: Icon(Icons.phone),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: Icon(Icons.phone, color: _isFocused2 && _phoneController.text.length > 0 ? Colors.green : Colors.black45),
                            ),
                            controller: _phoneController,
                            onChanged: (value){
                              user.phone = value;
                              setState(() {
                                _isFocused2 = _phoneFocusNode.hasFocus;
                              });
                            },
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            focusNode: _mailFocusNode,
                            decoration: InputDecoration(
                              labelText: 'Mail id',
                              labelStyle: TextStyle(color: Colors.white),
                              // prefixIcon: Icon(Icons.mail),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: Icon(Icons.mail, color: _isFocused3 && _mailController.text.length > 0 ? Colors.green : Colors.black45),
                            ),
                            controller: _mailController,
                            onChanged: (value){
                              user.email = value;
                              setState(() {
                                _isFocused3 = _mailFocusNode.hasFocus;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),

                          TextFormField(
                            focusNode: _pwdFocusNode,
                            obscureText: !_iseye,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              // prefixIcon: Icon(Icons.password),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: Icon(Icons.password, color: _isFocused4 && _pwdController.text.length > 0 ? Colors.green : Colors.black45),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _iseye ? Icons.visibility : Icons.visibility_off ,
                                  color: Colors.white,
                                ),
                                onPressed: (){
                                  setState(() {
                                    _iseye = !_iseye;
                                  });
                                },
                              )
                            ),
                            controller: _pwdController,
                            onChanged: (value){
                              user.password = value;
                              setState(() {
                                _isFocused4 = _pwdFocusNode.hasFocus;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),

                        ],
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 30.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(onPressed: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) => login()),
                          );
                          String name = _nameController.text.trim();
                          String phone = _phoneController.text.trim();
                          String email = _mailController.text.trim();
                          String password = _pwdController.text.trim();
                          save(name, phone, email, password);
                          setState(() {
                            _ispressed= !_ispressed;
                          });
                        },
                            icon: Icon(Icons.send, size: 30.0,
                              color: _ispressed ? Colors.green[900] : Colors.black45,),
                            label: Text('Submit',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: _ispressed ? Colors.black45 : Colors.white,
                            ),),
                            style: ButtonStyle(
                              alignment: Alignment.bottomRight,
                            )
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}




