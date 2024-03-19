import 'package:edzeup_assignment/utils/user_json.dart';
import 'package:edzeup_assignment/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../utils/color_constants.dart';
import '../../utils/constants.dart';
import '../../utils/teststyle_constants.dart';
import '../../widgets/drop_down_tile.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController controller = TextEditingController();
  bool showClear = false;

  String? selectedValues;
  int selectedRowsNumber = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: const BoxDecoration(color: whiteColor),
                padding:
                    const EdgeInsets.only(left: 6, top: 6, right: 6, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: greyBgColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            width: 200,
                            child: Row(
                              children: [
                                showClear
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {
                                            controller.clear();
                                            showClear = false;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.close_rounded,
                                          color: blackColor,
                                        ),
                                      )
                                    : const Icon(
                                        Icons.search,
                                        color: blackColor,
                                      ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: TextField(
                                    controller: controller,
                                    onChanged: (val) {
                                      setState(() {
                                        showClear = true;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      border: InputBorder.none,
                                      hintText: "Search Products",
                                    ),
                                    cursorColor: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropDownTile(
                            bgcolor: greyBgColor,
                            width: 200,
                            value: selectedValues,
                            onChanged: (val) {
                              setState(() {
                                selectedValues = val;
                              });
                            },
                            items: dropDownValues.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                            maxHeight: 300,
                            hintText: "All Details",
                          ),
                        ],
                      ),
                    ),
                    const PrimaryButton(
                      bgcolor: greyBgColor,
                      textColor: blackColor,
                      buttonText: "Submit",
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                    .copyWith(bottom: 2),
                decoration: const BoxDecoration(color: whiteColor),
                child: Container(
                  decoration: BoxDecoration(color: blackColor.withOpacity(0.5)),
                  child: DataTable(
                    columns: [
                      dataTableRow(value: "Name"),
                      dataTableRow(value: "Email"),
                      dataTableRow(value: "Phone Number"),
                      dataTableRow(value: "Access"),
                      dataTableRow(value: "Actions"),
                    ],
                    rows: List<DataRow>.generate(
                      selectedRowsNumber,
                      (index) => DataRow(
                        color: MaterialStateProperty.all<Color>(whiteColor),
                        cells: [
                          DataCell(
                            Text(users[index].name ?? ""),
                          ),
                          DataCell(
                            Text(users[index].email ?? ""),
                          ),
                          DataCell(Text(users[index].phoneNumber ?? "")),
                          DataCell(
                            Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text("${users[index].role ?? ""} role | "),
                                Text(
                                    "${users[index].location ?? ""} location | "),
                                Text(
                                    "${users[index].assessment ?? ""} assessment"),
                              ],
                            ),
                          ),
                          const DataCell(
                            Text("---"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                    .copyWith(top: 2),
                decoration: const BoxDecoration(color: whiteColor),
                padding:
                    const EdgeInsets.only(left: 6, top: 6, right: 6, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          DropDownTileInt(
                            bgcolor: greyBgColor,
                            width: 200,
                            value: selectedRowsNumber,
                            onChanged: (val) {
                              setState(() {
                                selectedRowsNumber = val!;
                              });
                            },
                            items: rowsDropDown.map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                  "$value rows",
                                ),
                              );
                            }).toList(),
                            maxHeight: 300,
                            hintText: "10 rows",
                          ),
                          Text(
                            "Per Pages | Showing $selectedRowsNumber out of ${users.length}",
                            style: textStyle,
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: greyBgColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.first_page),
                            onPressed:
                                currentPage > 1 ? () => _gotoPage(1) : null,
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: currentPage > 1
                                ? () => _gotoPage(currentPage - 1)
                                : null,
                          ),
                          ..._buildPageNumbers(),
                          IconButton(
                            icon: const Icon(Icons.chevron_right),
                            onPressed: currentPage < totalPages
                                ? () => _gotoPage(currentPage + 1)
                                : null,
                          ),
                          IconButton(
                            icon: const Icon(Icons.last_page),
                            onPressed: currentPage < totalPages
                                ? () => _gotoPage(totalPages)
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataColumn dataTableRow({required String value}) {
    return DataColumn(
      label: Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          value,
          style: textStyleWhite,
        ),
      ),
    );
  }

  void _gotoPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  int currentPage = 1;
  final int totalPages = 10;
  final int windowSize = 5;

  List<Widget> _buildPageNumbers() {
    List<Widget> widgets = [];
    if (totalPages <= windowSize) {
      for (int i = 1; i <= totalPages; i++) {
        widgets.add(_buildPageNumber(i));
      }
    } else {
      // Always add the first page
      widgets.add(_buildPageNumber(1));
      int start = currentPage > 2 ? currentPage - 1 : 2;
      int end = currentPage < totalPages - 1 ? currentPage + 1 : totalPages - 1;

      if (currentPage > 3) {
        widgets.add(const Text('...'));
      }

      for (int i = start; i <= end; i++) {
        if (i != 1 && i != totalPages) {
          widgets.add(_buildPageNumber(i));
        }
      }

      if (currentPage < totalPages - 2) {
        widgets.add(const Text('...'));
      }

      widgets.add(_buildPageNumber(totalPages));
    }
    return widgets;
  }

  Widget _buildPageNumber(int page) {
    return GestureDetector(
      onTap: () => _gotoPage(page),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: currentPage == page
              ? blackColor.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: blackColor.withOpacity(0.5)),
        ),
        child: Text(
          '$page',
          style: TextStyle(
            color: currentPage == page
                ? Colors.white
                : blackColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
