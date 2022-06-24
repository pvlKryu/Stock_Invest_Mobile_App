import 'dart:convert';

import 'package:flutter/material.dart';

import 'shares.dart';
import 'portfolio.dart';
import 'profile.dart';
import 'custom_theme.dart';

String arrayObjsText =
    "{\"actions\": [{\"name_action\": \"МТС\",\"cost_action\": 60.1,\"amount_action\": 1,\"valyte_action\": \"RUB\"},{\"name_action\": \"Apple\",\"cost_action\": 131.3,\"amount_action\": 2, \"valyte_action\": \"USD\"},{\"name_action\": \"Северсталь\",\"cost_action\": 735.8,\"amount_action\": 3,\"valyte_action\": \"RUB\"},{\"name_action\": \"Target\",\"cost_action\": 139.2, \"amount_action\": 4, \"valyte_action\": \"USD\"},{\"name_action\": \"Yandex\",\"cost_action\": 1465.1, \"amount_action\": 5, \"valyte_action\": \"RUB\"},{\"name_action\": \"Аэрофлот\",\"cost_action\": 28.0, \"amount_action\": 2, \"valyte_action\": \"RUB\"},{\"name_action\": \"Газпром\",\"cost_action\": 315.9,\"amount_action\": 6, \"valyte_action\": \"RUB\"}]}";

var actionObjsJson = jsonDecode(arrayObjsText)['actions'] as List;
List<Action> actionObjs =
    actionObjsJson.map((actionJson) => Action.fromJson(actionJson)).toList();

void main() {
  //Добавим Материал App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyClass(),
      theme: CustomTheme.lightTheme,
    );
  }
}

class MyClass extends StatefulWidget {
  const MyClass({Key? key}) : super(key: key);

  @override
  State<MyClass> createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Portfolio(),
    Shares(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Портфель',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Акции',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Action {
  String nameAction;
  double costAction;
  int amountAction;
  String valyteAction;

  Action(
      this.nameAction, this.costAction, this.amountAction, this.valyteAction);
  factory Action.fromJson(dynamic json) {
    return Action(json['name_action'] as String, json['cost_action'] as double,
        json['amount_action'] as int, json['valyte_action'] as String);
  }

  @override
  String toString() {
    return '{ $nameAction, $costAction, $amountAction, $valyteAction }';
  }
}

double brokerageAccountCount() {
  double usdConverer = 1;
  double brokerageAccountCounter = 0;
  for (int i = 0; i < actionObjs.length; i++) {
    if (actionObjs[i].valyteAction == 'USD') usdConverer = 57.5;
    brokerageAccountCounter +=
        actionObjs[i].costAction * actionObjs[i].amountAction * usdConverer;
    usdConverer = 1;
  }
  return brokerageAccountCounter;
}
