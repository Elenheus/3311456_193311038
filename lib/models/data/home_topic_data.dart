import 'package:untitled/models/class/home_topic_class.dart';
import 'package:line_icons/line_icons.dart';

final List<HomeTopic> homeTopics = [
  HomeTopic(
    title: "Kisa Makale Olustur",
    subtitle: "Herhangi bir konuda kisa makale olustur",
    icon: LineIcons.bookmarkAlt,
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen konular hakkinda kisa makaleler yazmaya yardim etmekle kisitlisin.',
    databaseTitle: 'create_essays',
  ),
  HomeTopic(
    title: "Paragraf Alintila",
    subtitle: "Belirli bir paragrafi alintila",
    icon: LineIcons.paragraph,
    databaseTitle: 'paraphrase_passage',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen paragraflari alintilamaya yardim etmekle kisitlisin.',
  ),
  HomeTopic(
    title: "Metin Duzenle",
    subtitle: "AI kullanarak metin duzenle",
    icon: LineIcons.editAlt,
    databaseTitle: 'correct_text',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen metinleri duzenlemeye yardim etmekle kisitlisin.',
  ),
  HomeTopic(
    title: "Ozet Olustur",
    subtitle: "AI kullanarak uzun bir metni ozetle",
    icon: LineIcons.fileAlt,
    databaseTitle: 'generate_summary',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen uzun metinlerin ozetini olusturmaya yardim etmekle kisitlisin.',
  ),
  HomeTopic(
    title: "Soru Cevapla",
    subtitle: "Sorulariniza cevap alin",
    icon: LineIcons.question,
    databaseTitle: 'answer_questions',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan sorulan sorulara cevap vermeye yardim etmekle kisitlisin .',
  ),
  HomeTopic(
    icon: LineIcons.feather,
    title: 'Rastgele Siir Olustur',
    subtitle: 'Herhangi bir konuda özgün bir siir olustur',
    databaseTitle: 'generate_poem',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen konularda siir olusturmaya yardim etmekle kisitlisin.',
  ),
  HomeTopic(
    icon: LineIcons.undo,
    title: 'Edilgen Yapida Cumle Olustur',
    subtitle: 'Etken yapili cumleyi edilgen yapili cumleye cevir',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen cumleleri etken yapidan edilgen yapiya yeniden yazmaya yardim etmekle kisitlisin.',
    databaseTitle: 'rewrite_sentence_in_passive',
  ),
  HomeTopic(
    icon: LineIcons.newspaper,
    title: 'Haber Yazisi Ozetle',
    subtitle: 'Bir gazete yazisinin ozetini al',
    databaseTitle: 'summarize_news_article',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen gazete yazilarini ozetlemeye yardim etmekle kisitlisin.',
  ),
  HomeTopic(
    icon: LineIcons.language,
    title: 'Es anlamlilar listesi olustur',
    subtitle: 'Herhangi bir kelimenin es anlamlilar listesini olustur',
    databaseTitle: 'generate_list_of_synonyms',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen herhangi bir kelimenin es anlamlilari listesini cikarmaya yardim etmekle kisitlisin.',
  ),
  HomeTopic(
    icon: LineIcons.bullseye,
    title: 'Kelime Oyunu Olustur',
    subtitle: 'Herhangi bir konuda kelime oyunu olustur',
    databaseTitle: 'generate_puns',
    content:
        'Senin ismin Salih ve sen yardimsever bir asistansin . Yalnizca kullanici tarafindan verilen kelime oyunlarini olusturmaya yardim etmekle kisitlisin.',
  ),
];
