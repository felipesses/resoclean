import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/math_trivia.dart';

abstract class MathTriviaRepository {
  Future<Either<Failure, MathTrivia>> getConcreteMathTrivia(int number);
  Future<Either<Failure, MathTrivia>> getRandomMathTrivia();
}
