import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';

class PoemViewPageController extends GetxController {
  Rx<Poem?> poem = Rx<Poem?>(
    Poem(
      poemName: PoemName(
        words: [
          Word(
            local: 'আনন্দলোকে মঙ্গলালোকে',
            latinTranslitaration: 'Anandalöke mangalalöke',
          ),
        ],
      ),
      poetName: 'RabindraNath Tagore',
      recitationLinks: [
        'http://eknumber.com',
        'http://duinumber.com',
      ],
      texts: Texts(
        localLanguage: 'English',
        sentences: [
          PoemName(
            words: [
              Word(
                local: 'আনন্দলোকে',
                latinTranslitaration: 'Anandalöke',
              ),
              Word(
                local: 'মঙ্গলালোকে',
                latinTranslitaration: 'mangalalöke',
              ),
              Word(
                local: 'বিরাজ',
                latinTranslitaration: 'biraja',
              ),
              Word(
                local: 'সত্যসুন্দর।\n',
                latinTranslitaration: 'satyasundara.\n',
              ),
            ],
          ),
          PoemName(
            words: [
              Word(
                local: 'মহিমা',
                latinTranslitaration: 'Mahima',
              ),
              Word(
                local: 'তব',
                latinTranslitaration: 'taba',
              ),
              Word(
                local: 'উদ্ভাসিত',
                latinTranslitaration: 'udbhasita',
              ),
              Word(
                local: 'মহাগগনমাঝে।\n',
                latinTranslitaration: 'mahagaganamajhe.\n',
              ),
            ],
          ),
          PoemName(
            words: [
              Word(
                local: 'বিশ্বজগত',
                latinTranslitaration: 'Bisbajagata',
              ),
              Word(
                local: 'মণিভূষণ',
                latinTranslitaration: 'manibhusana',
              ),
              Word(
                local: 'বেষ্টিত',
                latinTranslitaration: 'bestita',
              ),
              Word(
                local: 'চরণে।\n',
                latinTranslitaration: 'carane.\n',
              ),
            ],
          ),
          PoemName(
            words: [
              Word(
                local: 'আনন্দলোকে',
                latinTranslitaration: 'Anandalökē',
              ),
              Word(
                local: 'মঙ্গলালোকে',
                latinTranslitaration: 'mangalälöke',
              ),
              Word(
                local: 'বিরাজ',
                latinTranslitaration: 'birãja',
              ),
              Word(
                local: 'সত্যসুন্দর।\n',
                latinTranslitaration: 'satyasundara.\n',
              )
            ],
          ),
        ],
      ),
      tags: ['top2k', 'Spiritual', 'Awsome'],
    ),
  );
}
