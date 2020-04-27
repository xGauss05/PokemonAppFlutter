import 'package:flutter/material.dart';
import 'package:practicaflutter/model/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(pokemon.name, style: new TextStyle(fontFamily: 'Pokemon')),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              child: Card(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Nº: ${pokemon.id}",
                  style: new TextStyle(fontFamily: 'Pokemon')),
              Text(pokemon.name,
                  style: new TextStyle(fontFamily: 'Pokemon', fontSize: 35.0)),
              Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(pokemon.img),
                )),
              ),
              Text("Altura:  ${pokemon.height}",
                  style: new TextStyle(fontFamily: 'Pokemon', fontSize: 15.0)),
              Text("Peso:  ${pokemon.weight}",
                  style: new TextStyle(fontFamily: 'Pokemon', fontSize: 15.0)),
              Text("Tipos de ${pokemon.name}: ",
                  style: new TextStyle(fontFamily: 'Pokemon', fontSize: 15.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type
                    .map((t) => FilterChip(
                        backgroundColor: getColor(t),
                        label: Text(
                          t,
                          style: new TextStyle(fontFamily: 'Pokemon'),
                        ),
                        onSelected: (b) {}))
                    .toList(),
              ),
              Text("${pokemon.name} es debil a: ",
                  style: new TextStyle(fontFamily: 'Pokemon', fontSize: 15.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses
                    .map((t) => FilterChip(
                        label: Text(t,
                            style: new TextStyle(
                                fontFamily: 'Pokemon', fontSize: 15.0)),
                        backgroundColor: getColor(t),
                        onSelected: (b) {}))
                    .toList(),
              ),
              Text("Evoluciones de ${pokemon.name}: ",
                  style: new TextStyle(fontFamily: 'Pokemon', fontSize: 15.0)),
              hasEvolutions(),
            ],
          )))
        ],
      ),
    );
  }

  Row hasEvolutions() {
    if (pokemon.nextEvolution != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: pokemon.nextEvolution
            .map((n) => FilterChip(
                label:
                    Text(n.name, style: new TextStyle(fontFamily: 'Pokemon')),
                backgroundColor: Colors.tealAccent,
                onSelected: (b) {}))
            .toList(),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text("No puede evolucionar mas.",
                style: new TextStyle(fontFamily: 'Pokemon')),
          )
        ],
      );
    }
  }

  Color getColor(String type) {
    switch (type) {
      case "Grass":
        {
          return Color(0xFF7AC74C);
        }
      case "Fire":
        {
          return Color(0xFFEE8130);
        }
      case "Water":
        {
          return Color(0xFF6390F0);
        }
      case "Rock":
        {
          return Color(0xFFB6A136);
        }
      case "Ground":
        {
          return Color(0xFFE2BF65);
        }
      case "Steel":
        {
          return Color(0xFFB7B7CE);
        }
      case "Dark":
        {
          return Color(0xFF705746);
        }
      case "Ghost":
        {
          return Color(0xFF735797);
        }
      case "Poison":
        {
          return Color(0xFFA33EA1);
        }
      case "Psychic":
        {
          return Color(0xFFF95587);
        }
      case "Normal":
        {
          return Color(0xFFA8A77A);
        }
      case "Fighting":
        {
          return Color(0xFFC22E28);
        }
      case "Dragon":
        {
          return Color(0xFF6F35FC);
        }
      case "Fairy":
        {
          return Color(0xFFD685AD);
        }
      case "Ice":
        {
          return Color(0xFF96D9D6);
        }
      case "Electric":
        {
          return Color(0xFFF7D02C);
        }
      case "Flying":
        {
          return Color(0xFFA98FF3);
        }
      case "Bug":
        {
          return Color(0xFFA6B91A);
        }
      default:
        {
          return Colors.white;
        }
    }
  }
}
