# BT Buddy

A compact chibi BT-inspired titan companion with Titan Toons proportions.

## Install

Use the minimal package in:

```text
dist/bt-buddy/
```

Install locally with:

```bash
mkdir -p ~/.codex/pets/bt-buddy
cp -R dist/bt-buddy/. ~/.codex/pets/bt-buddy/
```

## Package

```text
package/
  pet.json
  spritesheet.webp
```

This mirrors the installable files under `dist/bt-buddy`.

## QA

- `qa/contact-sheet.png` shows all extracted animation frames.
- `qa/videos/` contains per-state MP4 previews.
- `qa/review.json` and `source/final/validation.json` should stay warning-free before distribution.

## Notes

- The `running` row was repaired after the first full hatch because the original row looked too side-profile compared with the rest of the pet.
- `running-left` was generated separately instead of mirrored so the right-side antenna identity would not flip incorrectly.
