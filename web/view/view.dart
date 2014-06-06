part of dartagram;

class PictureCanvas {

  CanvasElement canvas;
  CanvasRenderingContext2D canvasContext;

  PictureCanvas() {
    canvas = querySelector('#picture-canvas');
    canvasContext = canvas.getContext('2d');
  }
}


class CameraButton {

  DivElement cameraButton;
  InputElement cameraInput;

  CameraButton() {
    cameraButton = querySelector('#camera-button');
    cameraInput = cameraButton.querySelector('input');

    // Wait for user to supply a file.
    cameraInput.onChange.listen((event) {
      if (cameraInput.files.length > 0) {
        // User suplied a new file.
        pictureLoader.loadPicture(cameraInput.files[0]);
      }
    });
  }
}
