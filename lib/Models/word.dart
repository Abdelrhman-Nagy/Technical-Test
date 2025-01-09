class Word {
  final String word;
  final String definition;
  final String example;

  Word({required this.word, required this.definition,required this.example});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'] ?? '',
      definition: json['definition'] ?? '',
      example: json['example'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'definition': definition,
      'example': example,
    };
  }
}