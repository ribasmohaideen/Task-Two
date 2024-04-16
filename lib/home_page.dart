import 'package:assesment_second/character_details.dart';
import 'package:assesment_second/toast.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List characters = [];
  @override
  void initState() {
    super.initState();
    getListData();
  }

  getListData() async {
    final response = await HttpServices().get('/api/characters');
    print(response["data"][1]);
    if (response["status"] == 200) {
      setState(() {
        characters = response["data"];
      });
    } else {
      showToast("Something Went Wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Characters"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CharacterDetail(characterDetails: {
                      "characterName": characters[index]["name"],
                      "actorName": characters[index]["actor"],
                      "houseName": characters[index]["house"],
                      "pictureData": characters[index]["image"]
                    });
                  }));
                },
                title: Text(characters[index]["name"]),
                leading: characters[index]["image"] == "" ||
                        characters[index]["image"] == null
                    ? const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                            "https://safeschoolsconference.com/wp-content/uploads/2020/06/0-No-Picture-template.jpg"),
                        backgroundColor: Colors.transparent,
                      )
                    : CircleAvatar(
                        radius: 20.0,
                        backgroundImage:
                            NetworkImage(characters[index]["image"]),
                        backgroundColor: Colors.transparent,
                      ),
                // leading:  Container(
                //   decoration:const ShapeDecoration(shape: CircleBorder(eccentricity: 0.5),),
                //   child: Image.network(characters[index]["image"])),
              );
            }),
      ),
    );
  }
}
