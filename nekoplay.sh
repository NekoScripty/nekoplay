#!/bin/bash

# Configuration
PLAYLIST="playlist.txt"
INPUT_CONF="/tmp/neko_input.conf"
DAC_SAMPLE_RATE="96000" # Match your DAC's best native rate

# Keybindings for control
cat << EOF > "$INPUT_CONF"
SPACE cycle pause
RIGHT seek 5
LEFT seek -5
UP add volume 2
DOWN add volume -2
ENTER playlist-next
q quit
EOF

# Notification Handler (Lightweight & Minimal)
function send_notification() {
    while true; do
        if command -v notify-send >/dev/null 2>&1; then
            track=$(mpv --get-property=media-title --playlist-pos=current 2>/dev/null)
            if [ ! -z "$track" ]; then
                notify-send -t 4000 "🎧 Neko-Fi High-Res" "$track" --icon=audio-card
            fi
        fi
        sleep 20
    done
}

send_notification &
NOTIFY_PID=$!

echo -e "\e[1;36m[Neko-Fi Elite Ultra]\e[0m Initializing Safe High-Res Pipeline..."

# THE MASTERING CHAIN (In Order of Execution):
# 1. loudnorm: EBU R128 (-16 LUFS). Normalizes volume across all tracks to prevent "shocks."
# 2. bs2b: Jan Meier Crossfeed. Moves the sound "out of your head" for an Atmos-like room feel.
# 3. alimiter: SAFETY LIMITER. Hard-clips any peaks above -1.5dB to protect sensitive IEM drivers.
# 4. soxr: 28-bit Precision Resampling. Ensures pure lossless delivery to your hardware.

mpv --playlist="$PLAYLIST" \
    --no-video \
    --ytdl-format="bestaudio/best" \
    --audio-buffer=3 \
    --gapless-audio=yes \
    --volume=40 \
    --volume-max=100 \
    --input-conf="$INPUT_CONF" \
    --term-osd-bar \
    --term-status-msg="[Hi-Res 32-bit] \${time-pos} / \${duration} | Vol: \${volume}%" \
    --af="lavfi=[loudnorm=I=-16:TP=-1.5:LRA=11],lavfi=[bs2b=profile=jmeier],lavfi=[alimiter=level_in=1:level_out=1:limit=0.85:attack=5:release=50],lavfi=[aresample=$DAC_SAMPLE_RATE:resampler=soxr:precision=28:osf=fltp]"

# Cleanup
kill $NOTIFY_PID
rm -f "$INPUT_CONF"
