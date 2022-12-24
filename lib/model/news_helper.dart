
import 'news_article.dart';

class NewsHelper {

  static var articleCount = 4;
  static var Count = 2;

  static var categoryTitles = ["At times you will have to make your Flutter app",
    "This article was updated for Flutter 3.3 on November 11,",
    "A thousand pictures is worth a word Consider this a visual supplement the InputDecoration documentation.",
    "Firebase Authentication enables us to add various sign-in methods "];

  static var titles = ["How to show download progress in a Flutter app",
    "A visual guide to Input Decorations for Flutter TextField",
    "Flutter: Internationalization & Switching Locales Manually", "Google Sign-in for Flutter App on Android & Web"];

  static var authorNames = ["Ethan Siegal", "Adnan Rahic", "Avi Ashkenazi", "Abhishek Parkbhakar"];

  static var date = ["15 Jun 2022", "15 hours 2022", "27 Apr 2022", "14 Jun 2021"];

  static var readTimes = ["7 min read", "14 min read", "8 min read", "8 min read"];

  static var imageAssetName = ["mars.jpeg","cars.jpeg","gmail.jpeg","umbrella.jpeg"];

  static var profileAssetName = ["messi.png", "boy.png", "image.png", "visitor.png"];

  static getArticle(int position) {
    return NewsArticle(categoryTitles[position], titles[position], authorNames[position],date[position],readTimes[position], imageAssetName[position], profileAssetName[position]);
  }

}