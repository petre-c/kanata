# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Kanata keyboard remapping configuration project. Kanata is a software keyboard remapper that allows advanced key remapping, including tap-hold configurations and layers.

## Key Files

- `kanata.kbd` - Main configuration file containing keyboard remapping definitions
- `kanata.exe` - Windows executable for running the Kanata keyboard remapper

## Configuration Structure

The `kanata.kbd` file uses Kanata's lisp-like configuration syntax with these main sections:

1. `defcfg` - Global configuration settings
2. `defsrc` - Source keyboard layout definition
3. `defvar` - Variable definitions for timing parameters
4. `defalias` - Key aliases and tap-hold configurations
5. `deflayer` - Layer definitions (base and fn layers)

## Key Remapping Logic

### Home Row Modifiers
The configuration implements home row modifiers using tap-hold:
- `a` → tap for 'a', hold for Left Meta (Windows key)
- `s` → tap for 's', hold for Left Alt
- `d` → tap for 'd', hold for Left Shift
- `f` → tap for 'f', hold for Left Control
- `j` → tap for 'j', hold for Right Control
- `k` → tap for 'k', hold for Right Shift
- `l` → tap for 'l', hold for Right Alt
- `;` → tap for ';', hold for Right Meta

### Function Layer
- Space bar acts as a layer toggle (tap for space, hold for fn layer)
- In fn layer: i,j,k,l become arrow keys (up, left, down, right)
- u,o,p,m become home, end, backspace, delete

## Running Kanata

To run the configuration on Windows:
```bash
./kanata.exe --cfg kanata.kbd
```

## Testing Changes

When modifying the configuration:
1. Save changes to `kanata.kbd`
2. Restart Kanata to apply changes
3. Test each key mapping systematically

## Common Tasks

### Adding New Key Mappings
1. Add the key to `defsrc` if not already present
2. Create an alias in `defalias` section
3. Map the alias in the appropriate `deflayer`

### Adjusting Timing
Modify the `defvar` section:
- `tap-time` - Maximum time for a tap (currently 50ms)
- `hold-time` - Minimum time to trigger hold (currently 150ms)

### Creating New Layers
1. Define a new layer with `deflayer layer-name`
2. Add a key binding to toggle/switch to the layer
3. Map all keys in the new layer (use `_` for transparent keys)