import 'dart:convert';

import 'package:nofomo/models/store.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class StoreModel extends Model {
  
  List<Store> _stores = [];
  List<Store> _favStores = [];
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  int get storeLength {
    return _stores.length;
  }

  List<Store> get stores {
    return List.from(_stores);
  }

  List<Store> get favStores {
    return List.from(_favStores);
  }

  Future<bool> addStore(Store store) async {
    // _stores.add(store);
    _isLoading = true;
    notifyListeners();

    try {
      final Map<String, dynamic> storeData = {
        'title': store.title,
        'description': store.description,
        'price': store.price,
        'img': store.img,
        'lat': store.lat,
        'long': store.long,
      };
      final http.Response response = await http.post(
          "https://nofomo2-fe658.firebaseio.com/stores.json",
          body: json.encode(storeData)); //creating the store in the database

      final Map<String, dynamic> responseData = json.decode(response.body);

      Store storeWithID = Store(
          id: responseData['name'],
          title: store.title,
          description: store.description,
          price: store.price,
          img: store.img,
          lat: store.lat,
          long: store.long
          ); //this returns the store with the ID from firebase

      _stores.add(storeWithID);
      _isLoading = false;
      notifyListeners();
      // fetchStores();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
      // print('Connection error: $e');
    }
  }

  Future<bool> fetchStores() async {
    _isLoading = true;
    notifyListeners();

    try {
      final http.Response response =
          await http.get("https://nofomo2-fe658.firebaseio.com/stores.json");

      final Map<String, dynamic> fetchedData = json.decode(response.body);

      final List<Store> fetchedStoreItems = [];

      fetchedData.forEach((String id, dynamic storeData) {
        Store storeItem = Store(
          id: id,
          title: storeData['title'],
          description: storeData['description'],
          price: storeData['price'],
          img: storeData['img'],
          lat: storeData['lat'],
          long: storeData['long'],
        );

        fetchedStoreItems.add(storeItem);
      });

      _stores = fetchedStoreItems;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> addFavStore(Store store) async {
    try {
      final Map<String, dynamic> storeData = {
        'id': store.id,
        'title': store.title,
        'description': store.description,
        'price': store.price,
        'img': store.img,
        'lat': store.lat,
        'long': store.long
      };
      final http.Response response = await http.put(
          "https://nofomo2-fe658.firebaseio.com/favStores/${store.id}.json",
          body: json.encode(storeData)); //creating the store in the database

      Store storeWithID = Store(
          id: store.id,
          title: store.title,
          description: store.description,
          price: store.price,
          img: store.img,
          lat: store.lat,
          long: store.long); //this returns the store with the ID from firebase

      _favStores.add(storeWithID);
      notifyListeners();
      return Future.value(true);
    } catch (e) {
      notifyListeners();
      return Future.value(false);
      // print('Connection error: $e');
    }
  }

  Future<bool> fetchFavStores() async {
    try {
      final http.Response response =
          await http.get("https://nofomo2-fe658.firebaseio.com/favStores.json");

      final Map<String, dynamic> fetchedData = json.decode(response.body);

      final List<Store> fetchedStoreItems = [];

      fetchedData.forEach((String id, dynamic storeData) {
        Store storeItem = Store(
            id: id,
            title: storeData['title'],
            description: storeData['description'],
            price: storeData['price'],
            img: storeData['img'],
            lat: storeData['lat'],
            long: storeData['long']);

        fetchedStoreItems.add(storeItem);
      });

      _favStores = fetchedStoreItems;
      notifyListeners();
      return Future.value(true);
    } catch (e) {
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> deleteStore(String storeId) async {
    try {
      final http.Response response = await http
          .delete("https://nofomo2-fe658.firebaseio.com/favStores/${storeId}.json");

      // delete item from the list of food items
      _favStores.removeWhere((Store store) => store.id == storeId);

      notifyListeners();
      return Future.value(true);
    } catch (error) {
      notifyListeners();
      return Future.value(false);
    }
  }
}

// Store getStoreItemById(String storeId){
//   Store food;
//   for(int i = 0; i < _stores.length; i++){
//     if(_stores[i].id == foodId){
//       food = _stores[i];
//       break;
//     }
//   }
//   return food;
// }
