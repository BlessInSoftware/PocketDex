import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';

import 'package:pocketdex/classes/create_animated_route.dart';
import 'package:pocketdex/pages/pokemon.dart';
import 'package:pocketdex/themes/theme.dart';

class PokemonSearchDelegate extends SearchDelegate {
  final pokemonList = Pokedex().pokemon.getAll();
  final bool _pushReplacement;

  PokemonSearchDelegate({bool pushReplacement = false})
      : _pushReplacement = pushReplacement;

  @override
  String? get searchFieldLabel => 'Search for a Pokémon';

  Widget _searchResults(BuildContext context) {
    try {
      return FutureBuilder(
        future: pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final filteredPokemonsList = (snapshot.data!.results
                  .where((element) =>
                      element.name.startsWith(query.toLowerCase()) ||
                      element.url.contains(query.toLowerCase()))
                  .toList());
              if (filteredPokemonsList.isNotEmpty) {
                return ListView.builder(
                  itemCount: filteredPokemonsList.length,
                  itemBuilder: (context, index) {
                    final pokemon = filteredPokemonsList[index].name;
                    return InkWell(
                      onTap: () {
                        close(context, null);
                        snapshot.data != null
                            ? _pushReplacement
                                ? Navigator.pushReplacement(
                                    context,
                                    CreateAnimatedRoute(
                                      page:
                                          PokemonPage(partialPokemon: pokemon),
                                    ).slideVertically(),
                                  )
                                : Navigator.push(
                                    context,
                                    CreateAnimatedRoute(
                                      page:
                                          PokemonPage(partialPokemon: pokemon),
                                    ).slideVertically(),
                                  )
                            : null;
                      },
                      child: ListTile(
                        title: Text(
                            '${pokemon[0].toUpperCase()}${pokemon.substring(1)}'),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('Not found'));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      );
    } catch (e) {
      return Center(child: Text(e.toString()));
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) => searchDelegateTheme(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isNotEmpty) {
              query = '';
            } else {
              close(context, null);
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _searchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _searchResults(context);
  }
}
