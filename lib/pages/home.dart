import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';

import 'package:pocketdex/constants/pages.dart';
import 'package:pocketdex/widgets/cards/pokemon.dart';
import 'package:pocketdex/widgets/buttons/floating.dart';
import 'package:pocketdex/widgets/drawers/default.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Pokemon> _pokemons = [];
  final scrollController = ScrollController();
  bool isLimit = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPokemons();
    handleScroll();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchPokemons() async {
    try {
      _pokemons.addAll((await Future.wait((await Pokedex()
                  .pokemon
                  .getPage(offset: _pokemons.length, limit: 10))
              .results
              .map((partialPokemon) =>
                  Pokedex().pokemon.get(name: partialPokemon.name))))
          .whereType<Pokemon>());
    } catch (e) {
      setState(() {
        isLimit = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> handleScroll() async {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          !isLoading) {
        setState(() {
          isLoading = true;
        });
        _fetchPokemons();
        setState(() {
          isLoading = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppPage.home.pageName),
      ),
      body: _pokemons.isNotEmpty
          ? ListView.builder(
              controller: scrollController,
              itemCount: _pokemons.length + 1,
              itemBuilder: (context, index) {
                if (index < _pokemons.length) {
                  return InkWell(
                    child: PokemonCard(pokemon: _pokemons[index]),
                    onTap: () {},
                  );
                } else if (!isLimit) {
                  return const Card(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(child: CircularProgressIndicator())),
                  );
                } else {
                  return null;
                }
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const DefaultDrawer(),
      floatingActionButton: const FloatingButton(),
    );
  }
}
