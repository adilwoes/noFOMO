import 'package:flutter/material.dart';
import 'package:nofomo/services/auth.dart';
import 'package:nofomo/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(295.0, 85.0, 0.0, 0.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                            fontSize: 110.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          obscureText: true,
                          validator: (val) => val.length < 8
                              ? 'Enter a password 8+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          height: 55.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.lightBlueAccent,
                            color: Colors.lightBlue,
                            elevation: 7.0,
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Please supply a valid email';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        SizedBox(
                          height: 0.0,
                        ),
                        Container(
                          height: 55.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                widget.toggleView();
                              },
                              child: Center(
                                child: Text(
                                  'Go Back',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
// backgroundColor: Colors.brown[100],
// appBar: AppBar(
//   backgroundColor: Colors.brown[400],
//   elevation: 0.0,
//   title: Text('Sign up to noFOMO'),
//   actions: <Widget>[
//     FlatButton.icon(
//       onPressed: () {
//         widget.toggleView();
//       },
//       icon: Icon(Icons.person),
//       label: Text('Sign In'),
//     ),
//   ],
// ),
// body: Container(
//   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//   child: Form(
//     key: _formKey,
//     child: Column(
//       children: <Widget>[
//         SizedBox(height: 20.0),
//         TextFormField(
//           decoration:
//               textInputDecoration.copyWith(hintText: 'Email'),
//           validator: (val) => val.isEmpty ? 'Enter an email' : null,
//           onChanged: (val) {
//             setState(() => email = val);
//           },
//         ),
//         SizedBox(height: 20.0),
//         TextFormField(
//           decoration:
//               textInputDecoration.copyWith(hintText: 'Password'),
//           obscureText: true,
//           validator: (val) => val.length < 6
//               ? 'Enter a password 6+ chars long'
//               : null,
//           onChanged: (val) {
//             setState(() => password = val);
//           },
//         ),
//         SizedBox(height: 20.0),
//         RaisedButton(
//             color: Colors.pink[400],
//             child: Text(
//               'Register',
//               style: TextStyle(color: Colors.white),
//             ),
//             onPressed: () async {
//               if (_formKey.currentState.validate()) {
//                 setState(() => loading = true);
//                 dynamic result = await _auth
//                     .registerWithEmailAndPassword(email, password);
//                 if (result == null) {
//                   setState(() {
//                     error = 'please supply a valid email';
//                     loading = false;
//                   });
//                 }
//               }
//             }),
//         SizedBox(
//           height: 12.0,
//         ),
//         Text(
//           error,
//           style: TextStyle(
//             color: Colors.red,
//             fontSize: 14.0,
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
