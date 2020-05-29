import 'package:flutter/material.dart';
import 'package:nofomo/models/userdata.dart';
import 'package:provider/provider.dart';

class UserDataList extends StatefulWidget {
  @override
  _UserDataListState createState() => _UserDataListState();
}

class _UserDataListState extends State<UserDataList> {
  @override
  Widget build(BuildContext context) {

    final userData = Provider.of<List<UserData>>(context);
    userData.forEach((ele) { 
      print(ele.name);
      //print(ele.phoneNumber);
      print(ele.email);
    });
    
    return Container(
      
    );
  }
}
// dont think this is needed