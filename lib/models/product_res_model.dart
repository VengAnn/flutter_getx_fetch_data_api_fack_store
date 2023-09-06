class ProductResModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  //Constructor
  ProductResModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  //
  factory ProductResModel.fromJson(Map<String, dynamic> json) {
    return ProductResModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating(
        rate: json['rate'],
        count: json['count'],
      ),
    );
  }
}

class Rating {
  final dynamic rate;
  final int? count;

  //Constructor
  Rating({
    required this.rate,
    required this.count,
  });

  //Create function from json to map dart
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['counter'],
    );
  }
}
