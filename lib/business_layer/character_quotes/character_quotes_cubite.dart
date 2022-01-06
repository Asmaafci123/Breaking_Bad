import 'package:breaking_bad/data_layer/models/character_quotes.dart';
import 'package:breaking_bad/data_layer/repositories/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'character_quotes_states.dart';

class CharacterQuotesCubit extends Cubit<CharacterQuotesStates>
{
  final CharactersRepository charactersRepository;
  List<CharacterQuotes>? characterQuotes;
  CharacterQuotesCubit(this.charactersRepository) : super(CharacterQuotesInitial());
  void getAllCharacterQuotes(String charName)
  {
    charactersRepository.getAllCharacterQuotes(charName)?.
    then((value) {
      emit(CharacterQuotesLoaded(value));
    }).catchError((error){print('error');});
  }
}