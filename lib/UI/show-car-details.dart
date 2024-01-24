// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cars_app/model/car-model.dart';

class ShowCarDetailsPage extends StatelessWidget {
   CarModel car;
   Color color ;
   ShowCarDetailsPage({
    Key? key,
    required this.color,
    required this.car,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Center(child: Text('Car Details' , style: TextStyle(fontSize: 30),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(car.avatar , scale:0.4 , errorBuilder: (context, error, stackTrace) => FlutterLogo(),) ,
             Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('color:' , style: TextStyle(fontSize: 30),),
                Text(car.color , style: TextStyle(fontSize: 30),),
              ],
            ),
             Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('id:' , style: TextStyle(fontSize: 30),),
                Text(car.id, style: TextStyle(fontSize: 30),),
              ],
            ),
             Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('name:' , style: TextStyle(fontSize: 30),),
                Text(car.name, style: TextStyle(fontSize: 30),),
              ],
            ),
             Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('price:' , style: TextStyle(fontSize: 30),),
                Text(car.price.toString(), style: TextStyle(fontSize: 30),),
              ],
            ),
             Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('speed:' , style: TextStyle(fontSize: 30),),
                Text(car.speed.toString(), style: TextStyle(fontSize: 30),),
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}
