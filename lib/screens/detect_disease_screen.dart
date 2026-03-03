import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../l10n/app_strings.dart';

class DetectDiseaseScreen extends StatefulWidget {
  const DetectDiseaseScreen({super.key});

  @override
  State<DetectDiseaseScreen> createState() =>
      _DetectDiseaseScreenState();
}

class _DetectDiseaseScreenState
    extends State<DetectDiseaseScreen> {

  File? selectedImage;
  final picker = ImagePicker();

  String result = "";
  bool isLoading = false;

  // CAMERA
  Future pickCamera() async {
    final picked =
        await picker.pickImage(source: ImageSource.camera);

    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
        result = "";
      });
    }
  }

  // GALLERY
  Future pickGallery() async {
    final picked =
        await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
        result = "";
      });
    }
  }

  // REMOVE IMAGE
  void removeImage() {
    setState(() {
      selectedImage = null;
      result = "";
    });
  }

  // 🔥 TEMPORARY PREDICT (UI DEMO ONLY)
  void predict(String lang) async {

    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppStrings.text("select_image", lang),
          ),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
      result = "";
    });

    // Fake delay to simulate prediction
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
      result = "Tomato Leaf Blight (Demo Result)";
    });
  }

  @override
  Widget build(BuildContext context) {

    String lang =
        Provider.of<LanguageProvider>(context)
            .languageCode;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          AppStrings.text("detect_disease", lang),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // IMAGE PREVIEW
            if (selectedImage != null)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Stack(
                  children: [

                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(15),
                      child: Image.file(
                        selectedImage!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      right: 10,
                      top: 10,
                      child: InkWell(
                        onTap: removeImage,
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),

            // CAMERA & GALLERY
            Row(
              children: [

                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.camera),
                    label: Text(
                      AppStrings.text("camera", lang),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          const EdgeInsets.all(15),
                    ),
                    onPressed: pickCamera,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.image),
                    label: Text(
                      AppStrings.text("gallery", lang),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          const EdgeInsets.all(15),
                    ),
                    onPressed: pickGallery,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // PREDICT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => predict(lang),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.all(15),
                ),
                child: Text(
                  AppStrings.text(
                      "predict_disease", lang),
                  style:
                      const TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // LOADING
            if (isLoading)
              const CircularProgressIndicator(),

            const SizedBox(height: 20),

            // RESULT
            if (result.isNotEmpty)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(20),
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}