import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashBoardModel extends INetworkModel<DashBoardModel> {
  @JsonKey(name: "_id")
  String? sId;
  String? image;
  String? name;
  int? money;
  int? category;

  DashBoardModel({this.sId, this.image, this.name, this.money, this.category});

  @override
  DashBoardModel fromJson(Map<String, Object?> json) {
    return _$DashBoardModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$DashBoardModelToJson(this);
  }
}
