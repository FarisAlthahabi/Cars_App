// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cars_app/UI/add-car.dart';
import 'package:cars_app/model/car-model.dart';
import 'package:cars_app/model/cars-model.dart';
import 'package:cars_app/service/car-service.dart';

class DeleteCarPage extends StatelessWidget {
  List<CarModel> cars;
   DeleteCarPage({
    Key? key,
    required this.cars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: Text(
          'Deleting a car Page',
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: Column(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text('Enter the id of the car that you want to delete',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(29, 30, 32, 1),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 246, 250, 1)),
              child: TextField(
                controller: IdController,
                decoration: InputDecoration(
                    hintText: '   Id', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, top: 370),
              child: InkWell(
                onTap: () {
                  if( int.parse(IdController.text)<= cars.length)
                  {
                    CarsService().DeleteCar(IdController.text);
                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      'Car is deleted successfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal),
                    ),
                    backgroundColor: Colors.blue,
                  ));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      'Car is not deleted , enter a correct id ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal),
                    ),
                    backgroundColor: Colors.red,
                  ));
                    
                  }

                  
                },
                child: Container(
                    child: Center(
                        child: Text('Delete Car',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter'))),
                    width: 333,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40),
                    )),
              )),
        ],
      ),
    );
  }
}
