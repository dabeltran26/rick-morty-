import 'package:bloc/bloc.dart';
import 'package:rickmorty_app/home/bloc/home_event.dart';
import 'package:rickmorty_app/home/bloc/home_state.dart';
import 'package:rickmorty_app/home/model/character.dart';
import 'package:rickmorty_app/home/repositories/character_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final CharactersRepository? _characterRepository;

  HomeBloc(this._characterRepository) : super( Initialized() ) {

    List<Result> characterResult = [];

    on<Init>( (event, emit ) async {
          try{
            characterResult = await _characterRepository!.fetchAllCharacters();
            emit(DataState(characterResult));
          }catch(e){
            emit(const DataState([]));
            print('Error al traer la informacion');
          }
    });
  }
}