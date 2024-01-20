import 'package:bloc/bloc.dart';
import 'package:cars_app/model/car-model.dart';
import 'package:cars_app/model/cars-model.dart';
import 'package:cars_app/model/error-model.dart';
import 'package:cars_app/model/result-model.dart';
import 'package:cars_app/service/car-service.dart';
import 'package:meta/meta.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarsBloc() : super(CarsInitial()) {
    on<GetCarsEvent>((event, emit) async {
      emit(LoadingCars());
      ResultModel data = await CarsService().getAllCars();
      if (data is CarsModel) {
        emit(SuccessToLoadCars(cars: data));
      } else {
        emit(FailedToLoadCars(errorModel: data as ErrorModel));
      }
    });

    on<NavigateToCarDetailsPageEvent>((event, emit) {
      emit(SuccessToNavigateToCarDetailsPage(car: event.car, color: event.color));
    });
  }
}
