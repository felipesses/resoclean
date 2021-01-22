import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/math_trivia.dart';
import '../repositories/math_trivia_repository.dart';

class GetRandomMathTrivia implements UseCase<MathTrivia, NoParams> {
  final MathTriviaRepository repository;

  GetRandomMathTrivia(this.repository);

  @override
  Future<Either<Failure, MathTrivia>> call(NoParams params) async {
    return await repository.getRandomMathTrivia();
  }
}
