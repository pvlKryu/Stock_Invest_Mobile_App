import 'package:flutter/material.dart';

import 'main.dart';

class Shares extends StatelessWidget {
  const Shares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          const Text(
            'Популярные акции:',
            style: TextStyle(fontSize: 25, color: Colors.black),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: actionObjs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              actionObjs[index].nameAction,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Стоимость: ${actionObjs[index].costAction}",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Количество: ${actionObjs[index].amountAction}",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Валюта: ${actionObjs[index].valyteAction}",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => const AlertDialog(
                                        title: Text("Покупка"),
                                        // content: Text(text_tmp),
                                        content: Text("Куплено"),
                                      ),
                                    );
                                  },
                                  child: const Text('Купить'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => const AlertDialog(
                                          title: Text("Продажа"),
                                          // content: Text(text_tmp),
                                          content: Text("Продано"),
                                        ),
                                      );
                                    },
                                    child: const Text('Продать'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
