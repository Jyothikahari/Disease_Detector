import 'dart:io';
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class TFLiteService {
  late Interpreter _interpreter;

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

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset(
      'assets/tomato_disease_model.tflite',
    );
  }

  Future<String> predict(File imageFile) async {

    // Read image
    img.Image? image =
        img.decodeImage(imageFile.readAsBytesSync());

    // Resize to model input size (CHANGE IF NEEDED)
    img.Image resized =
        img.copyResize(image!, width: 128, height: 128);

    // Convert to Float32List
    var input = Float32List(1 * 128 * 128 * 3);
    int index = 0;

    for (int y = 0; y < 128; y++) {
      for (int x = 0; x < 128; x++) {
        var pixel = resized.getPixel(x, y);

        input[index++] = pixel.r / 255.0;
        input[index++] = pixel.g / 255.0;
        input[index++] = pixel.b / 255.0;
      }
    }

    var inputBuffer = input.reshape([1, 128, 128, 3]);

    var output = List.filled(1 * 10, 0.0)
        .reshape([1, 10]);

    _interpreter.run(inputBuffer, output);

    // Find highest probability
    double maxProb = 0;
    int maxIndex = 0;

    for (int i = 0; i < 10; i++) {
      if (output[0][i] > maxProb) {
        maxProb = output[0][i];
        maxIndex = i;
      }
    }

    return _labels[maxIndex];
  }
}