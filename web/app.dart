library dartagram;

import 'dart:html';

// Model objects.

// Controller objects.

// View objects.

/**
 * Wire up the application.
 */
void main() {
  // Init model data.
  
  // Init controllers.
  
  // Init views.
  
  CanvasElement picCanvas = querySelector('#picture-canvas');
  CanvasRenderingContext2D picCanvasContext = picCanvas.getContext('2d');      
  InputElement cameraFile = querySelector('#camera-file');

  // Draw picture if user suplies a file.
  cameraFile.onChange.listen((event) {
    if (cameraFile.files.length > 0) {
      // Picture url.
      String picUrl = Url.createObjectUrl(cameraFile.files[0]);
      
      // Create Image.
      ImageElement pic = new ImageElement(src: picUrl);
      
      // Draw picture into canvas when ready.
      pic.onLoad.first.then((event) {
        picCanvasContext.drawImageScaled(pic, 0, 0, 500, 500);
        
        // Release object url.
        Url.revokeObjectUrl(picUrl);
      });
    }
  });
}