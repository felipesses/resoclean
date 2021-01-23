import 'package:resoclean/app/features/math_trivia/domain/entities/math_trivia.dart';
import 'package:meta/meta.dart';

class MathTriviaModel extends MathTrivia {
  MathTriviaModel({
    @required int number,
    @required String text,
  }) : super(text: text, number: number);

  factory MathTriviaModel.fromJson(Map<String, Object> json) => MathTriviaModel(
        number: (json['number'] as num).toInt(),
        text: json['text'],
      );
  Map<String, Object> toJson() => {
        'text': text,
        'number': number,
      };
}
