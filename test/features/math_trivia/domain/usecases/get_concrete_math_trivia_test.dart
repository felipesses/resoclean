import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:resoclean/app/features/math_trivia/domain/entities/math_trivia.dart';
import 'package:resoclean/app/features/math_trivia/domain/repositories/math_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resoclean/app/features/math_trivia/domain/usecases/get_concrete_math_trivia.dart';

class MockMathTriviaRepository extends Mock implements MathTriviaRepository {}

void main() {
  GetConcreteMathTrivia usecase;
  MockMathTriviaRepository mockMathTriviaRepository;

  setUp(() {
    mockMathTriviaRepository = MockMathTriviaRepository();
    usecase = GetConcreteMathTrivia(mockMathTriviaRepository);
  });

  final tNumber = 1;
  final tMathTrivia = MathTrivia(text: "test", number: 1);

  test(
    'should get trivia for the math from the repository',
    () async {
      // arrange
      when(mockMathTriviaRepository.getConcreteMathTrivia(any))
          .thenAnswer((_) async => Right(tMathTrivia));
      // act
      final result = await usecase.execute(number: tNumber);
      // assert
      expect(result, Right(tMathTrivia));
      verify(mockMathTriviaRepository.getConcreteMathTrivia(tNumber));
      verifyNoMoreInteractions(mockMathTriviaRepository);
    },
  );
}
