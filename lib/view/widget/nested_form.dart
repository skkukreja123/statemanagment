import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx/controller/education_controller.dart';
import 'package:getx/controller/experience_controller.dart';
import 'package:getx/controller/personal_controller.dart';
import 'package:getx/helper/form_validator.dart';

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.tabkey, {super.key});

  final String tabkey;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _keyController1 = TextEditingController();
  final TextEditingController _valueController1 = TextEditingController();
  final TextEditingController _keyController2 = TextEditingController();
  final TextEditingController _valueController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildForm(String tabkey, String nestedTab) {
    switch (tabkey) {
      case 'Personal Details':
        final personalControl = Get.find<PersonalController>();
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: TextEditingController(
                    text: personalControl.personalDetails.value.name),
                decoration: const InputDecoration(
                    labelText: 'Name', hintText: 'Enter your name'),
                onChanged: (value) {
                  personalControl.personalDetails.value.name = value;
                },
                validator: FormValidators.nameValidator,
              ),
              TextFormField(
                controller: TextEditingController(
                    text: personalControl.personalDetails.value.email),
                decoration: const InputDecoration(
                    labelText: 'Email', hintText: 'Enter your email'),
                onChanged: (value) {
                  personalControl.personalDetails.value.email = value;
                },
                validator: FormValidators.emailValidator,
              ),
              TextFormField(
                controller: TextEditingController(
                    text: personalControl.personalDetails.value.phone),
                decoration: const InputDecoration(labelText: 'Phone'),
                onChanged: (value) {
                  personalControl.personalDetails.value.phone = value;
                },
                validator: FormValidators.phoneValidator,
              ),
              ...personalControl.personalDetails.value.extraData?.entries
                      .map((entry) {
                    return TextFormField(
                      controller:
                          TextEditingController(text: entry.value.toString()),
                      decoration: InputDecoration(
                        labelText: entry.key,
                        hintText: 'Enter ${entry.key}',
                      ),
                      onChanged: (value) {
                        personalControl.addExtraData(entry.key, value);
                      },
                      // validator: FormValidators.requiredField,
                    );
                  }).toList() ??
                  [],
            ],
          ),
        );
      case 'Education Details':
        final controller = Get.find<EducationController>();
        return Obx(() => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: TextEditingController(
                        text: controller.educationDetails.value.degree),
                    decoration: const InputDecoration(
                        labelText: 'Degree', hintText: 'Enter your degree'),
                    onChanged: (value) {
                      controller.educationDetails.value.degree = value;
                    },
                    // validator: FormValidators.requiredField,
                  ),
                  TextFormField(
                    controller: TextEditingController(
                        text: controller.educationDetails.value.university),
                    decoration: const InputDecoration(labelText: 'University'),
                    onChanged: (value) {
                      controller.educationDetails.value.university = value;
                    },
                    // validator: FormValidators.requiredField,
                  ),
                  TextFormField(
                    controller: TextEditingController(
                        text: controller.educationDetails.value.yearOfPassing),
                    decoration:
                        const InputDecoration(labelText: 'Year of Passing'),
                    onChanged: (value) {
                      controller.educationDetails.value.yearOfPassing = value;
                    },
                    validator: FormValidators.numberValidator,
                  ),
                  ...controller.educationDetails.value.extraData?.entries
                          .map((entry) {
                        return TextFormField(
                          controller: TextEditingController(
                              text: entry.value.toString()),
                          decoration: InputDecoration(
                            labelText: entry.key,
                            hintText: 'Enter ${entry.key}',
                          ),
                          onChanged: (value) {
                            controller.addExtraData(entry.key, value);
                          },
                          // validator: FormValidators.requiredField,
                        );
                      }).toList() ??
                      [],
                ],
              ),
            ));
      case 'Experience':
        final controller = Get.find<ExperienceController>();
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: TextEditingController(
                    text: controller.experienceDetails.value.company_name),
                decoration: const InputDecoration(labelText: 'Company'),
                onChanged: (value) {
                  controller.experienceDetails.value.company_name = value;
                },
              ),
              TextField(
                controller: TextEditingController(
                    text: controller.experienceDetails.value.position),
                decoration: const InputDecoration(labelText: 'Position'),
                onChanged: (value) {
                  controller.experienceDetails.value.position = value;
                },
              ),
              TextField(
                controller: TextEditingController(
                    text: controller.experienceDetails.value.description),
                decoration:
                    const InputDecoration(labelText: 'Years of Experience'),
                onChanged: (value) {
                  controller.experienceDetails.value.description = value;
                },
              ),
              ...controller.experienceDetails.value.extraData?.entries
                      .map((entry) {
                    return TextFormField(
                      // controller:
                      //     TextEditingController(text: entry.value.toString()),
                      // initialValue: entry.value.toString(),
                      decoration: InputDecoration(
                        labelText: entry.key,
                        hintText: 'Enter ${entry.key}',
                      ),
                      onChanged: (value) {
                        controller.addExtraData(entry.key, value);
                      },
                    );
                  }).toList() ??
                  [],
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildPreview(String tabkey) {
    switch (tabkey) {
      case 'Personal Details':
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
              child: Obx(() {
                final extra = Get.find<PersonalController>()
                        .personalDetails
                        .value
                        .extraData ??
                    {};

                return ListView(
                  children: extra.entries.map((entry) {
                    return ListTile(
                      title: Text(entry.key),
                      subtitle: Text(entry.value.toString()),
                    );
                  }).toList(),
                );
              }),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _keyController1,
                  decoration: const InputDecoration(labelText: 'field name'),
                )),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                  controller: _valueController1,
                  decoration: const InputDecoration(labelText: 'field value'),
                )),
                const SizedBox(width: 8),
                IconButton(
                    onPressed: () {
                      final key = _keyController1.text.trim();
                      final value = _valueController1.text.trim();
                      if (key.isNotEmpty && value.isNotEmpty) {
                        Get.find<PersonalController>().addExtraData(key, value);
                        _keyController1.clear();
                        _valueController1.clear();
                      }
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ]),
        );
      case 'Education Details':
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
              child: Obx(() {
                final extra = Get.find<EducationController>()
                        .educationDetails
                        .value
                        .extraData ??
                    {};

                return ListView(
                  children: extra.entries.map((entry) {
                    return ListTile(
                      title: Text(entry.key),
                      subtitle: Text(entry.value.toString()),
                    );
                  }).toList(),
                );
              }),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _keyController,
                  decoration: const InputDecoration(labelText: 'field name'),
                )),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                  controller: _valueController,
                  decoration: const InputDecoration(labelText: 'field value'),
                )),
                const SizedBox(width: 8),
                IconButton(
                    onPressed: () {
                      final key = _keyController.text.trim();
                      final value = _valueController.text.trim();
                      if (key.isNotEmpty && value.isNotEmpty) {
                        Get.find<EducationController>()
                            .addExtraData(key, value);
                        _keyController.clear();
                        _valueController.clear();
                      }
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ]),
        );
      case 'Experience':
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
              child: Obx(() {
                final extra = Get.find<ExperienceController>()
                        .experienceDetails
                        .value
                        .extraData ??
                    {};

                return ListView(
                  children: extra.entries.map((entry) {
                    return ListTile(
                      title: Text(entry.key),
                      subtitle: Text(entry.value.toString()),
                    );
                  }).toList(),
                );
              }),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _keyController2,
                  decoration: const InputDecoration(labelText: 'field name'),
                )),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                  controller: _valueController2,
                  decoration: const InputDecoration(labelText: 'field value'),
                )),
                const SizedBox(width: 8),
                IconButton(
                    onPressed: () {
                      final key = _keyController2.text.trim();
                      final value = _valueController2.text.trim();
                      if (key.isNotEmpty && value.isNotEmpty) {
                        Get.find<ExperienceController>()
                            .addExtraData(key, value);
                        _keyController2.clear();
                        _valueController2.clear();
                      }
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ]),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tabkey),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Form'),
            Tab(text: 'Preview'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildForm(widget.tabkey, 'Form'),
          _buildPreview(widget.tabkey),
        ],
      ),
    );
  }
}
