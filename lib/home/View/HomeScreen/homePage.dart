import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled2/home/Controller/newsController.dart';
import 'package:untitled2/home/View/DetailScreen/detailPage.dart';
import 'package:untitled2/home/View/Search/searchScreen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    int _selectedIndex = 0;

    // List of widgets to display for each tab
    List<Widget> _widgetOptions = <Widget>[
      Text('Home'),
      Text('Search'),
      Text('Profile'),
    ];

    void _onItemTapped(int index) {
      controller.countValue.value = index;
      print('$index====================================');
      if (index == 1) {
        Get.to(Searchscreen());
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff1f1d2b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    child: ClipOval(
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/thumbnails/026/829/465/small_2x/beautiful-girl-with-autumn-leaves-photo.jpg',
                        // Replace with your image URL
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50,
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
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
                            foregroundColor:
                                Colors.white, // Set the text (foreground) color
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
                            foregroundColor:
                                Colors.white, // Set the text (foreground) color
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
                            foregroundColor:
                                Colors.white, // Set the text (foreground) color
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
                            foregroundColor:
                                Colors.white, // Set the text (foreground) color
                          ),
                          child: Text('Business')),
                    ),
                  ],
                ),
              ),
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
                        Container(
                          height: 250,
                          width: double.infinity,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://t4.ftcdn.net/jpg/03/37/92/49/360_F_337924964_fF6I0iZkv9lvoIEn71f0OsgawArIPPDu.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'Most Read',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                'See more',
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                        ...List.generate(
                          controller.newsmodel.articles.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                selectedIndex = index;
                                Get.to(Detailpage());
                                // Get.toNamed('/details');
                              },
                              child: Card(
                                color: Color(0xff1f1d2b),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 150,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: NetworkImage(controller
                                                .newsmodel
                                                .articles[index]
                                                .urlToImage!),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 245,
                                          margin: EdgeInsets.only(
                                              left: 5, right: 3),
                                          child: Text(
                                            "${controller.newsmodel.articles[index].title} Google’s Gemini Live AI Sounds So Human, I Almost Forgot It Was a Bot.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                        Container(
                                          height: 48,
                                          width: 245,
                                          margin: EdgeInsets.only(
                                              left: 5, right: 3),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                margin:
                                                    EdgeInsets.only(left: 3),
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
                                                  margin:
                                                      EdgeInsets.only(left: 8),
                                                  child: Text(
                                                    '${controller.newsmodel.articles[index].author}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                  )),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                margin:
                                                    EdgeInsets.only(left: 3),
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
                                        ),
                                        Container(
                                          height: 20,
                                          width: 245,
                                          child: Text(
                                            '19 jul 2023 - 2.4M Redars',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
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
