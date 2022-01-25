import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:local_database/models/post.dart';
import 'package:local_database/services/database_helper.dart';
import 'package:local_database/components/text_field_outline.dart';

class LocalDatabase extends StatefulWidget {

  @override
  _LocalDatabaseState createState() => _LocalDatabaseState();
}

class _LocalDatabaseState extends State<LocalDatabase> {
  int? selectedId;
  final priceController = TextEditingController();
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('local database'),
        ),
        body: Column(
          children: [
            TextFieldOutline(textEditingController: priceController, hintText: 'price',),
            TextFieldOutline(textEditingController: contentController, hintText: 'content',),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: FutureBuilder<List<Post>>(
                  future: DatabaseHelper.instance.getPosts(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Post>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('Loading'),
                      );
                    }
                    return snapshot.data!.isEmpty
                        ? const Center(child: Text('no posts'))
                        : ListView(
                            children: snapshot.data!.map((answerTemp) {
                              return Dismissible( // 슬라이드기능
                                direction: DismissDirection.endToStart, // 방향을 지정해두고 onDismissed 콜백함수에서 삭제로직 수행
                                background: Container(color: Color(0xFFf082ac),),
                                key: UniqueKey(),
                                onDismissed: (direction) {
                                  print('direction'+direction.toString());
                                  if(direction == DismissDirection.endToStart) {
                                    setState(() {
                                      DatabaseHelper.instance
                                          .remove(answerTemp.id!);
                                    });
                                  }
                                },
                                child: Center(
                                  child: Card(
                                    color: selectedId == answerTemp.id
                                        ? Colors.white70
                                        : Colors.white,
                                    child: ListTile(
                                      onTap: () {
                                        setState(() {
                                          if (selectedId == null) {
                                            priceController.text =
                                                answerTemp.price;
                                            contentController.text =
                                                answerTemp.content;
                                            selectedId = answerTemp.id;
                                          } else {
                                            priceController.text = '';
                                            contentController.text = '';
                                            selectedId = null;
                                          }
                                        });
                                      },
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('가격: ' + answerTemp.price),
                                          Text('내용: ' + answerTemp.content),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              setState(() {
                                                DatabaseHelper.instance
                                                    .remove(answerTemp.id!);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () async {
                selectedId != null
                    ? await DatabaseHelper.instance.update(
                        Post(
                          id: selectedId,
                          content: priceController.text,
                          price: contentController.text,
                        ),
                      )
                    : await DatabaseHelper.instance.add(
                        Post(
                            price: priceController.text,
                            content: contentController.text),
                      );
                setState(() {
                  priceController.clear();
                  contentController.clear();
                  selectedId = null;
                });
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FloatingActionButton(
                child: const Icon(Icons.delete),
                onPressed: () async {
                  await DatabaseHelper.instance.removeAll();
                  setState(() {
                    priceController.clear();
                    contentController.clear();
                    selectedId = null;
                  });
                }),
          ],
        ),
      ),
    );
  }
}


