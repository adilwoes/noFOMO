import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nofomo/models/userdata.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('user data');

  Future updateUserData(String name, int phoneNumber, String email) async { //when users register and when they update in settings
    return await userCollection.document(uid).setData({ //creates the document and links the user to it
      'name': name,
      //'phoneNumber': phoneNumber,
      'email': email,
    });
  }

  // userData list from snapshot
  List<UserData> _userDataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
        name: doc.data['name'] ?? '',
        //phoneNumber: doc.data['phoneNumber'] ?? 0,
        email: doc.data['email'] ?? '',
      );
    }).toList();
  }

  //get userData stream
  Stream<List<UserData>> get userData {
    return userCollection.snapshots()
      .map(_userDataListFromSnapshot);
  }
}
