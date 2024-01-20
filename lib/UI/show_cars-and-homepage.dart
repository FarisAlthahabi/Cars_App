import 'package:cars_app/UI/add-car.dart';
import 'package:cars_app/UI/delete-car.dart';
import 'package:cars_app/UI/show-car-details.dart';
import 'package:cars_app/UI/update-car.dart';
import 'package:cars_app/bloc/cars_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCarsPage extends StatelessWidget {
  const ShowCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsBloc()..add(GetCarsEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'All Cars',
              style: TextStyle(fontSize: 30),
            )),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddingCarsPage()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Edit car details'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>UpdateCarPage() ));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Delete a car'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>DeleteCarPage() ));
                },
              ),
              SizedBox(
                height: 300,
              ),
              ListTile(
                title: Text('Close drawer',style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
          body: BlocBuilder<CarsBloc, CarsState>(
            builder: (context, state) {
              if (state is SuccessToLoadCars) {
                return ListView.builder(
                    itemCount: state.cars.cars.length,
                    itemBuilder: (context, index) {
                      late Color color;
                      if (state.cars.cars[index].color == 'red') {
                        color = Colors.red;
                      }
                      if (state.cars.cars[index].color == 'blue') {
                        color = Colors.blue;
                      }
                      if (state.cars.cars[index].color == 'green') {
                        color = Colors.green;
                      }
                      if (state.cars.cars[index].color == 'amber') {
                        color = Colors.amber;
                      }
                      if (state.cars.cars[index].color == 'yellow') {
                        color = Colors.yellow;
                      }
                      if (state.cars.cars[index].color == 'pink') {
                        color = Colors.pink;
                      }
                      if (state.cars.cars[index].color == 'purple') {
                        color = Colors.purple;
                      }
                      if (state.cars.cars[index].color == 'orange') {
                        color = Colors.orange;
                      }
                      if (state.cars.cars[index].color == 'wight') {
                        color = Colors.white;
                      }
                      if (state.cars.cars[index].color == 'gray') {
                        color = Colors.grey;
                      }
                      if (state.cars.cars[index].color == 'black') {
                        color = Colors.black26;
                      }
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowCarDetailsPage(
                                            car: state.cars.cars[index],
                                            color: color,
                                          )));
                            },
                            leading: Text(state.cars.cars[index].id),
                            trailing: CircleAvatar(
                              child:
                                  Image.network(state.cars.cars[index].avatar),
                            ),
                            tileColor: color,
                            title: Text(state.cars.cars[index].name),
                            subtitle:
                                Text(state.cars.cars[index].price.toString()),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ],
                      );
                    });
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
