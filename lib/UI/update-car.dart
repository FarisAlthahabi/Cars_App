import 'package:cars_app/service/car-service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cars_app/UI/add-car.dart';


class UpdateCarPage extends StatelessWidget {
  const UpdateCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: Text(
          'Updating a car Page',
          style: TextStyle(fontSize: 30),
        )),
      ),

      body: Center(
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
                          hintText: '   black', border: InputBorder.none),
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
                      hintText: '   Image.jpg', border: InputBorder.none),
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
                          hintText: '   300 ', border: InputBorder.none),
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
                          hintText: '   20000', border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, top: 70),
                child: InkWell(
                  onTap: () {
                    CarsService().Updatecar(
                      ColorController.text,
                      NameController.text,
                      IdController.text,
                      ImageController.text,
                      num.parse(PriceController.text),
                      num.parse(SpeedController.text),
                    );
                     ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(
                        'Car with id ${IdController.text} is updated successfully',
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
                          child: Text('Update Car',
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
      ),

    );
  }
}