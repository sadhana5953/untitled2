import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/newsController.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      backgroundColor: Color(0xff1f1d2b),
      appBar: AppBar(
        backgroundColor: Color(0xff1f1d2b),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.download_for_offline_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save_outlined,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 13),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/76/e5/e8/76e5e818b7caf8880184ddd75c5f0cbb.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 25,
                              width: 140,
                              margin: EdgeInsets.only(left: 8),
                              child: Text(
                                '${controller.newsmodel.articles[selectedIndex].author}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              )),
                          Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.only(left: 3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '20.9M Followers       ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  Spacer(),
                  FilledButton(
                    onPressed: () {},
                    child: Text(
                      'Follow',
                      style: TextStyle(fontSize: 17),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFF7968F2),
                      foregroundColor:
                          Colors.white, // Set the text (foreground) color
                    ),
                  )
                ],
              ),
              Container(
                height: 250,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: NetworkImage(controller
                            .newsmodel.articles[selectedIndex].urlToImage!),
                        fit: BoxFit.cover)),
              ),
              Text(
                controller.newsmodel.articles[selectedIndex].title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                '8 min read - 19 jul 2023 - 2.4M Redars\n',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              Text(
                '${controller.newsmodel.articles[selectedIndex].content}\n',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 3,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.deepPurpleAccent),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: 380,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '• 50m package deal will be finalised next week with official documents, paperwork, conract to be signed.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 380,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '• Erik ten will have the goalkeeper he always wantd as priority - deal set to be sealed.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                '\n${controller.newsmodel.articles[selectedIndex].description}\n',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
