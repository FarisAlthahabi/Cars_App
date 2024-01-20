import 'package:cars_app/UI/show_cars-and-homepage.dart';
import 'package:cars_app/service/car-service.dart';
import 'package:flutter/material.dart';

void main() {
  CarsService().getAllCars();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowCarsPage(),
    );
  }
}
