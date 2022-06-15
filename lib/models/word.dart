import 'package:equatable/equatable.dart';

class Word extends Equatable{
  final String title, sentence, duration, start, end, meaning;
  Word.withData(
      {required this.title,
      required this.duration,
      required this.end,
      required this.meaning,
      required this.sentence,
      required this.start});
  factory Word.FromJson(Map<String, dynamic> json) {
    return Word.withData(
      title: json["title"] ?? "",
      sentence: json["sentence"] ?? "",
      duration: json["duration"] ?? "",
      end: json["end"] ?? "",
      meaning: json["meaning"] ?? "",
      start: json["start"] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "sentence": sentence,
      "duration": duration,
      "end": end,
      "meaning": meaning,
      "start": start,
    };
  }

  @override
  List<Object?> get props => [title];
}
