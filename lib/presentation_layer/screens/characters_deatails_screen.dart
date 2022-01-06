import 'package:breaking_bad/business_layer/character_quotes/character_quotes_cubite.dart';
import 'package:breaking_bad/business_layer/character_quotes/character_quotes_states.dart';
import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/data_layer/models/characters.dart';
import 'package:breaking_bad/presentation_layer/widgets/buildCharacterInfo.dart';
import 'package:breaking_bad/presentation_layer/widgets/buildDivider.dart';
import 'package:breaking_bad/presentation_layer/widgets/buildRandomQuoteOrEmptySpace.dart';
import 'package:breaking_bad/presentation_layer/widgets/buildSliverAppBar.dart';
import 'package:breaking_bad/presentation_layer/widgets/showProgressIndicator.dart';
import 'package:breaking_bad/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CharactersDetailsScreen extends StatelessWidget {
  CharactersDetailsScreen(this.character);
  final Character character;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterQuotesCubit>(context).getAllCharacterQuotes('${character.name}');
    return Scaffold(
      backgroundColor: gry,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(character),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.fromLTRB(14,14, 14, 0),
                    padding:  EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSCharacterInfo('Job : ',character.occupation!.join(' , ')),
                        buildDivider(getWidth(context)*0.8),
                        buildSCharacterInfo('Appeared in : ',character.category!),
                        buildDivider(getWidth(context)*0.645),
                        buildSCharacterInfo('Seasons : ',character.appearance!.join(' , ')),
                        buildDivider(getWidth(context)*0.7),
                        buildSCharacterInfo('Status : ',character.status!),
                        buildDivider(getWidth(context)*0.73),
                        character.better_call_saul_appearance!.isEmpty?Container():
                        buildSCharacterInfo('Better call Saul Appearance : ',character.better_call_saul_appearance!.join(' , ')),
                        character.better_call_saul_appearance!.isEmpty?Container():
                        buildDivider(getWidth(context)*0.25),
                        buildSCharacterInfo('Actor/Actress : ',character.portrayed!),
                        buildDivider(getWidth(context)*0.59),
                        SizedBox(
                          height: 30,
                        ),
                        BlocConsumer<CharacterQuotesCubit,CharacterQuotesStates>(
                            builder: (context,state)
                            {
                              if(state is CharacterQuotesLoaded)
                              {
                                return buildRandomQuoteOrEmptySpace(state);
                              }
                              else
                              {
                                return  showProgressIndicator();
                              }
                            },
                            listener: (context,state){})
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 450,
                  ),


                ]
              ))
        ],
      ),
    );
  }




}
