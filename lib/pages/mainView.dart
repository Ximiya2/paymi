import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymi/pages/add_page.dart';
import 'package:paymi/pages/homa_page.dart';
import 'package:paymi/pages/uzCard.dart';
import 'package:paymi/states.dart';
import '../storage/storage.dart';
import 'humo.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this,);
    for(int i = 0; i < box!.values.length;i++){
      if(box!.getAt(i)!.card == 'Humo'){
        humoList.add(box!.getAt(i)! );
      } else if(box!.getAt(i)!.card == 'UzCard'){
        uzCardList.add(box!.getAt(i)!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: Text('My cards', style: TextStyle(color: Colors.white),),
        bottom: TabBar(
          indicatorColor: Colors.blue.shade400,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          controller: tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: 'Все карты',
            ),
            Tab(
              text: 'UzCard',
            ),
            Tab(
              text: 'Humo',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller:tabController ,
        children: [
          HomePage(),
          UzCard(),
          Humo(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
