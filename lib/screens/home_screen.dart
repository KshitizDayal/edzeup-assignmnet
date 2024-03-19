import 'package:edzeup_assignment/screens/configuration_screen.dart';
import 'package:flutter/material.dart';

import '../utils/color_constants.dart';
import '../utils/constants.dart';
import '../utils/teststyle_constants.dart';
import '../widgets/drawer_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(color: whiteColor),
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Text(
                                      "EDZEUP",
                                      style: textStyleheading.copyWith(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: sideDrawerList.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index == 5) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 12),
                                          child: Text(
                                            "Reports",
                                            style: textStyle.copyWith(
                                                color: primaryColor),
                                          ),
                                        );
                                      } else if (index > 5) {
                                        final adjustedIndex = index - 1;
                                        return DrawerListTile(
                                          iconData:
                                              sideDrawerList[adjustedIndex]
                                                  .iconData!,
                                          text: sideDrawerList[adjustedIndex]
                                              .text!,
                                          index: index,
                                          isSelected:
                                              sideDrawerList[adjustedIndex]
                                                  .isSelected!,
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = adjustedIndex;

                                              for (int i = 0;
                                                  i < sideDrawerList.length;
                                                  i++) {
                                                sideDrawerList[i].isSelected =
                                                    (i == adjustedIndex);
                                              }
                                            });
                                          },
                                        );
                                      } else {
                                        return DrawerListTile(
                                          iconData:
                                              sideDrawerList[index].iconData!,
                                          text: sideDrawerList[index].text!,
                                          index: index,
                                          isSelected:
                                              sideDrawerList[index].isSelected!,
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = index;

                                              for (int i = 0;
                                                  i < sideDrawerList.length;
                                                  i++) {
                                                sideDrawerList[i].isSelected =
                                                    (i == index);
                                              }
                                            });
                                          },
                                        );
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.account_circle,
                                    size: 40,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Rahul Kumar",
                                          style:
                                              textStyle.copyWith(fontSize: 14),
                                        ),
                                        Text(
                                          "rahul@gmail.com",
                                          style:
                                              textStyle.copyWith(fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.logout,
                                      color: blackColor,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Logout",
                                      style: textStyle.copyWith(
                                        color: blackColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.grey.shade200,
              child: Center(
                  child: selectedIndex == 1
                      ? const ConfigurationScreen()
                      : Text("${sideDrawerList[selectedIndex].text} Screen")),
            ),
          ),
        ],
      )),
    );
  }
}
