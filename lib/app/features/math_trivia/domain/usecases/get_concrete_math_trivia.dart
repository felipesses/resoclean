import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/math_trivia.dart';
import '../repositories/math_trivia_repository.dart';

class GetConcreteMathTrivia {
  final MathTriviaRepository repository;

  GetConcreteMathTrivia(this.repository);

  Future<Either<Failure, MathTrivia>> execute({@required int number}) async {
    return await repository.getConcreteMathTrivia(number);
  }
}
