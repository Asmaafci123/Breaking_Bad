import 'package:breaking_bad/business_layer/characters/characters_cubit.dart';
import 'package:breaking_bad/data_layer/models/character_quotes.dart';
import 'package:breaking_bad/data_layer/repositories/characters_repository.dart';
import 'package:breaking_bad/data_layer/web_services/characters_web_services.dart';
import 'package:breaking_bad/presentation_layer/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_layer/character_quotes/character_quotes_cubite.dart';

void main() {
  runApp(const BreakingBad());
}

class BreakingBad extends StatelessWidget {
  const BreakingBad({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final CharacterWebService characterWebService=CharacterWebService();
    final CharactersRepository charactersRepository=CharactersRepository(characterWebService);
    final CharactersCubit charactersCubit=CharactersCubit(charactersRepository);
    final CharacterQuotesCubit characterQuotesCubit=CharacterQuotesCubit(charactersRepository);
    return MultiBlocProvider(
        providers:
        [
        BlocProvider(
        create: (BuildContext context)=>charactersCubit,
        ),
          BlocProvider(
            create: (BuildContext context)=>characterQuotesCubit,
          ),
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  CharactersScreen(),
        ),);
  }
}