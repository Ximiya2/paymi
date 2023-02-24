import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';
import 'package:mask/models/hashtag_is.dart';
import 'package:paymi/pages/uzCard.dart';
import '../models/todoListModel.dart';
import '../states.dart';
import '../storage/storage.dart';
import 'homa_page.dart';
import 'humo.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  
  var nameCtr = TextEditingController();
  var numberCtr = TextEditingController();
  var dateCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.indigo.shade900,
        appBar: AppBar(
          backgroundColor:  Colors.indigo.shade900,
          elevation: 0,
          title: Text('Add Item'),
          actions: [
            Icon(Icons.question_mark)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(getRandImg()!), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Stack(
                        children: [
                          Positioned( top: 15, left: 15,
                            child: Text(numberCtr.text.startsWith('860') ? 'UzCard' : 'Humo', style: TextStyle(color: Colors.white),),
                          ),
                          Positioned( top: 50, left: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(nameCtr.text, style: TextStyle(color: Colors.white, fontSize: 20),),
                                SizedBox(height: 15,),
                                 Row(
                                  children: [
                                    Text(numberCtr.text.isNotEmpty ? '9 697.25 ' : '0 000.00 ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                    Text('сум', style: TextStyle(color: Colors.white, fontSize: 15),),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Text(nameCtr.text, style: TextStyle(color: Colors.white,fontSize: 20),),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Row(
                              children: [
                                Text('${numberCtr.text}',style: TextStyle(color: Colors.white,fontSize: 20)),
                                SizedBox(width: 10,),
                                Text('${dateCtr.text}',style: TextStyle(color: Colors.white,fontSize: 17)),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                  // SizedBox(
                  //   height: 220,
                  //   width: MediaQuery.of(context).size.width*0.9,
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: toDoList.length,
                  //       itemBuilder: (context, index) {
                  //       return ImageItem(context, toDoList[index]);
                  //       }
                  //   ),
                  // ),

                  const Text('Card number',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    onChanged: (val){
                      _formKey.currentState!.validate();
                      setState(() {});
                    },
                    controller: numberCtr,
                    keyboardType: TextInputType.number,
                    //maxLength: 20,
                    inputFormatters: [
                      Mask.generic(
                        masks: ['#### #### #### ####'],
                        hashtag: Hashtag.numbers, // optional field
                      ),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade700,
                      border: const OutlineInputBorder(
                        borderRadius:  BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      hintText: 'Card number',
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide:
                      //   BorderSide(color: Colors.blue, width: 2.0),
                      // ),
                      // fillColor: Colors.white,
                      // filled: true,
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      // ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Please enter your number';
                      }
                      if(value.length < 19){
                        return 'Please enter 16 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14,),
                  const Text('Expire date',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    onChanged: (val){
                      _formKey.currentState!.validate();
                      setState(() {});
                    },
                    controller: dateCtr,
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [
                      Mask.generic(
                        masks: ['##/##'],
                        hashtag: Hashtag.numbers, // optional field
                      ),
                    ],
                    decoration: InputDecoration(
                    //    errorBorder: dateCtr.text.isNotEmpty ?
                    //   (int.parse(dateCtr.text[0]) < 1 ||
                    //       int.parse(dateCtr.text[0]) == 1 &&
                    //           int.parse(dateCtr.text[1]) < 2)
                    //       ? new OutlineInputBorder(
                    //   borderSide: new BorderSide(color: Colors.red, width: 1.0),
                    // ) :  new OutlineInputBorder(
                    //   borderSide: new BorderSide(color: Colors.green, width: 1.0),
                    // ) : OutlineInputBorder(
                    //      borderSide: new BorderSide(color: Colors.grey, width: 1.0),
                    //    ),
                    filled: true,
                      fillColor: Colors.blue.shade700,
                      hintText: 'Expire date',
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Please enter your date!';
                      } else if(int.parse(dateCtr.text[0]) < 1 ||
                          int.parse(dateCtr.text[0]) == 1 &&
                              int.parse(dateCtr.text[1]) < 2 ||
                          int.parse(dateCtr.text[3]) > 2 ||
                          int.parse(dateCtr.text[3]) == 2 &&
                              int.parse(dateCtr.text[4]) > 8){
                        return 'Please enter your date right!';
                      }
                      if(value.length < 5){
                        return 'Please enter 4 digits';
                      }
                       return null;

                    },
                  ),
                  SizedBox(height: 14,),
                  Text('Card Name',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    onChanged: (val){
                      _formKey.currentState!.validate();
                      setState(() {});
                    },
                    controller: nameCtr,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade700,
                      hintText: 'Card name',
                      //suffixStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Please enter your name!';
                      }
                      return null;
                    },
                  ),
                   SizedBox(height: 30,),

                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                          }
                          var newNote = TodoListModel(
                              name: nameCtr.text,
                              nomer: numberCtr.text,
                              date: dateCtr.text,
                              image: getRandImg()!,
                              card: numberCtr.text.startsWith('8600') ? 'UzCard' : 'Humo');
                          if(nameCtr.text != '' && numberCtr.text != '' && dateCtr.text != ''){
                            //toDoList.add(newNote);
                            if(int.parse(dateCtr.text[0]) < 1 ||
                               int.parse(dateCtr.text[0]) == 1 &&
                               int.parse(dateCtr.text[1]) < 2 ||
                               int.parse(dateCtr.text[3]) <= 2 ||
                                int.parse(dateCtr.text[3]) == 2 &&
                                    int.parse(dateCtr.text[4]) <= 8
                            ) {



                              // if(numberCtr.text.startsWith('9860')){
                              //   humoList.add(newNote);
                              // } else if(numberCtr.text.startsWith('8600')){
                              //   uzCardList.add(newNote);
                              // }
                                 box!.add(newNote);
                                setState(() {});
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/MainView',
                                    (Route<dynamic> route) => false);

                            }
                          }
                          else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.indigo.shade500,
                                    title: Text('Action', style: TextStyle(color: Colors.white),),
                                    content: Text('Malumotni kiriting!',style: TextStyle(color: Colors.white),),
                                  );
                                });
                          }
                        },
                        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 140, right: 140, top: 10, bottom: 10),
                          child: Text('Done'),
                        )),
                  )

                ],
              ),
            ),

    ),
        ));
  }
}

String? getRandImg(){

  var random = Random();
  var randomNumber = random.nextInt(6) + 1;

  switch(randomNumber) {
    case 1 : {return 'assets/images/card1.jpg';}
    case 2 : {return 'assets/images/card2.jpg';}
    case 3 : {return 'assets/images/i.webp';}
    case 4 : {return 'assets/images/i (1).webp';}
    case 5 : {return 'assets/images/i (2).webp';}
    default : return 'assets/images/i (2).webp';
    
  }

}