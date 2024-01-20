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

  Future AddCar(String color, String name, String id, String avatar, num price,
      num speed) async {
    CarModel Car = CarModel(
        color: color,
        name: name,
        id: id,
        avatar: avatar,
        price: price,
        speed: speed);

    response = await dio.post(BaseCarsUrl, data: Car.toJson());
    if (response.statusCode == 201) {
      print('Car is added successfully');
    }
  }

  Future DeleteCar(String Id) async {
    response = await dio.delete(BaseCarsUrl + '/' + Id);

    if (response.statusCode == 201) {
      print('Car is deleted Successsfully');
    }
  }

  Future Updatecar(String color, String name, String id, String avatar,
      num price, num speed) async {
    CarModel Car = CarModel(
        color: color,
        name: name,
        id: id,
        avatar: avatar,
        price: price,
        speed: speed);

    response = await dio.put(BaseCarsUrl + '/' + id, data: Car.toJson());

    if (response.statusCode==200){
      print('Car with id $id is updated Successsfully');
    }
  }
}
