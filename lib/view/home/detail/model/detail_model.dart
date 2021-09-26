import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'detail_model.g.dart';

@JsonSerializable()
class DetailModel extends INetworkModel<DetailModel> {
  @JsonKey(name: "_id")
  String? sId;
  String? name;
  int? price;
  String? image;
  int? rates;
  bool? isFavorite;
  String? updated;

  @override
  DetailModel fromJson(Map<String, dynamic> json) {
    return _$DetailModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DetailModelToJson(this);
  }
}
