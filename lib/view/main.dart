import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practicaflutter/model/pokemon.dart';
import 'package:practicaflutter/view/pokemon_detail.dart';

void main() => runApp(MaterialApp(title: "Pokemon", home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Api: https://github.com/Biuni/PokemonGO-Pokedex
  final url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeManager pManager;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    pManager = PokeManager.fromJson(decodedJson);
    // En el body del build, hacemos una comprobación, en cuando se hayan recogido
    // los datos, actualizamos la homepage para que salgan los resultados con
    // el siguiente código
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.info),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Creado por:",
                    style: new TextStyle(fontFamily: 'Pokemon')),
                content: new Text("Jonathan Cacay Llanes",
                    style: new TextStyle(fontFamily: 'Pokemon')),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Close",
                        style: new TextStyle(fontFamily: 'Pokemon')),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          "Pokedex Kanto (Pokemon GO)",
          style: new TextStyle(fontFamily: 'Pokemon'),
        ),
        backgroundColor: Colors.red,
      ),
      // Comprobar si los datos se han recogido, si no, mostramos un indicador
      // de que se está buscando
      body: pManager == null
          ? Center(
              child: CircularProgressIndicator(),
            )
      // Cuadrícula que muestra cada uno de los Pokemon
          : GridView.count(
              crossAxisCount: 3,
              children: pManager.pokemon
                  .map((pokemon) => Padding(
                        padding: EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokemonDetail(
                                          pokemon: pokemon,
                                        )));
                          },
                          child: Hero(
                            tag: pokemon.id,
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Text("Nº ${pokemon.id}",
                                      style:
                                          new TextStyle(fontFamily: 'Pokemon')),
                                  Container(
                                    height: 61.0,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(pokemon.img))),
                                  ),
                                  Text(
                                    "${pokemon.name}",
                                    style: new TextStyle(fontFamily: 'Pokemon'),
                                    textAlign: TextAlign.center,
                                  ),
                                  // Text(poke.name)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
