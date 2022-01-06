import 'package:breaking_bad/business_layer/characters/characters_state.dart';
import 'package:breaking_bad/data_layer/models/characters.dart';
import 'package:breaking_bad/data_layer/repositories/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersCubit extends Cubit<CharactersStates>
{
  final CharactersRepository charactersRepository;
  List<Character>? characters;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List<Character>? getAllCharacters()
  {
    charactersRepository.getAllCharacters()?.
    then((value) {
      emit(CharactersLoaded(value));
      characters=value;
    }).catchError((error){print('error');});
    return characters;
  }
}