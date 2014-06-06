library dartagram;

import 'dart:html';
import 'dart:async';

part 'controller/picture_loader.dart';
part 'view/view.dart';

// Model objects.

// Controller objects.
PictureLoader pictureLoader;

// View objects.
PictureCanvas pictureCanvas;
CameraButton cameraButton;

/**
 * Wire up the application.
 */
void main() {
  // Init model data.
  
  // Init controllers.
  pictureLoader = new PictureLoader();
  
  // Init views.
  pictureCanvas = new PictureCanvas();
  cameraButton = new CameraButton();
}