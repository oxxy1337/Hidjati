import 'package:school/models/surahs/juz.dart';

class Surah {
  String place;
  String type;
  int count;
  String title;
  String titleAr;
  String index;
  String pages;
  Juz juz;

  Surah({
    this.place,
    this.type,
    this.count,
    this.title,
    this.titleAr,
    this.index,
    this.pages,
    this.juz,
  });

  factory Surah.fromJson(Map<String, dynamic> parsedJson) {

    Juz juz = Juz.fromJson(parsedJson['juz'][0]);

    return Surah(
      place: parsedJson['place'],
      type: parsedJson['type'],
      count: parsedJson['count'],
      title: parsedJson['title'],
      titleAr: parsedJson['titleAr'],
      index: parsedJson['index'],
      pages: parsedJson['pages'],
      juz: juz,
    );
  }
}
