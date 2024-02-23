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

  List<PostModel> list = [];
  bool isLoading = false;

  Future<void> create(String path)async{
    PostModel postModel = PostModel(title: titleController.text.trim().toString(), desc: descController.text.trim().toString(), createdTime: DateTime.now().toIso8601String());
    await RTDBService.storeData(postModel: postModel, path: path);
    titleController.clear();
    descController.clear();
    log("Finished");
    await getPosts();
  }

  Future<void> getPosts()async{
    list = await RTDBService.getPosts(RTDBService.path);
    setState(() {});
  }

  Future<void>updatePost(PostModel postModel)async{
    await RTDBService.updatePost(postModel, RTDBService.path);
    await getPosts();
  }

  Future<void>deletePost(String id)async{
    await RTDBService.deletePost(RTDBService.path, id);
    await getPosts();
  }

  @override
  void initState() {
    getPosts().then((value) {
      isLoading = true;
      setState(() {});
    });
    super.initState();
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
              itemCount: list.length,
              itemBuilder: (_, index){
                return Card(
                  child: ListTile(
                    title: Text(list[index].title),
                    subtitle: Text(list[index].desc),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(list[index].createdTime.toString()),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: ()async{
                            PostModel postModel = PostModel(title: "title", desc: "desc");
                            list[index].title = postModel.title;
                            list[index].desc = postModel.desc;
                            await updatePost(list[index]);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: ()async{
                            await deletePost(list[index].id ?? "");
                          },
                        ),
                      ],
                    ),
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
