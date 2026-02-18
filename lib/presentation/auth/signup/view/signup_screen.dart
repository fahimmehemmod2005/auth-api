import 'dart:io';
import 'package:auth/core/routes/route_manager.dart';
import 'package:auth/presentation/widgets/primary_button.dart';
import 'package:auth/presentation/widgets/show_white_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  File? _media;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _media = File(image.path);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Image pick error: $e");
      }
    }
  }

  void _showImagePickerOption() {
    showWhiteDialog(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.photo_outlined),
            title: Text(
              "Gallery",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt_outlined),
            title: Text(
              "Camera",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.image_not_supported_outlined),
            title: Text(
              "Remove",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _media = null;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _showImagePickerOption,
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                      image: _media != null
                          ? DecorationImage(
                              image: FileImage(_media!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _media == null
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.black54,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Set a profile image'),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(label: 'Signup', onPressed: () {
                Navigator.pushNamed(context, Routes.signupOtp);
              }),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
