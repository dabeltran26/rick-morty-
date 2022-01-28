import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty_app/home/bloc/home_bloc.dart';
import 'package:rickmorty_app/home/bloc/home_event.dart';
import 'package:rickmorty_app/home/bloc/home_state.dart';
import 'package:rickmorty_app/home/model/character.dart';
import 'package:rickmorty_app/home/widgets/character_widget.dart';
import 'package:rickmorty_app/utils/theme.dart';

import '../repositories/character_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CharactersRepository userRepository = CharactersRepository();
  late HomeBloc? _homeBloc;
  TextEditingController? controllerSearchField;
  List<Result>? myCharacters;

  @override
  void initState() {
    _homeBloc = HomeBloc(userRepository)..add(Init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size padding = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyTheme.generalColors.white,
        appBar: AppBar(
          backgroundColor: MyTheme.generalColors.green,
          title: const Text('Rick & Morty App'),
        ),
        body: BlocBuilder(
          bloc: _homeBloc,
          builder: (context, state) {
            if (state is DataState) {
              myCharacters = myCharacters ?? state.myCharacters;
              return Stack(children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: myCharacters!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CharacterCard(character: myCharacters![index],);
                          }),
                    )
                  ],
                ),
                myCharacters!.isEmpty
                    ? Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: Text(
                          "No hay coincidencias.",
                          style: TextStyle(color: MyTheme.generalColors.black),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox(),
              ]);
            }

            return Center(
                child: CircularProgressIndicator(
              backgroundColor: MyTheme.generalColors.green,
            ));
          },
        ));
  }
}
