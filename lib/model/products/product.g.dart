part of 'products.dart';

Products _$ProductsFromJson(Map<String, dynamic> json) {
  return Products(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    category: json['category'] as String?,
    image: json['image'] as String?,
    price: (json['price'] is double)
        ? (json['price'] as double).toInt()
        : json['price'] as int?,
    brand: json['brand'] as String?,
    offer: json['offer'] as bool?,
  );
}

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'price': instance.price,
      'brand': instance.brand,
      'offer': instance.offer,
    };
