import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class Restaurant extends INetworkModel<Restaurant> {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? company;
  String? image;

  Restaurant({this.name, this.company, this.image});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    name = json['name'] as String?;
    company = json['company'] as String?;
    image = json['image'] as String?;
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RestaurantToJson(this);
  }

  @override
  Restaurant fromJson(Map<String, Object?> json) {
    return _$RestaurantFromJson(json);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Restaurant &&
        o.id == id &&
        o.name == name &&
        o.company == company &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ company.hashCode ^ image.hashCode;
  }
}
