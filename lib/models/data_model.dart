class DataModel{
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.price,
    required this.description,
    required this.img,
    required this.location,
    required this.people,
    required this.stars

});
  factory DataModel.fromJson(Map<String,dynamic>json){
    return DataModel(name: json["name"],
    price: json["price"],
    description: json["description"],
    img: json["img"],
    location: json["location"],
    people: json["people"],
    stars: json["stars"]);
  }

}