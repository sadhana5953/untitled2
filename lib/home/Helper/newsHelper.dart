import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NewsHelper {
  Future<Map<String, dynamic>?> fetchAllNewsData() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f');
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map<String, dynamic> data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>?> fetchBusinessNewsData() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f');
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map<String, dynamic> data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>?> fetchSportsNewsData() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f');
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map<String, dynamic> data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>?> fetchEduNewsData() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-07-20&sortBy=publishedAt&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f');
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map<String, dynamic> data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>?> fetchPoliticsNewsData() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2024-08-19&to=2024-08-19&sortBy=popularity&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f');
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map<String, dynamic> data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}

//https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f
//https://newsapi.org/v2/everything?domains=wsj.com&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f
//https://newsapi.org/v2/everything?q=tesla&from=2024-07-20&sortBy=publishedAt&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f
//https://newsapi.org/v2/everything?q=apple&from=2024-08-19&to=2024-08-19&sortBy=popularity&apiKey=41968c31a45b4fd9b0f0b57ec38fde5f
