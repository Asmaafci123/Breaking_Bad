import 'package:breaking_bad/data_layer/models/characters.dart';

abstract class CharactersStates{}
class CharactersInitial extends CharactersStates{}
class CharactersLoaded extends CharactersStates{
  final List<Character> characters;
  CharactersLoaded(this.characters);
}
class CharactersFailedLoaded extends CharactersStates{
  final String error;
  CharactersFailedLoaded(this.error);
}