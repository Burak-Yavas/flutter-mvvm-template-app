// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) {
  return DetailModel()
    ..sId = json['_id'] as String?
    ..name = json['name'] as String?
    ..price = json['price'] as int?
    ..image = json['image'] as String?
    ..rates = json['rates'] as int?
    ..isFavorite = json['isFavorite'] as bool?
    ..updated = json['updated'] as String?;
}

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'rates': instance.rates,
      'isFavorite': instance.isFavorite,
      'updated': instance.updated,
    };
