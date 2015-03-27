part of dartagram;

class PictureLoader {

  /// A backup of the original picture.
  CanvasElement scaledOriginalPic;

  /**
   * Loads the picture from the specified [file].
   */
  void loadPicture(File file) {
    // Picture url.
    String picUrl = Url.createObjectUrl(file);

    // Create Image.
    ImageElement pic = new ImageElement(src: picUrl);

    // Wait for the picture to load.
    pic.onLoad.first.then((event) {
      saveScaledPicture(pic, 612);

      displayScaledPicture(0, 0);

      // Release object url.
      Url.revokeObjectUrl(picUrl);
    });
  }

  /**
   * Scales and saves the scaled picture. The smaller side of the [pic] will
   * match the [size] The other side will be the same size or larger.
   */
  void saveScaledPicture(ImageElement pic, int size) {
    double scaleFactor;
    if (pic.width > pic.height) {
      // Landscape. Resize so that height matches size.
      scaleFactor = size / pic.height;
    } else {
      // Portrait. Resize so that width matches size.
      scaleFactor = size / pic.width;
    }

    int width = (pic.width * scaleFactor).round();
    int height = (pic.height * scaleFactor).round();

    scaledOriginalPic = new CanvasElement(width: width, height: height);
    CanvasRenderingContext2D scaledPicContext = scaledOriginalPic.getContext('2d');
    scaledPicContext.drawImageScaled(pic, 0, 0, width, height);
  }

  /**
   * Draws the image to the canvas.
   */
  void displayScaledPicture(int moveX, int moveY) {
    int sourceX = 0;
    int sourceY = 0;
    int sourceWidth = scaledOriginalPic.width;
    int sourceHeight = scaledOriginalPic.height;

    if (scaledOriginalPic.width > scaledOriginalPic.height) {
      // Landscape. Crop width.
      sourceX = moveX;
      sourceWidth = sourceHeight;
    } else {
      // Portrait. Crop height.
      sourceY = moveY;
      sourceHeight = sourceWidth;
    }

    int destX = 0;
    int destY = 0;
    int destWidth = 612;
    int destHeight = 612;

    pictureCanvas.canvasContext.drawImageScaledFromSource(scaledOriginalPic, sourceX, sourceY,
        sourceWidth, sourceHeight, destX, destY, destWidth, destHeight);
  }
}