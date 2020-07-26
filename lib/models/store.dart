class Store {
  final String id;
  final String title;
  final String description;
  final String img;
  final double price;
  final double lat;
  final double long;
  final int distance;

  Store(
      {this.id,
      this.title,
      this.img,
      this.price,
      this.description,
      this.lat,
      this.long,
      this.distance});

  factory Store.fromJson(Map<String, dynamic> parsedJson) {
    return Store(
      id: parsedJson['id'],
      title: parsedJson['title'],
      img: parsedJson['img'],
      description: parsedJson['description'],
      price: double.parse(parsedJson['price']),
      lat: double.parse(parsedJson['lat']),
      long: double.parse(parsedJson['long']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'title': this.title,
        'img': this.img,
        'description': this.description,
        'price': this.price.toString(),
        'lat': this.lat.toString(),
        'long': this.long.toString(),
      };
}
