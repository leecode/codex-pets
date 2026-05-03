# AGENTS.md

Guidance for AI agents working in this repository.

## Project Overview

This repository is a Codex pet collection and distribution workspace. It stores both installable pet packages and the source/QA archive needed to revise those pets later.

Current pets include `bt-buddy`, a compact chibi BT-inspired titan companion,
and `cartman`, a South Park cutout-style character pet.

## Repository Layout

```text
dist/
  <pet-id>/
    pet.json
    spritesheet.webp
pets/
  <pet-id>/
    README.md
    package/
      pet.json
      spritesheet.webp
    qa/
      contact-sheet.png
      review.json
      run-summary.json
      videos/
    source/
      decoded/
      final/
      prompts/
      references/
      imagegen-jobs.json
      pet_request.json
```

`dist/<pet-id>/` is the minimal installable package to share or copy into `~/.codex/pets/<pet-id>/`.

`pets/<pet-id>/` is the working archive. Keep it complete enough for future revisions, including prompts, references, validation output, QA screenshots, and preview videos.

## Pet Package Contract

Each installable pet package must contain:

- `pet.json`
- `spritesheet.webp`

`pet.json` currently uses this schema:

```json
{
  "id": "bt-buddy",
  "displayName": "BT Buddy",
  "description": "A compact chibi BT-inspired titan companion with Titan Toons proportions.",
  "spritesheetPath": "spritesheet.webp"
}
```

Keep `pets/<pet-id>/package/` and `dist/<pet-id>/` in sync. If either `pet.json` or `spritesheet.webp` changes, update both locations.

## Sprite Atlas Rules

The current atlas format is:

- 8 columns
- 9 rows
- 192px cell width
- 208px cell height
- 1536x1872 total image size
- WEBP with alpha

Rows in order:

1. `idle` - 6 frames
2. `running-right` - 8 frames
3. `running-left` - 8 frames
4. `waving` - 4 frames
5. `jumping` - 5 frames
6. `failed` - 8 frames
7. `waiting` - 6 frames
8. `running` - 6 frames
9. `review` - 6 frames

Unused cells in a row should remain transparent.

## Generation Workflow

Use the `hatch-pet` workflow for new pets or significant sprite revisions. Preserve the resulting archive under `pets/<pet-id>/source/` and `pets/<pet-id>/qa/`.

For this project, keep these files updated after generation:

- `pets/<pet-id>/source/pet_request.json`
- `pets/<pet-id>/source/imagegen-jobs.json`
- `pets/<pet-id>/source/final/validation.json`
- `pets/<pet-id>/qa/review.json`
- `pets/<pet-id>/qa/run-summary.json`
- `pets/<pet-id>/qa/contact-sheet.png`
- `pets/<pet-id>/qa/videos/`
- `pets/<pet-id>/package/pet.json`
- `pets/<pet-id>/package/spritesheet.webp`
- `dist/<pet-id>/pet.json`
- `dist/<pet-id>/spritesheet.webp`

## QA Expectations

Before distributing a pet, verify:

- `source/final/validation.json` has `"ok": true`.
- `qa/review.json` has `"ok": true`.
- `errors` and `warnings` are empty in validation and review output.
- The contact sheet visually shows all expected states and no guide lines, chroma-key background, clipped frames, text, logos, or unwanted artifacts.
- Preview videos in `qa/videos/` look coherent for each animated state.

If a row is repaired or regenerated, document the reason in `pets/<pet-id>/README.md`.

## Local Install Check

To install a pet locally:

```bash
PET_ID=cartman
mkdir -p ~/.codex/pets/$PET_ID
cp -R dist/$PET_ID/. ~/.codex/pets/$PET_ID/
```

Then select the pet in Codex. If the UI does not refresh, switch to another pet and back.

## Editing Guidelines

- Prefer small, explicit changes. This repository is mostly assets and metadata.
- Do not rewrite generated JSON unless the corresponding asset or workflow output changed.
- Keep JSON pretty-printed with two-space indentation.
- Avoid committing `.DS_Store`, temporary files, logs, or one-off local run directories.
- Do not delete source or QA artifacts just because they are not part of the installable `dist/` package.
- Preserve notes about visual identity, especially asymmetrical details such as BT Buddy's right-side antenna.

## Current Pet Notes

For `bt-buddy`:

- The `running` row was repaired because the original row looked too side-profile compared with the rest of the pet.
- `running-left` was generated separately instead of mirrored so the right-side antenna identity would not flip incorrectly.
- The visual style should remain compact, chibi, pixel-art-adjacent, thick outlined, flat cel-shaded, and readable at 192x208.

For `cartman`:

- The visual style should remain South Park-inspired flat paper cutout, not pixel-art blocks.
- `running-left` was derived by mirroring `running-right` because the design has no side-specific text, logo, handed prop, or asymmetric identity mark.
- The `failed`, `waiting`, and `review` rows should stay strongly tied to Cartman's personality: tantrum, impatient side-eye, and suspicious judgement.
