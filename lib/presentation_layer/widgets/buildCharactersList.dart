import 'package:breaking_bad/data_layer/models/characters.dart';
import 'package:flutter/material.dart';

import 'buildGridItem.dart';
Widget buildCharactersList(List<Character>searchedCharacters,List<Character>allCharacters,TextEditingController searchController)
{
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        childAspectRatio: 2.5/3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      itemCount: searchController.text.isEmpty||searchedCharacters!.isEmpty?allCharacters!.length:searchedCharacters!.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context,index){
        return buildGridItem(searchController.text.isEmpty||searchedCharacters!.isEmpty?allCharacters![index]:searchedCharacters![index],context);
      });
}