import 'package:breaking_bad/data_layer/models/character_quotes.dart';

abstract class CharacterQuotesStates{}
class CharacterQuotesInitial extends CharacterQuotesStates{}
class CharacterQuotesLoaded extends CharacterQuotesStates{
  final List<CharacterQuotes> characterQuotes;
  CharacterQuotesLoaded(this.characterQuotes);
}
class CharacterQuotesFailedLoaded extends CharacterQuotesStates{
  final String error;
  CharacterQuotesFailedLoaded(this.error);
}