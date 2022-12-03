class Dummy {
  final String name;
  final String image;
  final double rating;
  final String totalTime;

  Dummy(
      {required this.image,
      required this.name,
      required this.rating,
      required this.totalTime});

  factory Dummy.fromJson(dynamic json) {
    return Dummy(
        name: json['name'] as String,
        // Goes deep into the json file to get image that is stored in an array
        image: json['images'][0]['hostedLardUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  // return a list of recipes
  static List<Dummy> dataFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Dummy.fromJson(data);
    }).toList();
  }
  
}
