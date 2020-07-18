#! /bin/bash
# This program use Image Magick library to process a given image
# to a bichromial dithered picture.

# Dot paterns legal values -> https://imagemagick.org/command-line-options.php#ordered-dither 

help="usage: input [-o output_path] [-s size] [-p dotpatern] [-b blackcolor] [-w whitecolor] [-h help]"

# Arguments parsing
if [ -z "$1" ];then
    echo "Expected input file"
    echo $help
    exit 1
fi
file=$1
shift 1

while getopts "o:s:p:b:w:h" opt; do
    case ${opt} in
    h)  
        echo "$help"
        exit 0
        ;;
    o)
        outpath="$OPTARG"
        ;;
    s)
        size="$OPTARG"
        ;;
    p)
        dotpatern="$OPTARG"
        ;;
    b)
        blackcolor="$OPTARG"
        ;;
    w)
        whitecolor="$OPTARG"
        ;;
    esac
done
# Default values fallback
if [ -z "$outpath" ];then
    outpath="."
fi
if [ -z "$size" ];then
    size="500"
fi
if [ -z "$dotpatern" ];then
    dotpatern="h8x8o"
fi
if [ -z "$blackcolor" ];then
    blackcolor="#00FF00"
fi
if [ -z "$whitecolor" ];then
    whitecolor="#FFFFFF"
fi

# Image processing
convert $file -colorspace GRAY -resize $size png:/tmp/gray.png
convert /tmp/gray.png -ordered-dither $dotpatern png:/tmp/bwdot.png
convert /tmp/bwdot.png +level-colors $blackcolor,$whitecolor png:$outpath/$(basename "$file" | sed 's/\(.*\)\..*/\1/')_$dotpatern.png
