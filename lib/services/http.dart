import 'dart:convert';

import 'package:http/http.dart' as http;

class Person {
  final String name, height, mass, hairColor, skinColor, eyeColor;

  Person({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color']
    );
  }

  @override String toString() {
    return 'Person: {$name, $height, $mass, $hairColor, $skinColor, $eyeColor}';
  }
}

Future<String> getPerson([id = 1]) async {
  var url = Uri.parse('https://swapi.dev/api/people/$id');
  var response = await http.get(url);

  if (response.statusCode >= 400)
    return 'Error:, statusCode:${response.statusCode}';
  final json = jsonDecode(response.body);
  final person = Person.fromJson(json);
  return person.toString();
}

void doPrint() async{
  var url = Uri.parse('https://swapi.dev/api/people/');
  var response = await http.get(url);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
