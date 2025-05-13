import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/education_controller.dart';
import 'package:getx/controller/experience_controller.dart';
import 'package:getx/controller/personal_controller.dart';
import 'package:go_router/go_router.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final personal = Get.find<PersonalController>().personalDetails.value;
    final education = Get.find<EducationController>().educationDetails.value;
    final experience = Get.find<ExperienceController>().experienceDetails.value;

    return Scaffold(
      appBar: AppBar(title: const Text('Report Summary')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🧍 Personal Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Name: ${personal.name ?? "-"}'),
            Text('Email: ${personal.email ?? "-"}'),
            Text('Phone: ${personal.phone ?? "-"}'),
            Text('Address: ${personal.address ?? "-"}'),
            ...(personal.extraData?.entries.map((entry) {
                  return Text('${entry.key}: ${entry.value}');
                }).toList() ??
                []),
            const Divider(),
            const Text('🎓 Education Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('School: ${education.university ?? "-"}'),
            Text('Degree: ${education.degree ?? "-"}'),
            Text('Field of Study: ${education.degree ?? "-"}'),
            Text('Graduation Year: ${education.yearOfPassing ?? "-"}'),
            ...(education.extraData?.entries.map((entry) {
                  return Text('${entry.key}: ${entry.value}');
                }).toList() ??
                []),
            const Divider(),
            const Text('💼 Experience Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Company: ${experience.company_name ?? "-"}'),
            Text('Position: ${experience.position ?? "-"}'),
            Text('Duration: ${experience.duration ?? "-"}'),
            Text('Responsibilities: ${experience.description ?? "-"}'),
            ...(experience.extraData?.entries.map((entry) {
                  return Text('${entry.key}: ${entry.value}');
                }).toList() ??
                []),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.find<PersonalController>().clearPersonalDetails();
                  Get.find<EducationController>().clearEducationDetails();
                  Get.find<ExperienceController>().clearExperienceDetails();
                  context.go('/'); // Navigate back to the form screen
                },
                icon: const Icon(Icons.check_circle),
                label: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
