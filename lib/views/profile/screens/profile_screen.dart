import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
