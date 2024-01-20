// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cars_app/model/car-model.dart';
import 'package:cars_app/model/result-model.dart';
import 'package:flutter/foundation.dart';



class CarsModel extends ResultModel {
  List<CarModel> cars;
  CarsModel({
    required this.cars,
  });

  CarsModel copyWith({
    List<CarModel>? cars,
  }) {
    return CarsModel(
      cars: cars ?? this.cars,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cars': cars.map((x) => x.toMap()).toList(),
    };
  }

  factory CarsModel.fromMap(dynamic map) {
    return CarsModel(
      cars: List.generate(map.length, (index) => CarModel.fromMap(map[index]))
    );
  }

  String toJson() => json.encode(toMap());

  factory CarsModel.fromJson(String source) => CarsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CarsModel(cars: $cars)';

  @override
  bool operator ==(covariant CarsModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.cars, cars);
  }

  @override
  int get hashCode => cars.hashCode;
}
