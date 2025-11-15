import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp/core/constance.dart';
import 'package:taskapp/core/space.dart';
import 'package:taskapp/presentation/category/category_controller.dart';
import 'package:taskapp/presentation/widget/box_widget.dart';
import 'package:taskapp/presentation/widget/button_widget.dart';
import '../widget/text_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _categoryController = TextEditingController();
  final _controller = Get.put(CategoryController());

  final DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Column(
        children: [
          SizedBox(height: space),
          BoxWidget(),
          BoxWidget(),
          BoxWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlueColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: kWhiteColor,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: kBlueColor, width: 2),
                  borderRadius: BorderRadius.circular(radius),
                ),
                title: TextWidget.textWidget(
                  text: "Add New Category name ",
                  fontSize: 21,
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
                content: TextField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: kGreyColor),
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    hintText: "enter category name",
                    hintStyle: GoogleFonts.poppins(color: kGreyColor),
                  ),
                ),
                actions: [
                  ButtonWidget(
                    onPressed: () {
                      _controller.addCategory(_categoryController.text, _dateTime.toString());
                      print("======================${_categoryController.text}");
                      print("===============${_dateTime}");
                    },
                    bdRadius: radius,
                    width: double.infinity,
                    text: "Add",
                  ),
                ],
              );
            },
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add, color: kWhiteColor, size: 35),
      ),
    );
  }
}
