import 'dart:ui';

import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/data_layer/models/characters.dart';
import 'package:breaking_bad/presentation_layer/screens/characters_deatails_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget buildGridItem(Character character,BuildContext context)
{
  return InkWell(
    onTap: ()=>Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>CharactersDetailsScreen(character))),
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: GridTile(
        child:Hero(
          tag: character.char_id!,
          child:  Container(
            color: gry,
            child: character.img != null?
            Image(
                height:double.infinity ,
                width: double.infinity,
                image: NetworkImage(character!.img!)
            ) :
            Image(
              height:double.infinity ,
              width: double.infinity,
              image: AssetImage('assets/gifs/loading.gif'),
            )
            ,
          ),
        ),
        footer: Container(
          width: double.infinity,
          color:Colors.black.withOpacity(0.5),
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          alignment: Alignment.bottomCenter,
          child: Text('${character!.name!}',style: TextStyle(
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}