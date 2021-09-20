// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardModel _$DashBoardModelFromJson(Map<String, dynamic> json) {
  return DashBoardModel(
    sId: json['_id'] as String?,
    image: json['image'] as String?,
    name: json['name'] as String?,
    money: json['money'] as int?,
    category: json['category'] as int?,
  );
}

Map<String, dynamic> _$DashBoardModelToJson(DashBoardModel instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'image': instance.image,
      'name': instance.name,
      'money': instance.money,
      'category': instance.category,
    };
