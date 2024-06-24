import 'dart:convert';

class Poem {
  Sentence? poemName;
  String? poetName;
  List<String>? recitationLinks;
  Texts? texts;
  List<String>? tags;
  String? poemUID;

  Poem({
    this.poemName,
    this.poetName,
    this.recitationLinks,
    this.texts,
    this.tags,
    this.poemUID,
  });

  factory Poem.fromRawJson(String str) => Poem.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory Poem.fromJson(Map<String, dynamic> json) => Poem(
        poemName: json["poem_name"] == null
            ? null
            : Sentence.fromJson(json["poem_name"]),
        poetName: json["poet_name"],
        recitationLinks: json["recitation_links"] == null
            ? []
            : List<String>.from(json["recitation_links"]!.map((x) => x)),
        texts: json["texts"] == null ? null : Texts.fromJson(json["texts"]),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "poem_name": poemName?.toJson(),
        "poet_name": poetName,
        "recitation_links": recitationLinks == null
            ? []
            : List<dynamic>.from(recitationLinks!.map((x) => x)),
        "texts": texts?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}

class Sentence {
  List<Word>? words;

  Sentence({
    this.words,
  });

  factory Sentence.fromRawJson(String str) =>
      Sentence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sentence.fromJson(Map<String, dynamic> json) => Sentence(
        words: json["words"] == null
            ? []
            : List<Word>.from(json["words"]!.map((x) => Word.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "words": words == null
            ? []
            : List<dynamic>.from(words!.map((x) => x.toJson())),
      };
}

class Word {
  String? local;
  String? latinTranslitaration;

  Word({
    this.local,
    this.latinTranslitaration,
  });

  factory Word.fromRawJson(String str) => Word.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        local: json["local"],
        latinTranslitaration: json["latin_translitaration"],
      );

  Map<String, dynamic> toJson() => {
        "local": local,
        "latin_translitaration": latinTranslitaration,
      };
}

class Texts {
  String? localLanguage;
  List<Sentence>? sentences;

  Texts({
    this.localLanguage,
    this.sentences,
  });

  factory Texts.fromRawJson(String str) => Texts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Texts.fromJson(Map<String, dynamic> json) => Texts(
        localLanguage: json["local_language"],
        sentences: json["sentences"] == null
            ? []
            : List<Sentence>.from(
                json["sentences"]!.map((x) => Sentence.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "local_language": localLanguage,
        "sentences": sentences == null
            ? []
            : List<dynamic>.from(sentences!.map((x) => x.toJson())),
      };
}
