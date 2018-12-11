#!/bin/bash
CURR_DIR="$(pwd)"
SPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LIBS_DIR="$SPT_DIR/_Scripts.lib"
TEMP_DIR="$SPT_DIR/_TEMP"

source "$LIBS_DIR/_myLibrary.sh"

# Script Mode Settings
artStretchMode="fill" # Possible values: fill (default), fit || Control how the artwork is "streched" for not 16:9 screens

# Cmd Line Reads
artType="$1"  # Artwork Type (full, side)
scnRes="$2"   # Device Screen Resolution (720p,768p,1080p,1050q)
artRatio="$3" # Artwork Screen Ratio (crt,43,pp)

retroCfgFile="/mnt/c/Users/andre/Retro/Apps/RetroArch/retroarch.cfg"

function def () {
   store "$retroCfgFile" "aspect_ratio_index" "22"
   store "$retroCfgFile" "overlay_directory" ":/overlays"
   store "$retroCfgFile" "input_overlay" ""
   store "$retroCfgFile" "custom_viewport_width" "960"
   store "$retroCfgFile" "custom_viewport_height" "720"
   store "$retroCfgFile" "custom_viewport_x" "0"
   store "$retroCfgFile" "custom_viewport_y" "0"
}

## 16:9
function set_16-9_43 () {
   store "$retroCfgFile" "aspect_ratio_index" "0"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_9/4_3"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_9/4_3/01-Ambient.cfg"
}

function set_16-9_crt () {
   set_16-9_43
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_9/CRTFilter"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_9/CRTFilter/01-Ambient.cfg"
}

function set_16-9_pp () {
   store "$retroCfgFile" "aspect_ratio_index" "15"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_9/PixelPerfect"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_9/PixelPerfect/01-Ambient.cfg"
}

## 16:10
function set_16-10_43 () {
   store "$retroCfgFile" "aspect_ratio_index" "0"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_10/4_3"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_10/4_3/01-Ambient.cfg"
}

function set_16-10_crt () {
   set_16-10_43
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_10/CRTFilter"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_10/CRTFilter/01-Ambient.cfg"
}

function set_16-10_pp () {
   store "$retroCfgFile" "aspect_ratio_index" "15"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_10/PixelPerfect"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SideArtOnly/16_10/PixelPerfect/01-Ambient.cfg"
}

## 720p
function set_720p_43 () {
   store "$retroCfgFile" "aspect_ratio_index" "23"
   store "$retroCfgFile" "custom_viewport_width" "896"
   store "$retroCfgFile" "custom_viewport_height" "672"
   store "$retroCfgFile" "custom_viewport_x" "192"
   store "$retroCfgFile" "custom_viewport_y" "24"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/4_3"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/4_3/01-Ambient.cfg"
}

function set_720p_crt () {
   set_720p_43
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/CRTFilter"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/CRTFilter/01-Ambient.cfg"
}

function set_720p_pp () {
   store "$retroCfgFile" "aspect_ratio_index" "23"
   store "$retroCfgFile" "custom_viewport_width" "768"
   store "$retroCfgFile" "custom_viewport_height" "672"
   store "$retroCfgFile" "custom_viewport_x" "256"
   store "$retroCfgFile" "custom_viewport_y" "24"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/PixelPerfect"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/PixelPerfect/01-Ambient.cfg"
}

## 768p
function set_768p_43 () {
   store "$retroCfgFile" "aspect_ratio_index" "23"
   store "$retroCfgFile" "custom_viewport_width" "956"
   store "$retroCfgFile" "custom_viewport_height" "716"
   store "$retroCfgFile" "custom_viewport_x" "205"
   store "$retroCfgFile" "custom_viewport_y" "26"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/4_3"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/4_3/01-Ambient.cfg"
}

function set_768p_crt () {
   set_768p_43
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/CRTFilter"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/CRTFilter/01-Ambient.cfg"
}

function set_768p_pp () {
   store "$retroCfgFile" "aspect_ratio_index" "23"
   store "$retroCfgFile" "custom_viewport_width" "820"
   store "$retroCfgFile" "custom_viewport_height" "716"
   store "$retroCfgFile" "custom_viewport_x" "273"
   store "$retroCfgFile" "custom_viewport_y" "26"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/PixelPerfect"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/PixelPerfect/01-Ambient.cfg"
}

## 1080p
function set_1080p_43 () {
   store "$retroCfgFile" "aspect_ratio_index" "23"
   store "$retroCfgFile" "custom_viewport_width" "1344"
   store "$retroCfgFile" "custom_viewport_height" "1008"
   store "$retroCfgFile" "custom_viewport_x" "298"
   store "$retroCfgFile" "custom_viewport_y" "36"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/4_3"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/4_3/01-Ambient.cfg"
}

function set_1080p_crt () {
   set_1080p_43
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/CRTFilter"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/CRTFilter/01-Ambient.cfg"
}

function set_1080p_pp () {
   store "$retroCfgFile" "aspect_ratio_index" "23"
   store "$retroCfgFile" "custom_viewport_width" "1152"
   store "$retroCfgFile" "custom_viewport_height" "1008"
   store "$retroCfgFile" "custom_viewport_x" "384"
   store "$retroCfgFile" "custom_viewport_y" "36"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/PixelPerfect"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_9/PixelPerfect/01-Ambient.cfg"
}

## 1050q
function set_1050q_43 () {
   store "$retroCfgFile" "aspect_ratio_index" "23"
   store "$retroCfgFile" "custom_viewport_width" "1306"
   store "$retroCfgFile" "custom_viewport_height" "980"
   store "$retroCfgFile" "custom_viewport_x" "187"
   store "$retroCfgFile" "custom_viewport_y" "35"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_10/4_3"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_10/4_3/01-Ambient.cfg"
}

function set_1050q_crt () {
   set_1050q_43
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_10/CRTFilter"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_10/CRTFilter/01-Ambient.cfg"
}

function set_1050q_pp () {
   store "$retroCfgFile" "aspect_ratio_index" "23"
   store "$retroCfgFile" "custom_viewport_width" "1120"
   store "$retroCfgFile" "custom_viewport_height" "980"
   store "$retroCfgFile" "custom_viewport_x" "280"
   store "$retroCfgFile" "custom_viewport_y" "35"
   store "$retroCfgFile" "overlay_directory" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_10/PixelPerfect"
   store "$retroCfgFile" "input_overlay" ":/overlays/borders/snes-mini-borders/SNESMiniMode/16_10/PixelPerfect/01-Ambient.cfg"
}

## Main Block
# Decode res. code
case "$scnRes" in
   "720p"|"720P")
      scnRes="1280x720"
      ;;
   "768p"|"768P")
      scnRes="1366x768"
      ;;
   "1080p"|"1080P")
      scnRes="1920x1080"
      ;;
   "1050q"|"1050Q")
      scnRes="1680x1050"
      ;;
esac

# Decode res. aspect-ratio for side mode
if [ "$artType" == "side" ]; then
   case "$scnRes" in
      "1280x720"|"1366x768"|"1920x1080")
         scnRes="16_9"
         ;;
      "1680x1050")
         scnRes="16_10"
         ;;
   esac
fi

# Side mode options
if [ "$artType" == "side" ]; then
   case "$scnRes" in
      "16_9")
         set_16-9_43
         ;;
      "16_10")
         set_16-10_43
         ;;
      "")
         echo "MSG: At least you need to define an aspct-ratio/res."
         ;;
      *)
         echo "MSG: No settings available for this aspect-ratio/res. yet: $scnRes"
         ;;      
   esac

# Full mode options
elif [ "$artType" == "full" ]; then
   case "$scnRes" in
      # 16:9 Res.
      "1280x720")
         case "$artRatio" in
            "43"|"4_3"|"")
               set_720p_43
               ;;
            "crt"|"43-crt"|"4_3-crt")
               set_720p_crt
               ;;
            "pp"|"87"|"8_7")
               set_720p_pp
               ;;
         esac
         ;;
      "1366x768")
         case "$artRatio" in
            "43"|"4_3"|"")
               set_768p_43
               ;;
            "crt"|"43-crt"|"4_3-crt")
               set_768p_crt
               ;;
            "pp"|"87"|"8_7")
               set_768p_pp
               ;;
         esac
         ;;
      "1920x1080")
         case "$artRatio" in
            "43"|"4_3"|"")
               set_1080p_43
               ;;
            "crt"|"43-crt"|"4_3-crt")
               set_1080p_crt
               ;;
            "pp"|"87"|"8_7")
               set_1080p_pp
               ;;
         esac
         ;;
      # 16:10 Res.
      "1680x1050")
         case "$artRatio" in
            "43"|"4_3"|"")
               set_1050q_43
               ;;
            "crt"|"43-crt"|"4_3-crt")
               set_1050q_crt
               ;;
            "pp"|"87"|"8_7")
               set_1050q_pp
               ;;
         esac
         ;;
      "")
         echo "MSG: At least you need to define a resolution"
         ;;
      *)
         echo "MSG: No settings available for this aspect-ratio/res. yet: $scnRes"
         ;;
   esac

# Reset to default special mode
elif [ "$artType" == "default" -o  "$artType" == "def" ]; then
   def

# Not supported mode
else
   echo "MSG: At least you need to define and operation mode"
fi

## Snippets
#
# for idx in "${!artLst[@]}"; do
#  printf "%02d_%s\n" "$[idx+1]" "${artLst[$idx]^}"
# done