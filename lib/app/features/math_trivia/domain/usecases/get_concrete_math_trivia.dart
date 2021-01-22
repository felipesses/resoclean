import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/math_trivia.dart';
import '../repositories/math_trivia_repository.dart';

class GetConcreteMathTrivia implements UseCase<MathTrivia, Params> {
  final MathTriviaRepository repository;

  GetConcreteMathTrivia(this.repository);

  @override
  Future<Either<Failure, MathTrivia>> call(Params params) async {
    return await repository.getConcreteMathTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({@required this.number});

  @override
  List<Object> get props => [number];
}
