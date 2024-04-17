import 'package:assesment_second/controllers.dart/navigation_controller.dart';
import 'package:assesment_second/screens/character_details.dart';
import 'package:assesment_second/utils/strings.dart';
import 'package:assesment_second/widgets/shimmer.dart';
import 'package:assesment_second/widgets/toast.dart';
import 'package:flutter/material.dart';

import '../services/api.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showShimmer = true;
  List characters = [];
  @override
  void initState() {
    super.initState();
    getListData();
  }

  getListData() async {
    final response = await HttpServices().get('/api/characters');
    if (response["status"] == 200) {
      setState(() {
        characters = response["data"];
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          showShimmer = false;
        });
      });
    } else {
      showToast(Strings.toastErrorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.dashboardDrawer),
        backgroundColor: ColorTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: showShimmer
            ? const ShimmerList()
            : ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      navigateWithRoute(
                          context,
                          CharacterDetail(characterDetails: {
                            "characterName": characters[index]["name"],
                            "actorName": characters[index]["actor"],
                            "houseName": characters[index]["house"],
                            "pictureData": characters[index]["image"]
                          }));
                    },
                    title: Text(characters[index]["name"]),
                    leading: characters[index]["image"] == "" ||
                            characters[index]["image"] == null
                        ? CircleAvatar(
                            radius: 20.0,
                            backgroundImage: const NetworkImage(
                                "https://safeschoolsconference.com/wp-content/uploads/2020/06/0-No-Picture-template.jpg"),
                            backgroundColor: ColorTheme.transparentColor,
                          )
                        : CircleAvatar(
                            radius: 20.0,
                            backgroundImage:
                                NetworkImage(characters[index]["image"]),
                            backgroundColor: ColorTheme.transparentColor,
                          ),
                  );
                }),
      ),
    );
  }
}
