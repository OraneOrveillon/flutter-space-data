import 'package:translator/translator.dart';

class Translator {
  final _translator = GoogleTranslator();

  Future<String> translate(String frenchString) async {
    Translation translation = await _translator.translate(frenchString, from: 'fr', to: 'en');
    return translation.text;
  }
}
