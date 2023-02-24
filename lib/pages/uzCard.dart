import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymi/item/all_item.dart';
import 'package:paymi/states.dart';

class UzCard extends StatefulWidget {
  const UzCard({Key? key}) : super(key: key);

  @override
  State<UzCard> createState() => _UzCardState();
}

class _UzCardState extends State<UzCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade500,
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: uzCardList.length,
          itemBuilder: (context, index){
            return AllItem(
              context,
              uzCardList[index]
          );
          }
      ),
    );
  }
}
