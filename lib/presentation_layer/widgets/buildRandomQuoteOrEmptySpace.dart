import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/business_layer/character_quotes/character_quotes_states.dart';
import 'package:breaking_bad/constants/colors.dart';
import 'package:flutter/material.dart';
Widget buildRandomQuoteOrEmptySpace(CharacterQuotesLoaded state)
{
  var quotes=(state).characterQuotes;
  if(quotes.length!=0)
  {
    int randomQuoteIndex=Random().nextInt(quotes.length-1);
    return Center(
        child:DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: white,
              shadows: [
                Shadow(
                    blurRadius: 7,
                    color: yellow,
                    offset: Offset(0,0)
                )
              ]
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              FlickerAnimatedText('${quotes![randomQuoteIndex].quote}'),
            ],
            repeatForever: true,

          ),)
    );
  }
  else
  {
    return Container();
  }
}