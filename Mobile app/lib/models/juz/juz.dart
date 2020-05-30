import 'package:school/models/juz/juz_start_end.dart';

class Juz {
  String index;
  JuzStartEnd start;
  JuzStartEnd end;

  Juz({
    this.index,
    this.start,
    this.end,
  });

  factory Juz.fromJson(Map<String, dynamic> parsedJson) {
    return Juz(
      index: parsedJson['index'],
      start: JuzStartEnd.fromJson(parsedJson['start']),
      end: JuzStartEnd.fromJson(parsedJson['end']),
    );
  }
}
