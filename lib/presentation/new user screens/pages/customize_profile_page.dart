import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/button1.dart';

class CustomizeProfilePage extends StatefulWidget {
  const CustomizeProfilePage({super.key});

  @override
  State<CustomizeProfilePage> createState() => _CustomizeProfilePageState();
}

class _CustomizeProfilePageState extends State<CustomizeProfilePage> {
  File? _selectedImage;
  void _handleNextPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Customize your Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _showPopup(context);
                },
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white30,
                  backgroundImage: _selectedImage == null
                      ? null
                      : FileImage(_selectedImage!),
                  child: _selectedImage == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 50,
                        )
                      : null,
                ),
              ),
              const Spacer(),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Username*",
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              const Spacer(),
              Button1(label: "Next", onPressed: _handleNextPage),
              const Spacer(
                flex: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  void _showPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () {
                  _getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
                child: const Row(
                  children: [
                    Text("Upload from Camera"),
                    Spacer(),
                    Icon(Icons.camera_alt),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
                child: const Row(
                  children: [
                    Text("Upload from Gallery"),
                    Spacer(),
                    Icon(Icons.photo),
                  ],
                ),
              )
            ],
          );
        });
  }
}
