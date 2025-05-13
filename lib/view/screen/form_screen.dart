import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/view/screen/report_screen.dart';
import 'package:getx/view/widget/nested_form.dart';
import 'package:go_router/go_router.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Screen for personal details'),
          centerTitle: true,
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(text: 'Personal Details', icon: Icon(Icons.person)),
              Tab(text: 'Education Details', icon: Icon(Icons.school)),
              Tab(text: 'Experience', icon: Icon(Icons.work)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('Personal Details'),
            NestedTabBar('Education Details'),
            NestedTabBar('Experience'),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              context.go('/report');
            },
            icon: const Icon(Icons.check),
            label: const Text('Submit & generate-Report'),
          ),
        ),
      ),
    );
  }
}
