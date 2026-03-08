import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/entities/product_entity.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductEntity arg = Get.arguments;

    return Scaffold(appBar: AppBar(title: Text(arg.title), ));
  }
}
