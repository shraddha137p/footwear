import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart'; 

@JsonSerializable() 
class Products {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'category')
  String? category;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'price')
  int? price;

  @JsonKey(name: 'brand')
  String? brand;

  @JsonKey(name: 'offer')
  bool? offer;

  Products({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.offer,
    this.price,
    this.brand,
  });

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
