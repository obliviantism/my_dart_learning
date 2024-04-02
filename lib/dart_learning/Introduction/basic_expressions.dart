//import library
import 'dart:html';
import 'intro.dart' show name;
import 'intro.dart' hide name;
import 'dart:math' deferred as math;


//variables
var name1 = 'Bob';
Object name2 = 'Bob';
String name3 = 'Bob';

String? name4;

void display1() {
  int? lineCount;
  assert(lineCount == null);
}

int lineCount = 0;

int CountLines() {
  return 1;
}

void display2() {
  int lineCount;
  bool weLikeToCount = true;
  if (weLikeToCount) {
    lineCount = CountLines();
  } else {
    lineCount = 0;
  }
  print(lineCount);
}

late String description;
void main() {
  description = 'Feijoada!!!';
  print(description);
}

String readThermometer() {
  return '1';
}

late String temperature = readThermometer();

final name = 'Bob';
final String nickname = 'Bobby';

const bar = 100010;
const double atm = 1.010124 * bar;

var foo = const [];
const baz = [];
const fool = [1, 2, 3]; // Was const []

const Object i = 4;
const list = [i as int];
const map = {if (i is int) i: 'int'};
const set = {if (list is List<int>) ...list};

//Operators
void ops() {
  var a = 1, b = 2, T = 3;
  var c;
  a++;
  a + b;
  a = b;
  a == b;
  c ? a : b;
  a is int;

  if ((a % b == 0) && (a + c) == 0) {}

  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5);
  assert(5 ~/ 2 == 2);
  assert(5 % 2 == 1);
  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  int a1;
  int b1;
  a1 = 0;
  b1 = ++a1;
  assert(a1 == b1);

  a1 = 0;
  b1 = a++;
  assert(a1 != b1);

  a1 = 0;
  b1 = --a;
  assert(a1 != b1);

  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  a = 1;
  int? tmp;
  tmp ??= a;

  a = 2;
  a *= 3;
  assert(a == 6);

  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02);
  assert((value & ~bitmask) == 0x20);
  assert((value | bitmask) == 0x2f);
  assert((value ^ bitmask) == 0x2d);
  assert((value << 4) == 0x220);
  assert((value >> 4) == 0x02);
  assert((-value >> 4) == -0x03);
  assert((value >>> 4) == 0x02);
  assert((-value >>> 4) > 0);

  var isPublic;
  var visibility = isPublic ? 'public' : 'private';
  String playerName(String? name) => name ?? 'Guest';

/*
  var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;

  querySelector('#confirm') // Get an object.
  ?..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView();
*/
}

//Comments
//
/**/
///

//Metadata

class Television {
  @Deprecated('Use turnOn instead')
  void activate() {}
  void turnOn() {}
  @Todo('Dash', 'Implement this function')
  void dosomething() {
    print('Do Something');
  }
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}
