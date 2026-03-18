# 🐾 NekoPlay

**`#optimized-bash` `#license-gnu`**

[![License: GPLv3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

I built **NekoPlay** because I wanted the "expensive" soundstage of Apple Music and high-end DACs without the bloat of a heavy GUI or proprietary software. This is a minimal bash-driven audio engine that turns `mpv` into a studio-grade signal chain specifically tuned for **IEM (In-Ear Monitor) health** and high-fidelity transparency.

<div align="center">
  <img src="Assets/chi.png" alt="Chibi" width="200"><br>
  <i>« Vibe Music, Better Code »</i>
</div>

If you're on Linux and care about bit-perfect audio but don't want to sacrifice your hearing or your hardware, this is for you.

---

## 🔥 Why use this?

Most music players just "play" the file. **NekoPlay** treats the audio like a live mastering session. It focuses on three things: **Signal Purity**, **Spatial Realism**, and **Ear Safety**.

### 🛠️ The Technical Signal Path
Every track is processed through a high-precision filter graph before it hits your ears:

1. **Loudness Normalization (`loudnorm`):** Targets -16 LUFS. No more "volume jumping" between tracks. Your ears stay at a consistent, safe level.
2. **Jan Meier Crossfeed (`bs2b`):** Standard stereo can be fatiguing on IEMs because it sounds like it's "inside your brain." This filter mimics how we hear speakers in a room, moving the soundstage out in front of you.
3. **Spatial Expansion (`extrastereo`):** Adds a subtle 1.4x width to the stereo image to replicate that "airy" Atmos/Spatial feeling.
4. **Hardware Protection (`alimiter`):** A hard safety ceiling at -1.5dB. It prevents digital spikes from clipping your drivers or hurting your eardrums.
5. **Audiophile Resampling (`soxr`):** Uses the 28-bit precision SoX resampler to output a clean 96kHz/32-bit float signal.

---

## 🚀 Getting Started

### 1. Requirements
You'll need a few standard Linux tools (optimized for Arch, but works everywhere):
- `mpv` (The core engine)
- `yt-dlp` (For streaming support)
- `libbs2b` (For the crossfeed filter)
- `dunst` (Optional, for track notifications)

### 2. Installation
Just grab the script and make it yours:

### Arch Linux Dependencies
```bash
sudo pacman -S mpv ffmpeg yt-dlp libnotify libsoxr libbs2b
```
### install
```bash
git clone https://github.com/NekoScripty/nekoplay.git
cd nekoplay
chmod +x nekoplay.sh
```

## 🎮 Controls
#### The controls are tactile and simple so you can stay in your terminal or window manager:
###### [SPACE] - Play / Pause
###### [UP / DOWN] - Volume (±2%)
###### [LEFT / RIGHT] - Seek 5 seconds
###### [ENTER] - Next Track
###### [Q] - Quit safely

<p> Then restart audio with systemctl --user restart pipewire. This ensures the 96kHz signal from NekoPlay reaches your DAC without being "stepped on" by the OS. </p>

## 📜 License
<p> Licensed under the GPLv3. Protect your ears and keep the code free. </p>

<p>
🌟 GitHub "About" Description
🎧 NekoPlay | The Audiophile's Terminal Engine by @NekoScripty. 🚀 Studio-grade 32-bit float pipeline. 🛡️ Focused on IEM health & ear protection. 🌌 Spatial "Atmos-like" soundstage in a minimal Bash script. 💎 Bit-perfect Soxr resampling. 🐾
</p>
</div>
