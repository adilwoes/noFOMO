import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddStore extends StatefulWidget {
  AddStore({Key key}) : super(key: key);

  @override
  _AddStoreState createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  String title;
  String description;
  String price;
  String img;

  GlobalKey<FormState> _storeFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldStateKey,
          appBar: AppBar(
            elevation: 0.0,
            title: Center(
              child: Text(
                'Add Store',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Bebas',
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 16.0),
                child: Form(
                  key: _storeFormKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        height: 170.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/noimage.png')),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      _buildTextFormField('Store title'),
                      _buildTextFormField('Description', maxLine: 5),
                      _buildTextFormField('Price'),
                      SizedBox(height: 50.0),
                      ScopedModelDescendant(
                        builder: (BuildContext context, Widget child,
                            MainModel model) {
                          return GestureDetector(
                            onTap: () {
                              onSubmit(model.addStore);
                              if (model.isLoading) {
                                showLoadingIndicator();
                              }
                            },
                            child: Button(btnText: 'Add Store'),
                          );
                        },
                      ),
                    ],
                  ),
                )),
          )),
    );
  }

  void onSubmit(Function addStore) async {
    if (_storeFormKey.currentState.validate()) {
      //this validates and returns true or false
      _storeFormKey.currentState.save();

      final Store store = Store(
        title: title,
        description: description,
        price: double.parse(price),
      );
      bool value = await addStore(store);
      if (value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text('Store successfully added'),
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      } else if (!value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text('Failed to add Store'),
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      }
    }
  }

  Future<void> showLoadingIndicator() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 10.0),
              Text('Adding Store...'),
            ],
          ));
        });
  }

  Widget _buildTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      decoration: InputDecoration(hintText: '$hint'),
      maxLines: maxLine,
      keyboardType: hint == 'Price' ? TextInputType.number : TextInputType.text,
      validator: (String value) {
        if (value.isEmpty && hint == 'Store title') {
          return 'Store title required';
        }
        if (value.isEmpty && hint == 'Description') {
          return 'Description required';
        }
        if (value.isEmpty && hint == 'Price') {
          return 'Price required';
        }
      },
      onSaved: (String value) {
        if (hint == 'Store title') {
          title = value;
        }
        if (hint == 'Description') {
          description = value;
        }
        if (hint == 'Price') {
          price = value;
        }
      },
    );
  }
}
