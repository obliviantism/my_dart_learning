//using class members
import 'dart:html';
import 'dart:math';

class Person {
  final String _name;
  Person(this._name);
  String greet(String who) => 'Hi, $who. Do you know who I am?';
}

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
  Vector2d.named({required this.x, required this.y});
}

class Vector3d extends Vector2d {
  final double z;
  Vector3d(super.x, super.y, this.z);
  Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);
}

class Queue {
  static const initialCapacity = 16;
}

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }
  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

void test_0() {
  var logger = Logger('UI');
  logger.log('Button clicked');

  var logMap = {'name': 'UI'};
  var loggerJson = Logger.fromJson(logMap);
}

void test_1() {
  assert(Queue.initialCapacity == 16);
}

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double? x;
  double? y;
  late double? z = this.x;
  double? distanceTo(Point p) {
    if (p.x != null && p.y != null) {
      double? dist = sqrt(pow(p.x!, 2) + pow(p.y!, 2));
      return dist;
    }
    return null;
  }

  Point(this.x, this.y);

  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson():($x, $y)');
  }
  Point.withAssert(this.x, this.y) : assert(x != null && x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }
  // Delegates to the main constructor.
  Point.alongXAxis(double x) : this(x, 0);

  static double? distanceBetween(Point a, Point b) {
    if (a.x != null && a.y != null && b.x != null && b.y != null) {
      var dx = a.x! - b.x!;
      var dy = a.y! - b.y!;
      return sqrt(pow(dx, 2) + pow(dy, 2));
    }
    return null;
  }
}

class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = ' ';
}

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);
  final double x, y;
  const ImmutablePoint(this.x, this.y);
}

class Impostor implements Person {
  String get _name => '';
  String greet(String who) => 'Hi $who. Do you know who I am?';

  String greetBob(Person person) => person.greet('Bob');

  void main() {
    print(greetBob(Person('Kathy')));
    print(greetBob(Impostor()));
  }
}

void test_2() {
  var p = Point(2, 2);
  var a = p?.y;

  assert(p.y == 2);
  double? distance = p.distanceTo(Point(4, 4));
  var p2 = Point.fromJson({'x': 1, 'y': 2});

  var p3 = const ImmutablePoint(1, 1);
  var p4 = const ImmutablePoint(1, 1);
  assert(identical(p3, p4));
  const pointAndLine = const {
    'point': const [const ImmutablePoint(0, 0)],
    'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)]
  };

  print('The type of a is ${a.runtimeType}');
}

//methods
class Vector {
  final int x, y;
  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  @override
  bool operator ==(Object other) =>
      other is Vector && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);
}

void test_3() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}

//Getters and setters

class Rectangle {
  double left, top, width, height;
  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  double get right => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}

void test_4() {
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}

//Abstract methods
abstract class Doer {
  void doSomething();
}

class EffectiveDoer extends Doer {
  void doSomething() {}
}

//Extend a class
class Television {
  set contrast(int value) {}

  void turnOn() {
    //_illuminateDisplay();
    //_activateIrsensor();
  }
}

class SmartTelevision extends Television {
  set contrast(num value) {}
  void turnOn() {
    super.turnOn();
    //_bootNetworkInterface();
    //_initializeMemory();
    //_upgradeApps();
  }
}

//nosuchMethod()
class A {
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: '
        '${invocation.memberName}');
  }
}

//mixins

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void ertertainMe() {
    if (canPlayPiano) {
      print('Playing Piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

//class Musician extends Person with Musical {}

class Maestro extends Person with Musical {
  Maestro(String maestroName) {
    _name = maestroName;
    canConduct = true;
  }
}


//abstract mixin class 
abstract mixin class Musician {
  void playInstrument(String instrumentName);

  void playPiano() {
    playInstrument('Piano');
  }
  void playFlute() {
    playInstrument('Flute');
  }
}

class Virtuoso with Musician { // Use Musician as a mixin
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }  
} 

class Novice extends Musician { // Use Musician as a class
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName poorly');
  }  
}