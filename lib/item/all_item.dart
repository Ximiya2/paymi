import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymi/models/todoListModel.dart';

Widget AllItem(
BuildContext context,
TodoListModel item,) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(item.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 15,
            child: Text(item.card, style: TextStyle(color: Colors.white),),
          ),
          Positioned(
            top: 50,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(color: Colors.white, fontSize: 20),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text('9 697.25 ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('сум', style: TextStyle(color: Colors.white, fontSize: 15),),
                  ],
                ),
                SizedBox(height: 15,),
                Text(item.name, style: TextStyle(color: Colors.white,fontSize: 20),),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Row(
              children: [
                Text('${item.nomer}',style: TextStyle(color: Colors.white,fontSize: 20)),
                SizedBox(width: 10,),
                Text('${item.date}',style: TextStyle(color: Colors.white,fontSize: 17)),
              ],
            ),
          ),

        ]
      ),
    ),
  );
}