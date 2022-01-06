
import 'package:breaking_bad/business_layer/characters/characters_cubit.dart';
import 'package:breaking_bad/business_layer/characters/characters_state.dart';
import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/data_layer/models/characters.dart';
import 'package:breaking_bad/presentation_layer/widgets/buildCharactersList.dart';
import 'package:breaking_bad/presentation_layer/widgets/buildGridItem.dart';
import 'package:breaking_bad/presentation_layer/widgets/buildNoInternetWidget.dart';
import 'package:breaking_bad/presentation_layer/widgets/showProgressIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
   List<Character>? allCharacters;
   List<Character>?searchedCharacters;
   var searchController=TextEditingController();
   bool isSearching=false;
  @override
  void initState()
  {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }
   Widget buildSearchTextField()
   {
     return TextField(
       controller: searchController,
       cursorColor: yellow,
       decoration: InputDecoration(
         border: InputBorder.none,
         hintText: 'Find a character...',
         hintStyle: TextStyle(
             color: gry,
             fontSize: 18
         ),
       ),
       style: TextStyle(
           color: gry,
           fontSize: 18
       ),
       onChanged: (String searchText){
         searchedCharacters=allCharacters!.where((character) =>character.name!.toLowerCase().startsWith(searchText)).toList();
         setState(() {

         });
       },
     );
   }
   List<Widget>buildAppBarActions()
   {
     if(isSearching)
       {
         return [
           IconButton(
               onPressed: clear,
               icon: Icon(Icons.clear,color: gry,))
         ];
       }
     else
       {
         return [
           IconButton(
               onPressed: search,
               icon: Icon(Icons.search,color: gry,))
         ];
       }
   }
   void search()
   {
     ModalRoute.
     of(context)!.
     addLocalHistoryEntry(
         LocalHistoryEntry(onRemove:clear ));
     setState(() {
       isSearching=true;
     });
   }
   void clear()
   {
     setState(() {
       searchController.clear();
       isSearching=false;
     });
     Navigator.pop(context);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        leading:isSearching?BackButton(color: gry,):Container(width: 0,height: 0,),
        title: isSearching?buildSearchTextField():Text('Characters',style: TextStyle(
            fontSize: 16,
            color: gry,
            fontWeight: FontWeight.bold
        ),),
     actions: buildAppBarActions()
      ),
      body:OfflineBuilder(
          connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
          ){
            final bool connected = connectivity != ConnectivityResult.none;
          if(connected)
            {
              return buildBody();
            }
          else
            {
              return Center(child: buildNoInternetWidget());
            }
          },
        child: showProgressIndicator()
     // ,
    ));
  }
  Widget buildBody()
  {
    return BlocConsumer<CharactersCubit,CharactersStates>(
        builder: (context,state){
          if(state is CharactersLoaded)
            {
              allCharacters=(state).characters;
              return buildListWidget();
            }
          else
            {
              return  showProgressIndicator();
            }
        },
        listener: (context,state){});
  }
  Widget buildListWidget()
  {
    return SingleChildScrollView(
      child: Container(
        color: gry,
        child: Column(
          children: [
            buildCharactersList()
          ],
        ),
      ),
    );
  }
   Widget buildCharactersList()
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

}
