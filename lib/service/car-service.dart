import 'package:cars_app/model/car-model.dart';
import 'package:cars_app/model/cars-model.dart';
import 'package:cars_app/model/error-model.dart';
import 'package:cars_app/model/result-model.dart';
import 'package:cars_app/service/base-service.dart';
import 'package:dio/dio.dart';

class CarsService extends BaseService {
  Future<ResultModel> getAllCars() async {
    response = await dio.get(BaseCarsUrl);
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        CarsModel cars = CarsModel.fromMap(data);
        return cars;
      } else {
        return ErrorModel(massege: response.statusMessage!);
      }
    } on Exception catch (e) {
      return ErrorModel(massege: e.toString());
    }
  }

  Future AddCar(CarModel Car) async {
    response = await dio.post(BaseCarsUrl, data: Car.toJson());
    try {
      if (response.statusCode == 201) {
        print('Car is added successfully');
        return Car;
      } else {
        return ErrorModel(massege: response.statusMessage!);
      }
    } on Exception catch (e) {
      return ErrorModel(massege: e.toString());
    }
  }

  Future DeleteCar(String Id) async {
    response = await dio.delete(BaseCarsUrl + '/' + Id);

    try {
      if (response.statusCode == 201) {
        print('Car is deleted Successsfully');
      } else {
        print(response.statusMessage);
        return 'error';
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future UpdateCar(CarModel Car) async {
    response = await dio.put(BaseCarsUrl + '/' + Car.id, data: Car.toJson());

    if (response.statusCode == 200) {
      print('Car with id ${Car.id} is updated Successsfully');
    }
  }
}
