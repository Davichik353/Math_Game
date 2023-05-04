import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:math_game/home/const.dart';
import 'package:math_game/util/cmc.dart';
import 'package:math_game/util/number_key.dart';

import '../util/cmc1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //номбера
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'Del',
    '1',
    '2',
    '3',
    '=',
    '0'
  ];
  //ответ
  String userAnswer = '';
  //нажатий
  void buttomTapped(String button) {
    setState(() {
      if (button == "=") {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'Del') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 5) {
        userAnswer += button;
      }
    });
  }
void checkResult(){
  if(numberA+numberB==int.parse(userAnswer)){
    showDialog(context: context, builder: (context){
return Cmc(icon: Icons.arrow_forward, message: 'Правильео!', onTap:goNextQuestion );
    });
  }else {
  showDialog(context: context, builder: (context){
    return Cmc2(
      message: "Тупой подумай еще",
      onTap: goBack,
      icon: Icons.arrow_back,
    );
  });
  }
}
int numberA=2;
int numberB=7;
void goNextQuestion(){
  Navigator.of(context).pop();
  setState(() {
    userAnswer='';
  });
  numberA =randomNumber.nextInt(1000);
  numberB=randomNumber.nextInt(3000);
}
void goBack(){
  Navigator.of(context).pop();
  
}
var randomNumber=Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
   color: Colors.cyanAccent.shade400,
          child: Column(
            children: [
              //игрок должен дать 5 правильных ответ для прохождения
              Container(
                height: 130,
                color: Colors.cyanAccent.shade400,
              ),
        
              //вопрос
              Container(
                
                child: Expanded(
                    child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //вопрос 1
                      Text(numberA.toString()+'+'+numberB.toString()+'=', style: whiteTextStyle),
                      //поля для ответов
                      Container(
                        height: 50,
                        width: 150,
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        )),
                      )
                    ],
                  ),
                )),
              ),
              //клавитура
              Expanded(
                
                  flex: 2,
                  child: Padding(
                    
                    padding: const EdgeInsets.all(4.0),
                    child: GridView.builder(
                      
                        itemCount: numberPad.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          
                            crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return MyButton(
                            
                            child: numberPad[index],
                            onTap: () => buttomTapped(numberPad[index]),
                          );
                        }),
                  ))
            ],
          ),
        ));
  }
}
