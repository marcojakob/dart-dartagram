library dartagram;

import 'dart:html';

import 'package:dnd/dnd.dart';

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

  Draggable draggable = new Draggable(pictureCanvas.canvas);

  draggable.onDrag.listen((event) {
    pictureLoader.displayScaledPicture(event.startPosition.x - event.position.x,
        event.startPosition.y - event.position.y);
  });
}