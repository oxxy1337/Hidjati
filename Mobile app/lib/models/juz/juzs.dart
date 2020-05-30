import 'package:school/models/juz/juz.dart';

class Juzs {
  List<Juz> juz;

  Juzs({this.juz});

  factory Juzs.fromJson(List<dynamic> parsedJson) {

    List<Juz> juz = List<Juz>();
    juz = parsedJson.map((i)=> Juz.fromJson(i)).toList();

    return Juzs(
       juz: juz,
    );
  }
}