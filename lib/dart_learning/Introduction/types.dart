void display() {
  var x = 1;
  var hex = 0xDEADBEEF;

  var y = 1.1;
  var exponents = 1.42e5;

  num n = 1;
  n += 2.5;

  double z = 1;

  var one = int.parse('1');
  assert(one == 1);

  var onePointOne = 1.toString();
  assert(onePointOne == 1.1);

  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  String piAsString = 3.1415926.toString();
  assert(piAsString == '3.14');

  assert((3 << 1) == 6); 
  assert((3 | 4) == 7); 
  assert((3 & 4) == 0); 

  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  var s = 'string interpolation';

  assert('Dart has $s, which is very handy.' ==
    'Dart has string interpolation, '
        'which is very handy.');
  assert('That deserves all caps. '
        '${s.toUpperCase()} is very handy!' ==
    'That deserves all caps. '
        'STRING INTERPOLATION is very handy!');


  //var record = ('first', a: 2, b: true, 'last');

  var list = [
  'Car',
  'Boat',
  'Plane',
  ];

  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
  };

  var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
  };
  
  //var gifts = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  //var nobleGases = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  
}

abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

typedef IntList = List<int>;
IntList il = [1, 2, 3];


typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
}