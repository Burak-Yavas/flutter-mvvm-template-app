// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    name: json['name'] as String?,
    company: json['company'] as String?,
    image: json['image'] as String?,
  )..id = json['_id'] as String?;
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'company': instance.company,
      'image': instance.image,
    };
