import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pilih_tiket_controller.dart';

class PilihTiketView extends GetView<PilihTiketController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg.png"),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Select Your\nSeat",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333E63),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Commuter Line (A)",
                        ),
                        Text(
                          "Wagon 1 -3A",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF656CEE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemStatus(
                      status: "Available",
                      color: Colors.white,
                    ),
                    ItemStatus(
                      status: "Filled",
                      color: Color(0xFFFF8B2D),
                    ),
                    ItemStatus(
                      status: "Selected",
                      color: Color(0xFF656CEE),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wagon",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 35),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "A",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "B",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "C",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "D",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "E",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Obx(
                                    () => Column(
                                      children: List.generate(
                                        controller.gerbong.length,
                                        (index) => GestureDetector(
                                          onTap: () =>
                                              controller.gantiGerbong(index),
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            height: 150,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black38,
                                              ),
                                              color: controller
                                                          .indexGerbong.value ==
                                                      index
                                                  ? Color(0xFF656CEE)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text("${index + 1}"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  child: Obx(
                                    () => GridView.builder(
                                      padding: EdgeInsets.all(10),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        crossAxisCount: 5,
                                      ),
                                      itemCount: controller
                                          .gerbong[
                                              controller.indexGerbong.value]
                                          .length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () =>
                                            controller.selectKursi(index),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black38,
                                            ),
                                            color: controller.gerbong[controller
                                                            .indexGerbong.value]
                                                        [index]["status"] ==
                                                    "available"
                                                ? Colors.white
                                                : controller.gerbong[controller
                                                                .indexGerbong
                                                                .value][index]
                                                            ["status"] ==
                                                        "filled"
                                                    ? Color(0xFFFF8B2D)
                                                    : Color(0xFF656CEE),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("SELECT YOUR SEAT"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF656CEE),
                      fixedSize: Size(Get.width * 0.8, 50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemStatus extends StatelessWidget {
  ItemStatus({
    Key? key,
    required this.status,
    required this.color,
  }) : super(key: key);

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 7),
        Text(
          status,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
