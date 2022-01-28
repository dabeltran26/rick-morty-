import 'package:flutter/material.dart';
import 'package:rickmorty_app/home/model/character.dart';
import 'package:rickmorty_app/home/pages/character_details.dart';
class CharacterCard extends StatelessWidget {
  final Result character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CharacterDetails(characterData: character)),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          margin: EdgeInsets.all(15),
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Column(
              children: <Widget>[
                Image(
                  image: NetworkImage(character.image),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(character.name),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(character.species),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(character.status),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(character.location.name),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
