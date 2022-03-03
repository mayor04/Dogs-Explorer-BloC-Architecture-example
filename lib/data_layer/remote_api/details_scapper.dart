import 'package:dog_app/core/utils/logg.dart';
import 'package:web_scraper/web_scraper.dart';

class DetailsScraper {
  Map detailsCache = {};
  var log = AppLog('Details Scrapper');

  Future<List<String>> getDetails(String breedName) async {
    var webScrapper = WebScraper('https://dogtime.com/');
    if (detailsCache[breedName] != null) {
      return detailsCache[breedName];
    }

    try {
      await webScrapper.loadWebPage('dog-breeds/$breedName#/slide/1');
      var elem = webScrapper.getElement('.breeds-single-intro > p', []);

      List<String> description = [];

      for (var paragraph in elem) {
        description.add(paragraph['title']);
      }

      log.debug('Successfully gotten details', description);
      detailsCache[breedName] = description;

      return description;
    } catch (e) {
      // TODO
      log.error('Error occured', e.toString());
      return [];
    }
  }
}
