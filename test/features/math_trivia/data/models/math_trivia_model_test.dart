import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:resoclean/app/features/math_trivia/data/models/math_trivia_model.dart';
import 'package:resoclean/app/features/math_trivia/domain/entities/math_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tMathTriviaModel = MathTriviaModel(number: 1, text: "Test Text");

  test('sould be a sublcass of MathTrivia entity', () async {
    // arrange

    // act

    // assert
    expect(tMathTriviaModel, isA<MathTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      // arrange
      final Map<String, Object> jsonMap = json.decode(fixture('trivia.json'));

      // act
      final result = MathTriviaModel.fromJson(jsonMap);

      // assert
      expect(result, tMathTriviaModel);
    });
    test('should return a valid model when the JSON number is an double', () {
      // arrange
      final Map<String, Object> jsonMap =
          json.decode(fixture('trivia_double.json'));
      // act
      final result = MathTriviaModel.fromJson(jsonMap);

      // assert
      expect(result, tMathTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      // arrange

      // act
      final result = tMathTriviaModel.toJson();
      final expectedMap = {"text": "Test Text", "number": 1};

      // assert
      expect(result, expectedMap);
    });
  });
}
