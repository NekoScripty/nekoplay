# 🎵 NekoPlay

I built **NekoPlay** because I wanted the "expensive" soundstage of Apple Music and high-end DACs without the bloat of a heavy GUI or proprietary software. This is a minimal bash-driven audio engine that turns `mpv` into a studio-grade signal chain specifically tuned for **IEM (In-Ear Monitor) health** and high-fidelity transparency.

If you’re on Linux and care about bit-perfect audio but don't want to sacrifice your hearing or your hardware, this is for you.

---

## 🔥 Why use this?

Most music players just "play" the file. **NekoPlay** treats the audio like a live mastering session. It focuses on three things: **Signal Purity**, **Spatial Realism**, and **Ear Safety**.

### 🛠️ The Technical Signal Path
Every track is processed through a high-precision filter graph before it hits your ears:

1.  **Loudness Normalization (`loudnorm`):** Targets -16 LUFS. No more "volume jumping" between tracks. Your ears stay at a consistent, safe level.
2.  **Jan Meier Crossfeed (`bs2b`):** Standard stereo can be fatiguing on IEMs because it sounds like it's "inside your brain." This filter mimics how we hear speakers in a room, moving the soundstage out in front of you.
3.  **Spatial Expansion (`extrastereo`):** Adds a subtle 1.4x width to the stereo image to replicate that "airy" Atmos/Spatial feeling.
4.  **Hardware Protection (`alimiter`):** A hard safety ceiling at -1.5dB. It prevents digital spikes from clipping your drivers or hurting your eardrums.
5.  **Audiophile Resampling (`soxr`):** Uses the 28-bit precision SoX resampler to output a clean 96kHz/32-bit float signal.

---

## 🚀 Getting Started

### 1. Requirements
You'll need a few standard Linux tools (optimized for Arch, but works everywhere):
* `mpv` (The core engine)
* `yt-dlp` (For streaming support)
* `libbs2b` (For the crossfeed filter)
* `dunst` (Optional, for track notifications)

### 2. Installation
Just grab the script and make it yours:

```bash
git clone [https://github.com/NekoScripty/Nekoplay.git](https://github.com/NekoScripty/Nekoplay.git)
cd Nekoplay
chmod +x nekoplay.sh
