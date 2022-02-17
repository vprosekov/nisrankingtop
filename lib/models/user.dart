import 'achievement.dart';

class User {
  String iin;
  String name;
  String grade;
  String shanyraq;
  String scores;
  String rating;
  String type;
  List<Achievement> achievements;

  User(
      {required this.iin,
      required this.name,
      required this.grade,
      required this.shanyraq,
      required this.scores,
      required this.rating,
      required this.type,
      required this.achievements});
}
