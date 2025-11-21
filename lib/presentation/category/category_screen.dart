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
  void initState() {
    _controller.getAllCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: GetBuilder<CategoryController>(
        init: _controller,
        initState: (state) => _controller.getAllCategory(),
        builder: (controller) {
          return ListView.builder(
            itemCount: _controller.categories.length,
            itemBuilder: (context, index) {
              final record = _controller.categories[index];
              return BoxWidget(
                text: record.title,
                dateTime: record.dateTime,
                onEdit: () {
                  print("Edit action triggered for ID: ${record.id}");
                },
                onDelete: () {
                  print("Delete action triggered for ID: ${record.id}");
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlueColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return _openAppCategory();
            },
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add, color: kWhiteColor, size: 35),
      ),
    );
  }

  AlertDialog _openAppCategory() {
    return AlertDialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kBlueColor, width: 2),
        borderRadius: BorderRadius.circular(radius),
      ),
      title: TextWidget.textWidget(
        text: "Add Category",
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
            final categoryName = _categoryController.text
                .trim(); // Use .trim() to remove whitespace

            if (categoryName.isEmpty) {
              // error message
              Get.snackbar(
                "Invalid Input",
                "Category name cannot be empty.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
              return;
            }
            // if the categoryName is NOT empty.
            _controller.addCategory(categoryName, _dateTime.toString());
            _categoryController.clear();
            Navigator.of(context).pop();

            print("====================== Category Added: $categoryName");
            print("===============$_dateTime");
          },
          bdRadius: radius,
          width: double.infinity,
          text: "Add",
        ),
      ],
    );
  }
}
