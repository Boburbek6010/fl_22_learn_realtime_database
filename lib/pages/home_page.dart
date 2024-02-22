import 'dart:developer';

import 'package:fl_22_learn_realtime_database/models/post_model.dart';
import 'package:fl_22_learn_realtime_database/services/rtdb_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "/home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();


  Future<void> create(String path)async{
    PostModel postModel = PostModel(title: titleController.text.trim().toString(), desc: descController.text.trim().toString(), createdTime: DateTime.now().toIso8601String());
    await RTDBService.storeData(data: postModel.toJson(), path: path);
    titleController.clear();
    descController.clear();
    log("Finished");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Title"
                    ),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        hintText: "Description"
                    ),
                    controller: descController,
                  ),
                  ElevatedButton(
                    onPressed: ()async{
                      await create("products");
                    },
                    child: const Text("Create"),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index){
                return const Card(
                  child: ListTile(
                    title: Text("title"),
                    subtitle: Text("subtitle"),
                    trailing: Text("trailing"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
