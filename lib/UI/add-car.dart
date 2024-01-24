import 'package:cars_app/bloc/cars_bloc.dart';
import 'package:cars_app/model/car-model.dart';
import 'package:cars_app/service/car-service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_to_color/string_to_color.dart';

TextEditingController NameController = TextEditingController();
TextEditingController IdController = TextEditingController();
TextEditingController ColorController = TextEditingController();
TextEditingController SpeedController = TextEditingController();
TextEditingController PriceController = TextEditingController();
TextEditingController ImageController = TextEditingController();

class AddingCarsPage extends StatelessWidget {
  const AddingCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsBloc()..add(NavigateToAddCarPageEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: BlocListener<CarsBloc, CarsState>(
            listener: (context, state) {
              if (state is SuccessToNavigateToAddCarPage) {
                print('Success To Navigate To Add Car Page');
               if (state is SuccessToAddCar) {
                CarModel car = CarModel(
                  color: ColorController.text,
                  name: NameController.text,
                  id: IdController.text,
                  avatar: ImageController.text,
                  price: num.parse(PriceController.text),
                  speed: num.parse(SpeedController.text),
                );
                CarsService().AddCar(car);
                print('Success To Add Car');
              }
              

                

              } 
            },
            child: Center(
                child: Text(
              'Adding a car Page',
              style: TextStyle(fontSize: 30),
            )),
          ),
        ),
        body: BlocBuilder<CarsBloc, CarsState>(
          builder: (context, state) {
            if (state is SuccessToNavigateToAddCarPage) {
              return Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 400),
                      child: Text('Name',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(29, 30, 32, 1),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      child: Container(
                        width: 450,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(245, 246, 250, 1)),
                        child: TextField(
                          controller: NameController,
                          decoration: InputDecoration(
                              hintText: '   Audi', border: InputBorder.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text('Id',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter')),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 230),
                              child: Text('color',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(245, 246, 250, 1)),
                            child: TextField(
                              controller: IdController,
                              decoration: InputDecoration(
                                  hintText: '   20', border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(245, 246, 250, 1)),
                            child: TextField(
                              controller: ColorController,
                              decoration: InputDecoration(
                                  hintText: '   black',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 350),
                      child: Text('Image',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(29, 30, 32, 1),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      child: Container(
                        width: 450,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(245, 246, 250, 1)),
                        child: TextField(
                          controller: ImageController,
                          decoration: InputDecoration(
                              hintText: '   Image.jpg',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text('Speed',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter')),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 230),
                              child: Text('Price',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(29, 30, 32, 1),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(245, 246, 250, 1)),
                            child: TextField(
                              controller: SpeedController,
                              decoration: InputDecoration(
                                  hintText: '   300 ',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(245, 246, 250, 1)),
                            child: TextField(
                              controller: PriceController,
                              decoration: InputDecoration(
                                  hintText: '   20000',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20, top: 70),
                        child: InkWell(
                          onTap: () {
                            CarModel car = CarModel(
                              color: ColorController.text,
                              name: NameController.text,
                              id: IdController.text,
                              avatar: ImageController.text,
                              price: num.parse(PriceController.text),
                              speed: num.parse(SpeedController.text),
                            );
                            context.read<CarsBloc>().add(AddCarEvent(car: car)) ;
                            // CarsService().AddCar(car);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(new SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                'Car is added successfully',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal),
                              ),
                              backgroundColor: Colors.blue,
                            ));
                          },
                          child: Container(
                              child: Center(
                                  child: Text('Add Car',
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

            
            
            else {
              return Center(
                child: Text('error'),
              );
            }
          },
        ),
      ),
    );
  }
}
