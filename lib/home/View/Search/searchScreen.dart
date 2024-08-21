import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled2/home/View/HomeScreen/homePage.dart';

import '../../Controller/newsController.dart';
import '../DetailScreen/detailPage.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());

    void _onItemTapped(int index) {
      controller.countValue.value = index;
      print('$index====================================');
      if (index == 0) {
        Get.to(Homepage());
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff1f1d2b),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  Spacer()
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      hintText: '    Search',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          onPressed: () {
                            controller.changeValue(0);
                          },
                          child: Text('All'),
                          style: FilledButton.styleFrom(
                            backgroundColor: (controller.count == 0)
                                ? Color(0xFF7968F2)
                                : Color(0xFF353440),
                            // Set the background color
                            foregroundColor:
                                Colors.white, // Set the text (foreground) color
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              controller.changeValue(2);
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: (controller.count == 2)
                                  ? Color(0xFF7968F2)
                                  : Color(0xFF353440),
                              // Set the background color
                              foregroundColor: Colors
                                  .white, // Set the text (foreground) color
                            ),
                            child: Text('Sports')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              controller.changeValue(4);
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: (controller.count == 4)
                                  ? Color(0xFF7968F2)
                                  : Color(0xFF353440),
                              // Set the background color
                              foregroundColor: Colors
                                  .white, // Set the text (foreground) color
                            ),
                            child: Text('Politics')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              controller.changeValue(3);
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: (controller.count == 3)
                                  ? Color(0xFF7968F2)
                                  : Color(0xFF353440),
                              // Set the background color
                              foregroundColor: Colors
                                  .white, // Set the text (foreground) color
                            ),
                            child: Text('Education')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              controller.changeValue(1);
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: (controller.count == 1)
                                  ? Color(0xFF7968F2)
                                  : Color(0xFF353440),
                              // Set the background color
                              foregroundColor: Colors
                                  .white, // Set the text (foreground) color
                            ),
                            child: Text('Business')),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade800,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2)),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.trending_up,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Trending on Mabolin 🔥',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => FutureBuilder(
                    future: (controller.count.value == 0)
                        ? controller.fromAllData()
                        : (controller.count.value == 1)
                            ? controller.fromBusinessData()
                            : (controller.count.value == 2)
                                ? controller.fromSportsData()
                                : (controller.count.value == 3)
                                    ? controller.fromEduData()
                                    : controller.fromPoliticsData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(children: [
                          ...List.generate(
                            controller.newsmodel.articles.length,
                            (index) => GestureDetector(
                              onTap: () {
                                selectedIndex = index;
                                Get.to(Detailpage());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        (index < 9)
                                            ? '0${index + 1}\n\n'
                                            : '${index + 1}\n\n',
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 325,
                                          margin: EdgeInsets.only(
                                              left: 15, bottom: 8),
                                          child: Text(
                                            controller.newsmodel.articles[index]
                                                .title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                            height: 27,
                                            width: 27,
                                            margin: EdgeInsets.only(left: 3),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://i.pinimg.com/736x/76/e5/e8/76e5e818b7caf8880184ddd75c5f0cbb.jpg'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Container(
                                              height: 20,
                                              width: 110,
                                              margin: EdgeInsets.only(left: 8),
                                              child: Text(
                                                '${controller.newsmodel.articles[index].author}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
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
                                                  image: AssetImage(
                                                      'assets/images/logo.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        ' 4 min read - 19 jul 2023 - 2.4M Redars',
                                        style: TextStyle(
                                            color: Colors.grey.shade700),
                                      ),
                                      Container(
                                        height: 2,
                                        width: 340,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade600,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          // Enables the label animation
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: '',
              backgroundColor: Color(0xff252836),
              activeIcon: Container(
                height: 40,
                width: 130,
                margin: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff7968f2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Text(
                      'Discover',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ), // Background color for shifting effect
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 28,
              ),
              label: '',
              backgroundColor: Color(0xff252836),
              activeIcon: Container(
                height: 40,
                width: 130,
                margin: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff7968f2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                    Text(
                      'Explore',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ), // Background color for shifting effect
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: '',
              backgroundColor: Color(0xff252836),
              activeIcon: Container(
                height: 40,
                width: 130,
                margin: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff7968f2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ), // Background color for shifting effect
            ),
          ],
          currentIndex: controller.countValue.value,
          selectedItemColor: Colors.white,
          // Color for selected item
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
