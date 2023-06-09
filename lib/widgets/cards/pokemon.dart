import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';

import 'package:pocketdex/classes/color_maker.dart';
import 'package:pocketdex/themes/palette.dart';

const Map<String, int> colorsShade = {
  'id': 900,
  'name': 700,
  'type': 500,
  'sprite': 400
};

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  MaterialColor combineTypesColors() {
    return ColorMaker.combineMultipleMaterialColor(
        materialColors: pokemon.types
            .map((type) => palette['types']?[type.type.name])
            .toList());
  }

  MaterialColor combineCardAndTypesColors(BuildContext context) {
    return ColorMaker.combineMultipleMaterialColor(materialColors: [
      ColorMaker.toMaterialColor(color: Theme.of(context).cardTheme.color),
      combineTypesColors()
    ], dominance: 0.2);
  }

  Color? getTextColor(Color? backgroundColor) {
    if (backgroundColor == null) return null;
    double luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;
    return luminance > 0.6
        ? (palette['common']?['space-cadet'])
        : (palette['common']?['anti-flash-white']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: combineCardAndTypesColors(context),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: (combineTypesColors())[colorsShade['id']!],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              pokemon.id.toString(),
                              style: TextStyle(
                                color: getTextColor(
                                  (combineTypesColors())[colorsShade['id']!],
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: (combineTypesColors())[colorsShade['name']!],
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}',
                              style: TextStyle(
                                color: getTextColor(
                                  (combineTypesColors())[colorsShade['name']!],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: pokemon.types
                        .map(
                          (type) => Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: type == pokemon.types.first ? 0 : 2.5,
                                  right: type == pokemon.types.last ? 0 : 2.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: (palette['types']
                                      ?[type.type.name])?[colorsShade['type']!],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                ),
                                child: Center(
                                  child: Text(
                                    type.type.name[0].toUpperCase() +
                                        type.type.name.substring(1),
                                    style: TextStyle(
                                      color: getTextColor(
                                        (palette['types']?[type.type.name])?[
                                            colorsShade['type']!],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height <
                            MediaQuery.of(context).size.width
                        ? MediaQuery.of(context).size.height * 0.17
                        : MediaQuery.of(context).size.width * 0.21,
                  ),
                  child: Stack(
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          double iconSize =
                              constraints.maxHeight > constraints.maxWidth
                                  ? constraints.maxWidth * 1
                                  : constraints.maxHeight * 1;
                          return Center(
                            child: Icon(
                              Icons.catching_pokemon,
                              size: iconSize,
                              color: (combineTypesColors())[
                                  colorsShade['sprite']!],
                            ),
                          );
                        },
                      ),
                      Center(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 1,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            enlargeFactor: 2,
                          ),
                          items: [
                            pokemon.sprites.frontDefault,
                            pokemon.sprites.backDefault
                          ]
                              .whereType<String>()
                              .map(
                                (sprite) => Image.network(
                                  sprite,
                                  fit: BoxFit.contain,
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
