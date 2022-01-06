import 'package:breaking_bad/data_layer/models/character_quotes.dart';
import 'package:breaking_bad/data_layer/models/characters.dart';
import 'package:breaking_bad/data_layer/web_services/characters_web_services.dart';

class CharactersRepository
{
  late CharacterWebService characterWebService;
  CharactersRepository(this.characterWebService);
  Future<List<Character>>? getAllCharacters() async {
    final characters=await characterWebService.getAllCharacters();
    return (characters.map((character) => Character.fromJson(Map<String, dynamic>.from(character))).toList());

   }

  Future<List<CharacterQuotes>>? getAllCharacterQuotes(String characterName) async {
    final quotes=await characterWebService.getAllCharacterQuotes(characterName);
    return (quotes.map((quote) => CharacterQuotes.fromJson(Map<String, dynamic>.from(quote))).toList());

  }
}
