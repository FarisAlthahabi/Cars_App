// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cars_app/model/result-model.dart';

class CarModel extends ResultModel{
  String color;
  String name;
  String id;
  String avatar;
  num price;
  num speed;
  CarModel({
    required this.color,
    required this.name,
    required this.id,
    required this.avatar,
    required this.price,
    required this.speed,
  });

  CarModel copyWith({
    String? color,
    String? name,
    String? id,
    String? avatar,
    num? price,
    num? speed,
  }) {
    return CarModel(
      color: color ?? this.color,
      name: name ?? this.name,
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      price: price ?? this.price,
      speed: speed ?? this.speed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'name': name,
      'id': id,
      'avatar': avatar,
      'price': price,
      'speed': speed,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      color: map['color'] as String,
      name: map['name'] as String,
      id: map['id'] as String,
      avatar: map['avatar'] as String,
      price: map['price'] as num,
      speed: map['speed'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) => CarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarModel(color: $color, name: $name, id: $id, avatar: $avatar, price: $price, speed: $speed)';
  }

  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.color == color &&
      other.name == name &&
      other.id == id &&
      other.avatar == avatar &&
      other.price == price &&
      other.speed == speed;
  }

  @override
  int get hashCode {
    return color.hashCode ^
      name.hashCode ^
      id.hashCode ^
      avatar.hashCode ^
      price.hashCode ^
      speed.hashCode;
  }
}
