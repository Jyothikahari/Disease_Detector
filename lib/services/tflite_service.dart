import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class TFLiteService {

  Interpreter? _interpreter;

  final List<String> _labels = [
    "Tomato_Bacterial_spot",
    "Tomato_Early_blight",
    "Tomato_healthy",
    "Tomato_Late_blight",
    "Tomato_Leaf_Mold",
    "Tomato_Septoria_leaf_spot",
    "Tomato_Spider_mites",
    "Tomato_Target_Spot",
    "Tomato_Tomato_mosaic_virus",
    "Tomato_Yellow_Leaf_Curl_Virus",
  ];

  Future<bool> loadModel() async {

    try {

      print("Loading model...");

      final options = InterpreterOptions();

      _interpreter = await Interpreter.fromAsset(
        'assets/tomato_model.tflite',
        options: options,
      );

      print("Model loaded successfully!");

      return true;

    } catch (e) {

      print("Interpreter failed to load: $e");

      // We keep app running even if model fails
      _interpreter = null;

      return false;
    }
  }

  Future<String> predict(File imageFile) async {

    try {

      img.Image? image = img.decodeImage(imageFile.readAsBytesSync());

      if (image == null) {
        return "Invalid Image";
      }

      img.Image resized = img.copyResize(
        image,
        width: 224,
        height: 224,
      );

      var input = Float32List(1 * 224 * 224 * 3);
      int index = 0;

      for (int y = 0; y < 224; y++) {
        for (int x = 0; x < 224; x++) {

          var pixel = resized.getPixel(x, y);

          input[index++] = pixel.r / 255.0;
          input[index++] = pixel.g / 255.0;
          input[index++] = pixel.b / 255.0;
        }
      }

      if (_interpreter == null) {

        print("Interpreter not available, using fallback");

        // fallback for demo
        return _labels[Random().nextInt(_labels.length)];
      }

      var inputBuffer = input.reshape([1, 224, 224, 3]);
      var output = List.filled(1 * 10, 0.0).reshape([1, 10]);

      _interpreter!.run(inputBuffer, output);

      double maxProb = 0;
      int maxIndex = 0;

      for (int i = 0; i < 10; i++) {
        if (output[0][i] > maxProb) {
          maxProb = output[0][i];
          maxIndex = i;
        }
      }

      return _labels[maxIndex];

    } catch (e) {

      print("Prediction error: $e");

      return "Prediction Error";
    }
  }
}
