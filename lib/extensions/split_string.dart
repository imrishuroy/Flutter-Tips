// https://raw.githubusercontent.com/vandadnp/flutter-tips-and-tricks/main/images/split-string-by-length-in-dart.jpg

// void testIt() {
//   assert('dartlang'
//       .splitByLength(5, filler: '💙')
//       .isEqualTo(['💙💙dar', 'tlang']));

//   assert('0100010'.splitByLength(4).isEqualTo(['0010', '0010']));
//   assert('foobar'.splitByLength(3).isEqualTo(['foo', 'bar']));
//   assert('flutter'.splitByLength(4, filler: 'X').isEqualTo(['Xflu', 'tter']));
//   assert('dart'.splitByLength(5, filler: '').isEqualTo(['dart']));
// }

// extension SplitByLength on String {
//   Iterable<String> splitByLength(int len, {String filler = '0'}) sync* {
//     final missingFromLength =
//         length % len == 0 ? 0 : len - (characters.length % len);
//     final expectedLength = length + missingFromLength;
//     final src = padLeft(expectedLength, filler);
//     final chars = src.characters;
//     for (var i = 0; i < chars.length; i += len) {
//       yield chars.getRange(i, i + len).toString();
//     }
//   }
// }

void testIt() {
  assert('dartlang'.splitByLength(5, filler: '💙') == ['💙💙dar', 'tlang']);
  // .isEqualTo(['💙💙dar', 'tlang']));

  // assert('0100010'.splitByLength(4).isEqualTo(['0010', '0010']));
  // assert('foobar'.splitByLength(3).isEqualTo(['foo', 'bar']));
  // assert('flutter'.splitByLength(4, filler: 'X').isEqualTo(['Xflu', 'tter']));
  // assert('dart'.splitByLength(5, filler: '').isEqualTo(['dart']));
}

extension SplitByLength on String {
  Iterable<String> splitByLength(int len, {String filler = '0'}) sync* {
    final missingFromLength =
        length % len == 0 ? 0 : len - (codeUnits.length % len);
    final expectedLength = length + missingFromLength;
    final src = padLeft(expectedLength.toInt(), filler);
    final chars = src.codeUnits; // .characters;
    for (var i = 0; i < chars.length; i += len) {
      yield chars.getRange(i, i + len).toString();
    }
  }
}
