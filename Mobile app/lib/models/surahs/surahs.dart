import 'package:school/models/surahs/surah.dart';

class Surahs {
  List<Surah> surah;

  Surahs({this.surah});

  factory Surahs.fromJson(List<dynamic> parsedJson) {

    List<Surah> surah = List<Surah>();
    surah = parsedJson.map((i)=> Surah.fromJson(i)).toList();

    return Surahs(
       surah: surah,
    );
  }
}