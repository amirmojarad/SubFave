import 'package:subfave/models/word.dart';

class Collection {
  final String title;
  final List<Word> words;
  
  Collection({required this.title, required this.words});

  void addWords(List<Word> newWords){
    words.addAll(words);
  }

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      title: json["title"] ?? "",
       words: (json["edges"]["collection_words"] as List<dynamic>).map((e) => Word.fromJson(e)).toList());
  }

}