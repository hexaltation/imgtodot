# imgtodot
Is a script using ImageMagick to process a given image to a bichromial dithered picture.

## Dependancies
[ImageMagick](https://github.com/ImageMagick/ImageMagick)

## Usage
```
usage: input [-o output_path] [-s size] [-p dotpatern] [-b blackcolor] [-w whitecolor] [-h help]
```
- Dot paterns legal values can be found in [ImageMagick official documentation](https://imagemagick.org/command-line-options.php#ordered-dither)
- blackcolor and whitecolor options can take either color names (red, green, blue...) or HTML color values (#FFFFFF style)  
