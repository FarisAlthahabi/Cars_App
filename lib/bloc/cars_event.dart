// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cars_bloc.dart';

@immutable
sealed class CarsEvent {}

class GetCarsEvent extends CarsEvent {}

class NavigateToCarDetailsPageEvent extends CarsEvent {
  CarModel car;
  String color;
  NavigateToCarDetailsPageEvent({
    required this.car,
    required this.color,
  });
}

class NavigateToAddCarPageEvent {}

class NavigateToDeleteCarPageEvent {}

class NavigateToUpdateCarPageEvent {}
