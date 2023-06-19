import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';

import 'package:pocketdex/constants/pages.dart';
import 'package:pocketdex/widgets/buttons/floating.dart';
import 'package:pocketdex/widgets/cards/pokemon.dart';
import 'package:pocketdex/widgets/searchers/pokemon.dart';

class PokemonPage extends StatefulWidget {
  final String _partialPokemon;

  const PokemonPage({super.key, required String partialPokemon})
      : _partialPokemon = partialPokemon;

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  Pokemon? _pokemon;

  @override
  void initState() {
    super.initState();
    _fetchPokemon();
  }

  void _fetchPokemon() async {
    final pokemon = await Pokedex().pokemon.get(name: widget._partialPokemon);
    setState(() {
      _pokemon = pokemon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: PokemonSearchDelegate(pushReplacement: true));
              },
              icon: const Icon(Icons.search))
        ],
        title: Text(AppPage.pokemon.pageName),
      ),
      body: _pokemon != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[PokemonCard(pokemon: _pokemon!)],
            )
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: const FloatingButton(),
    );
  }
}
