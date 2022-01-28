import 'package:flutter/material.dart';
import 'package:rickmorty_app/home/model/character.dart';
import 'package:rickmorty_app/home/widgets/table_row.dart';
import 'package:rickmorty_app/utils/theme.dart';

class CharacterDetails extends StatelessWidget {
  final Result characterData;

  @required
  CharacterDetails({required this.characterData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.generalColors.green,
        title: const Text('Character Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  characterData.image,
                  width: 160,
                  height: 160,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  characterData.name,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TableRowDetails(
                title: 'Status',
                value:
                    characterData.status.toString().replaceAll('Status.', ''),
              ),
              TableRowDetails(
                title: 'Species',
                value:
                    characterData.species.toString().replaceAll('Species.', ''),
              ),
              TableRowDetails(
                title: 'Gender',
                value:
                    characterData.gender.toString().replaceAll('Gender.', ''),
              ),
              TableRowDetails(
                title: 'Origin',
                value: characterData.origin.name,
              ),
              TableRowDetails(
                title: 'Last Location',
                value: characterData.location.name,
              )
            ],
          ),
        ),
      ),
    );
  }
}
