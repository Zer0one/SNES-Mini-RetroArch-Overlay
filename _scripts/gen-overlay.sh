#!/bin/bash
CURR_DIR="$(pwd)"
SPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LIBS_DIR="$SPT_DIR/_Scripts.lib"
TEMP_DIR="$SPT_DIR/_TEMP"

source "$LIBS_DIR/_myLibrary.sh"

# Script Mode Settings
artStretchMode="fill" # Possible values: fill (default), fit || Control how the artwork is "streched" for not 16:9 screens

# Common List Definition
artTypeLst=("SNESMiniMode" "SideArtOnly")
scnRatioLst=("16_9" "16_10")
artRatioLst=("CRTFilter" "4_3" "PixelPerfect")
artLst=("ambient" "wire" "crystal" "dot" "mosaic" "dot2" "wood" "space" "speaker" "curtain" "midnight")

artTypeLstShrt=("full" "side")
scnRatioLstShrt=("16_9" "16_10")
artRatioLstShrt=("43-crt" "43" "pp")

if [ "$1" == "" ]; then
  baseDir="/mnt/c/Users/andre/Retro/Apps/RetroArch/overlays/borders/snes-mini-borders"
else
  baseDir="$1"
fi
dataDir="./_srcData"

## Generate Artworks config files
function genConfig () {
  local scnRatio="$1"
  local artDir="$2"
  local artFile="$3"
  local confFile="${artFile%.*}.cfg"
  local artStretchMode="$artStretchMode"
  local confData=""

  case "$scnRatio" in
    "16_9")
      confData="0.0,0.0,1.0,1.0"
      ;;
    "16_10")
      if [ "$artStretchMode" == "fit" ]; then
        confData="0.0,0.05,1.0,0.9"
      else # "$artStretchMode" == "fill"
        confData="-0.056,0.0,1.111,1.0"
      fi
      ;;
    *)
      echo "ERROR: Unknow Screen Ratio: $scnRatio"
      ;;
  esac
 
  echo "overlays = 1"                  >  "$artDir/$confFile"
  echo "overlay0_overlay = $artFile"   >> "$artDir/$confFile"
  echo "overlay0_full_screen = true"   >> "$artDir/$confFile"
  echo "overlay0_descs = 0"            >> "$artDir/$confFile"
  echo "overlay0_rect = \"$confData\"" >> "$artDir/$confFile"
}

## Main Commands
for artTypeIdx in "${!artTypeLst[@]}"; do
  for scnRatioIdx in "${!scnRatioLst[@]}"; do
    for artRatioIdx in "${!artRatioLst[@]}"; do
      artDir="$baseDir/${artTypeLst[$artTypeIdx]}/${scnRatioLst[$scnRatioIdx]}/${artRatioLst[$artRatioIdx]}"
      mkdir "$artDir"
      for artIdx in "${!artLst[@]}"; do
        artFileSrc="${artTypeLstShrt[$artTypeIdx]}_${artRatioLstShrt[$artRatioIdx]}_$(printf "%02d" "$[artIdx+1]")-${artLst[$artIdx]}.png"
        artFileDst="$(printf "%02d" "$[artIdx+1]")-${artLst[$artIdx]^}.png"
        if [ -f "$dataDir/$artFileSrc" ]; then
          cp "$dataDir/$artFileSrc" "$artDir/$artFileDst"
          genConfig "${scnRatioLstShrt[$scnRatioIdx]}" "$artDir" "$artFileDst"
        fi
      done
    done
  done
done


## Snippets
#
# for idx in "${!artLst[@]}"; do
#  printf "%02d_%s\n" "$[idx+1]" "${artLst[$idx]^}"
# done