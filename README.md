# dwm-dots

## Overview

This repository contains my configuration files (dots) for [dwm](https://dwm.suckless.org/), a dynamic window manager for X11. These configurations are tailored to enhance my productivity and provide a personalized user experience.

## Features

- **Custom Keybindings**: Easily navigate and manage windows with my personalized keybindings.
- **Theming**: Aesthetic themes that improve the visual appeal of the desktop environment.
- **Patches**: Includes various patches that extend the functionality of dwm, such as [floating windows](https://dwm.suckless.org/patches/floating/) and [status bar enhancements](https://dwm.suckless.org/patches/status2d/).

## Installation

To use my dwm configuration, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/CrypticSpider/dwm-dots.git
   cd dwm-dots
   ```
2. **Copy Configuration Files**:
   Copy the configuration files to your home directory or the appropriate location in your dwm setup. For example:

```bash
cp -r * ~/.config/dwm/
```

3. **Compile dwm**:
   If you haven't already, compile dwm with the new configuration:

```
cd /path/to/dwm
make clean install
```

# Restart dwm:

Restart dwm to apply the new configuration.
