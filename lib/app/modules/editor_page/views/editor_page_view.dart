import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';

import '../controllers/editor_page_controller.dart';

class EditorPageView extends GetView<EditorPageController> {
  const EditorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('EditorPageView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.poemNameController,
                  decoration: const InputDecoration(labelText: 'Poem Name'),
                ),
                TextField(
                  controller: controller.poemNameLatinController,
                  decoration:
                      const InputDecoration(labelText: 'Poem Name latin'),
                ),
                TextField(
                  controller: controller.poetNameController,
                  decoration: const InputDecoration(labelText: 'Poet Name'),
                ),
                TextField(
                  controller: controller.poemYTlinkController,
                  decoration: const InputDecoration(
                      labelText: 'Recitation Links (space separated) hello'),
                ),
                Column(
                  children: [
                    for (int i = 0;
                        i <
                            (controller.poem.value?.texts?.sentences?.length ??
                                0);
                        i++)
                      SentenceEditWidget(
                        sentence: controller.poem.value?.texts?.sentences?[i],
                        controller: controller,
                        index: i,
                      ),
                    IconButton(
                      onPressed: () {
                        List<Sentence> sentences =
                            controller.poem.value?.texts?.sentences ?? [];
                        sentences.add(Sentence(words: []));
                        Poem poem = Poem.fromJson(
                            controller.poem.value?.toJson() ?? {});
                        poem.texts?.sentences = sentences;
                        controller.poem.value = poem;
                      },
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),
                TextField(
                  controller: controller.poemTagsController,
                  decoration: const InputDecoration(
                    labelText: 'Tags (space separated)',
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.savePoem();
                  },
                  child: const Text('send to FB'),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class SentenceEditWidget extends StatelessWidget {
  const SentenceEditWidget(
      {super.key,
      required this.sentence,
      required this.controller,
      required this.index});

  final Sentence? sentence;
  final EditorPageController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: Colors.blueAccent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < (sentence?.words?.length ?? 0); i++)
              WordEditWidget(
                key: UniqueKey(),
                word: sentence?.words?[i],
                controller: controller,
                sentenceIndex: index,
                wordIndex: i,
              ),
            IconButton(
              onPressed: () {
                List<Sentence> sentences =
                    controller.poem.value?.texts?.sentences ?? [];
                sentences.removeAt(index);
                Poem poem =
                    Poem.fromJson(controller.poem.value?.toJson() ?? {});
                poem.texts?.sentences = sentences;
                controller.poem.value = poem;
              },
              icon: const Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                List<Word> words =
                    controller.poem.value?.texts?.sentences?[index].words ?? [];
                words.add(Word());
                Poem poem =
                    Poem.fromJson(controller.poem.value?.toJson() ?? {});
                poem.texts?.sentences?[index].words = words;
                controller.poem.value = poem;
              },
              icon: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}

class WordEditWidget extends StatefulWidget {
  const WordEditWidget(
      {super.key,
      required this.word,
      required this.controller,
      required this.sentenceIndex,
      required this.wordIndex});

  final Word? word;
  final EditorPageController controller;
  final int sentenceIndex;
  final int wordIndex;

  @override
  State<WordEditWidget> createState() => _WordEditWidgetState();
}

class _WordEditWidgetState extends State<WordEditWidget> {
  late TextEditingController localController;
  late TextEditingController latinTranslitarationController;

  @override
  void initState() {
    localController = TextEditingController(text: widget.word?.local);
    latinTranslitarationController =
        TextEditingController(text: widget.word?.latinTranslitaration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: Colors.amberAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              List<Word> words = widget.controller.poem.value?.texts
                      ?.sentences?[widget.sentenceIndex].words ??
                  [];
              words.removeAt(widget.wordIndex);
              Poem poem =
                  Poem.fromJson(widget.controller.poem.value?.toJson() ?? {});
              poem.texts?.sentences?[widget.sentenceIndex].words = words;
              widget.controller.poem.value = poem;
            },
            icon: const Icon(Icons.delete),
          ),
          Container(
            height: 40,
            width: 200,
            margin: const EdgeInsets.all(8),
            color: Colors.greenAccent,
            child: TextField(
              controller: localController,
              onChanged: (String s) {
                widget.word?.local = s;
              },
              decoration: const InputDecoration(labelText: 'Local'),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            width: 200,
            margin: const EdgeInsets.all(8),
            color: Colors.redAccent,
            child: TextField(
              controller: latinTranslitarationController,
              onChanged: (String s) {
                widget.word?.latinTranslitaration = s;
              },
              decoration: const InputDecoration(labelText: 'TransLitaration'),
            ),
          )
        ],
      ),
    );
  }
}
