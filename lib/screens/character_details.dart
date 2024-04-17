import 'package:assesment_second/widgets/common_widget.dart';
import 'package:flutter/material.dart';

import '../utils/strings.dart';

class CharacterDetail extends StatelessWidget {
  final Map characterDetails;

  const CharacterDetail({super.key, required this.characterDetails});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(characterDetails["characterName"] ?? ""),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                  width: w * 0.8,
                  height: h * 0.5,
                  child: characterDetails["pictureData"] == ""
                      ? Image.network(
                          "https://safeschoolsconference.com/wp-content/uploads/2020/06/0-No-Picture-template.jpg",
                          fit: BoxFit.contain,
                        )
                      : Image.network(
                          characterDetails["pictureData"],
                          fit: BoxFit.contain,
                        )),
              textFieldWithLabel(Strings.labelName,
                  "${characterDetails["characterName"] ?? "-"}"),
              textFieldWithLabel(Strings.labelActor,
                  "${characterDetails["actorName"] ?? "-"}"),
              textFieldWithLabel(Strings.labelHouse,
                  "${characterDetails["houseName"] ?? "-"}"),
            ],
          ),
        ),
      ),
    );
  }
}
