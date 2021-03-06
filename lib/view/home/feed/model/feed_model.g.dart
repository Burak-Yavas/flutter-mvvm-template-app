// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map<String, dynamic> json) {
  return HouseModel(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    image: json['image'] as String?,
    description: json['description'] as String?,
    user: json['user'] == null
        ? null
        : UserHouse.fromJson((json['user'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, e as Object),
          )),
    iV: json['iV'] as int?,
  );
}

Map<String, dynamic> _$HouseModelToJson(HouseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'user': instance.user,
      'iV': instance.iV,
    };

UserHouse _$UserHouseFromJson(Map<String, dynamic> json) {
  return UserHouse(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    date: json['date'] as String?,
  );
}

Map<String, dynamic> _$UserHouseToJson(UserHouse instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'date': instance.date,
    };
