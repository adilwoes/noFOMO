import 'package:flutter/material.dart';
import 'package:nofomo/services/auth.dart';
import 'package:nofomo/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                        padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                        child: Text(
                          'Hello',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 165.0, 0.0, 0.0),
                        child: Text(
                          'There',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(225.0, 140.0, 0.0, 0.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                            fontSize: 110.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[200],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
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
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: Colors.orange[200],
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          height: 55.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.orangeAccent,
                            color: Colors.orange[300],
                            elevation: 7.0,
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  'LOGIN',
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
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error =
                                          'The email or password is incorrect. Please try again.';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ), //creates the separation between login button and error msg
                SizedBox(
                  height: 20.0,
                  child: Center(
                    child: Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to NoFOMO ?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        widget.toggleView(); //turn to register page
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.orange[200],
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
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
//   title: Text('Sign in to noFOMO'),
//   actions: <Widget>[
//     FlatButton.icon(
//       onPressed: () {
//         widget.toggleView();
//       },
//       icon: Icon(Icons.person),
//       label: Text('Register'),
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
//           color: Colors.pink[400],
//           child: Text(
//             'Sign in',
//             style: TextStyle(color: Colors.white),
//           ),
//           onPressed: () async {
//             if (_formKey.currentState.validate()) {
//               setState(() => loading = true);
//               dynamic result = await _auth
//                   .signInWithEmailAndPassword(email, password);
//               if (result == null) {
//                 setState(() {
//                   error =
//                       'could not sign in with those credentials';
//                   loading = false;
//                 });
//               }
//             }
//           },
//         ),
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
