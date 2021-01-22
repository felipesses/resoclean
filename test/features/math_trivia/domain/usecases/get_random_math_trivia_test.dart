import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:resoclean/app/core/usecases/usecase.dart';
import 'package:resoclean/app/features/math_trivia/domain/entities/math_trivia.dart';
import 'package:resoclean/app/features/math_trivia/domain/repositories/math_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resoclean/app/features/math_trivia/domain/usecases/get_random_math_trivia_test.dart';

class MockMathTriviaRepository extends Mock implements MathTriviaRepository {}

void main() {
  GetRandomMathTrivia usecase;
  MockMathTriviaRepository mockMathTriviaRepository;

  setUp(() {
    mockMathTriviaRepository = MockMathTriviaRepository();
    usecase = GetRandomMathTrivia(mockMathTriviaRepository);
  });

  // final tNumber = math.Random();
  final tMathTrivia = MathTrivia(text: "test", number: 1);

  test(
    'should get trivia from the repository',
    () async {
      // arrange
      when(mockMathTriviaRepository.getRandomMathTrivia())
          .thenAnswer((_) async => Right(tMathTrivia));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tMathTrivia));
      verify(mockMathTriviaRepository.getRandomMathTrivia());
      verifyNoMoreInteractions(mockMathTriviaRepository);
    },
  );
}
