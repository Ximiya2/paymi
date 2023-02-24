import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymi/item/all_item.dart';
import 'package:paymi/states.dart';
import '../storage/storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade500,
      body: ListView.builder(
        shrinkWrap: true,
        //scrollDirection: Axis.vertical,
        itemCount:
        //toDoList.length,
        box!.values.length ?? 0,
        itemBuilder: (context, index){
          return AllItem(
              context,
            // toDoList[index]
            box!.getAt(index)!,
          );
        },

      ),
    );
  }
}
