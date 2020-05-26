import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nofomo/models/nofomo.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference noFomoCollection =
      Firestore.instance.collection('nofomo');

  Future updateUserData(String name, int phoneNumber) async {
    return await noFomoCollection.document(uid).setData({
      'name': name,
      'phoneNumber': phoneNumber,
    });
  }

  // nofomo list from snapshot
  List<NoFomo> _nofomoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return NoFomo(
        name: doc.data['name'] ?? '',
        phoneNumber: doc.data['phoneNumber'] ?? null,
      );
    }).toList();
  }

  //get noFomo stream
  Stream<List<NoFomo>> get nofomo {
    return noFomoCollection.snapshots()
      .map(_nofomoListFromSnapshot);
  }
}
