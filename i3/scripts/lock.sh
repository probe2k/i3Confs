#!/bin/bash
TMPBG=/tmp/screen.png
LOCK=$HOME/.config/i3/scripts/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
#ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=10:5,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
#i3lock -i $TMPBG

#ffmpeg -f x11grab -i $DISPLAY -i $LOCK -filter_complex "[0:v]boxblur=luma_radius=min(w\,h)/5:chroma_radius=min(cw\,ch)/5:luma_power=1[blurred],overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -map "[blurred]" -vframes 1 $TMPBG -loglevel quiet

ffmpeg -f x11grab -i $DISPLAY -i $LOCK -filter_complex "gblur=100,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
i3lock -i $TMPBG
rm $TMPBG
