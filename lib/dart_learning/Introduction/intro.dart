import 'dart:math';
import 'dart:async';
import 'dart:io';

void main() {
  print('Hello, World!');
}

//variables
var name = 'Voyager I';
var year = 2004;
var antennaDiameter = 3.70;
var flybyobjects = ['Jupiter', 'Saturn', 'Uranus', "Neptune"];
var image = {
  'tags': ['saturn'],
  'url': 'www.google.com'
};

//flow controlling
void flowcontrol() {
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyobjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
}

//functions
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);

void display1() {
  flybyobjects.where((name) => name.contains('turn')).forEach(print);
}

//This is a comment.

//class
class Spacecraft {
  String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;

  //constuctor
  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void display2() {
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('voyager III');
  voyager3.describe();
}

//Enum
enum PlanetType { terrestrial, gas, ice }

enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.gas, moons: 0, hasRings: false),
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false);

  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});
  final PlanetType planetType;
  final int moons;
  final bool hasRings;
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void display3() {
  final yourPlanet = Planet.earth;

  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }
}

//extension
class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

//Mixins

mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate) {}
}

//interfaces & abstract class
//class MockSpaceship implements Spacecraft {}

abstract class Describable {
  void describe();
  void describeWithEmphasis() {
    print('=====');
    describe();
    print('=====');
  }
}

//asynchronous
const oneSecond = Duration(seconds: 1);

Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> createDescription(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

//Exception
int astronauts = 1;
void display4() {
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }
}

Future<void> describeFlybyObjects(List<String> flyObjects) async {
  try {
    for (final object in flyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyobjects.clear();
  }
}
