import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Colors.purple,
            ])),
          ),
          toolbarHeight: MediaQuery.of(context).size.height / 8.12,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.search,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      size: 40,
                    )),
              ],
            )
          ],
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 40,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
        ),
        drawer: const Drawer(),
        body: Obx(() => ListView.builder(
              itemCount: controller.data.length,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 40.6),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15,
                      vertical: MediaQuery.of(context).size.height / 81.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.data[index].designation.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 81.2,
                      ),
                      Text(
                        controller.data[index].author.toString(),
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade500),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 81.2,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                const Icon(Icons.shopping_basket_outlined),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 75,
                                ),
                                Text(
                                  controller.data[index].exp.toString(),
                                  // data['exp'],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 18.75,
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on),
                                Text(
                                  controller.data[index].jobLocation.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 81.2,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.info_outline),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 75,
                          ),
                          Text(
                            controller.data[index].technology.toString(),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
