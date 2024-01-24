// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cars_bloc.dart';

@immutable
sealed class CarsState {}

final class CarsInitial extends CarsState {}

class SuccessToLoadCars extends CarsState {
  CarsModel cars;
  SuccessToLoadCars({
    required this.cars,
  });
}

class LoadingCars extends CarsState {}

class FailedToLoadCars extends CarsState {
  ErrorModel errorModel;
  FailedToLoadCars({
    required this.errorModel,
  });
}

class SuccessToNavigateToCarDetailsPage extends CarsState {
  Color color;
  CarModel car;
  SuccessToNavigateToCarDetailsPage({
    required this.color,
    required this.car,
  });
}

class SuccessToNavigateToAddCarPage extends CarsState {}

class SuccessToNavigateToDeleteCarPage extends CarsState {}

class SuccessToNavigateToUpdateCarPage extends CarsState {}

class SuccessToAddCar extends CarsState {
  CarModel car;
  SuccessToAddCar({
    required this.car,
  });
}

class FailedToAddCar extends CarsState {
  ErrorModel errorModel;
  FailedToAddCar({
    required this.errorModel,
  });
}
