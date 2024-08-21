import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled2/home/Helper/newsHelper.dart';
import 'package:untitled2/home/Model/newsModel.dart';

class NewsController extends GetxController
{
  RxInt count=0.obs;
  RxInt countValue=0.obs;
  NewsHelper apiHelper=NewsHelper();
  late NewsModel newsmodel;

  void changeValue(int value)
  {
    count.value=value;
  }
  Future<NewsModel> fromAllData()
  async {
    final Map<String, dynamic>? data=await apiHelper.fetchAllNewsData();
    newsmodel=NewsModel.fromJson(data!);
    return newsmodel;
  }

  Future<NewsModel> fromBusinessData()
  async {
    final Map<String, dynamic>? data=await apiHelper.fetchBusinessNewsData();
    newsmodel=NewsModel.fromJson(data!);
    return newsmodel;
  }

  Future<NewsModel> fromSportsData()
  async {
    final Map<String, dynamic>? data=await apiHelper.fetchSportsNewsData();
    newsmodel=NewsModel.fromJson(data!);
    return newsmodel;
  }

  Future<NewsModel> fromEduData()
  async {
    final Map<String, dynamic>? data=await apiHelper.fetchEduNewsData();
    newsmodel=NewsModel.fromJson(data!);
    return newsmodel;
  }

  Future<NewsModel> fromPoliticsData()
  async {
    final Map<String, dynamic>? data=await apiHelper.fetchPoliticsNewsData();
    newsmodel=NewsModel.fromJson(data!);
    return newsmodel;
  }

}

int selectedIndex=0;
