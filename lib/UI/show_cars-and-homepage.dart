import 'package:cars_app/UI/add-car.dart';
import 'package:cars_app/UI/delete-car.dart';
import 'package:cars_app/UI/show-car-details.dart';
import 'package:cars_app/UI/update-car.dart';
import 'package:cars_app/bloc/cars_bloc.dart';
import 'package:cars_app/model/car-model.dart';
import 'package:cars_app/model/cars-model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_to_color/string_to_color.dart';

late String x = 'red';
Color color1 = x as Color;

class ShowCarsPage extends StatefulWidget {
  const ShowCarsPage({super.key});

  @override
  State<ShowCarsPage> createState() => _ShowCarsPageState();
}

class _ShowCarsPageState extends State<ShowCarsPage> {
  @override
  late final List<CarModel> items;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsBloc(),
      child: Builder(builder: (context) {
        context.read<CarsBloc>().add(GetCarsEvent());
        return Scaffold(
          appBar: AppBar(
            title: BlocListener<CarsBloc, CarsState>(
              listener: (context, state) {
                if (state is SuccessToLoadCars) {
                  print('car');
                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Please Choose One of The Cars'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ));
                } else if (state is SuccessToNavigateToCarDetailsPage) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowCarDetailsPage(
                                car: state.car,
                                color: state.color,
                              )));
                } else if (state is SuccessToNavigateToAddCarPage) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddingCarsPage()));
                } else if (state is SuccessToNavigateToUpdateCarPage) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateCarPage()));
                } else if (state is SuccessToNavigateToDeleteCarPage) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeleteCarPage(cars: items )));
                }
              },
              child: Center(
                  child: Text(
                'All Cars',
                style: TextStyle(fontSize: 30),
              )),
            ),
          ),
          drawer: Drawer(
              child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  'Cars Options',
                  style: TextStyle(fontSize: 25),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              Divider(),
              ListTile(
                title: Text('Add a new car'),
                onTap: () {
                  context.read<CarsBloc>().add(NavigateToAddCarPageEvent());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AddingCarsPage()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Edit car details'),
                onTap: () {
                  context.read<CarsBloc>().add(NavigateToUpdateCarPageEvent());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => UpdateCarPage()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Delete a car'),
                onTap: () {
                  context.read<CarsBloc>().add(NavigateToDeleteCarPageEvent());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => DeleteCarPage()));
                },
              ),
              SizedBox(
                height: 300,
              ),
              ListTile(
                title: Text(
                  'Close drawer',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // context.read<CarsBloc>().add(GetCarsEvent());
                },
              ),
            ],
          )),
          body: BlocBuilder<CarsBloc, CarsState>(
            builder: (context, state) {
              if (state is SuccessToLoadCars) {
                items = state.cars.cars;
                return RefreshIndicator(
                  onRefresh: () async {},
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        print(items[index].color);
                        print(ColorUtils.stringToHexColor("red"));
                        Color color =
                            ColorUtils.stringToColor(items[index].color);
                        print(color);

                        return Column(
                          children: [
                            Card(
                              child: ListTile(
                                onTap: () {
                                  context.read<CarsBloc>().add(
                                      NavigateToCarDetailsPageEvent(
                                          car: items[index], color: color));
                                },
                                leading:
                                    CircleAvatar(child: Text(items[index].id)),
                                trailing: CircleAvatar(
                                  child: Image.network(
                                    items[index].avatar,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            FlutterLogo(),
                                  ),
                                ),
                                tileColor: color,
                                title: Text(items[index].name),
                                subtitle: Text(items[index].price.toString()),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ],
                        );
                      }),
                );
              } else if (state is FailedToLoadCars) {
                return Center(
                  child: Text(state.errorModel.massege),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
