import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymi/item/all_item.dart';
import 'package:paymi/states.dart';

class Humo extends StatefulWidget {
  const Humo({Key? key}) : super(key: key);

  @override
  State<Humo> createState() => _HumoState();
}

class _HumoState extends State<Humo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade500,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: humoList.length,
        itemBuilder: (context, index){
          return AllItem(
              context,
              humoList[index],
          );
        },
      )
    );
  }
}
