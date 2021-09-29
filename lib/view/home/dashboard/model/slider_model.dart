import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel extends INetworkModel<SliderModel> {
  String? image;
  String? text;
  String? detailId;

  SliderModel({this.image, this.text, this.detailId});

  @override
  fromJson(Map<String, Object?> json) {
    return _$SliderModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$SliderModelToJson(this);
  }
}
