import 'dart:io';
import 'package:auth/presentation/widgets/primary_button.dart';
import 'package:auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/image_picker.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _device = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _device.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = ref.watch(fileImagePickerProvider);
    final String? imagePath = imageProvider.singleImage?.path;
    final profileFile = ref.read(fileImagePickerProvider).singleImage;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () => _showPickerOptions(context),
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                      image: imagePath != null
                          ? DecorationImage(
                              image: FileImage(File(imagePath)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: imagePath == null
                        ? const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.black54,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Set a profile image'),
              const SizedBox(height: 20),
              TextInputField(
                mainLabel: 'Name',
                hintText: 'Enter your name',
                controller: _name,
              ),
              const SizedBox(height: 10),
              TextInputField(
                mainLabel: 'Email',
                hintText: 'Enter your email',
                controller: _email,
              ),
              const SizedBox(height: 10),
              TextInputField(
                mainLabel: 'Device',
                hintText: 'Enter your device',
                controller: _device,
              ),
              const SizedBox(height: 10),
              TextInputField(
                mainLabel: 'Password',
                hintText: 'Enter your password',
                controller: _password,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const SizedBox(height: 20),
              PrimaryButton(label: 'Signup', onPressed: () {}),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  void _showPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.white),
              title: const Text(
                'Gallery',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                ref
                    .read(fileImagePickerProvider.notifier)
                    .pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: const Text(
                'Camera',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                ref
                    .read(fileImagePickerProvider.notifier)
                    .pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
