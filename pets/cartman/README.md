# Cartman

Cartman is a compact South Park cutout-style Codex pet based on Eric Cartman's
flat paper-cartoon silhouette, blue hat with yellow puff, red jacket, yellow
mittens, brown pants, black shoes, and smug or annoyed expressions.

The visual direction intentionally avoids the default pixel-art-adjacent pet
look. It keeps the Codex pet atlas constraints, but favors clean hard-edged
South Park-style cutout shapes, stiff body movement, simple hinged limb changes,
and face-driven personality.

## Animation Notes

- `idle`: smug, impatient micro-expressions.
- `running-right`: stiff waddling slide-step.
- `running-left`: derived by mirroring `running-right`; Cartman's design has no
  side-specific text, logo, handed prop, or asymmetric identity mark.
- `waving`: reluctant smug mitten wave, with no wave marks.
- `jumping`: short annoyed hop shown only through body position.
- `failed`: furious tantrum and offended sulk poses.
- `waiting`: impatient side-eye and small body/foot changes.
- `running`: in-place waddling run.
- `review`: suspicious squinting and judgemental head/eye changes.

## Generation Notes

The base image was generated with the `hatch-pet` workflow using the built-in
`imagegen` path. Row generation used subagents for `idle`, `running-right`,
`waving`, `jumping`, `failed`, `waiting`, `running`, and `review`; the parent
agent recorded all selected outputs and performed finalization.

Final validation and QA are clean:

- `source/final/validation.json`: `ok: true`, no errors, no warnings.
- `qa/review.json`: `ok: true`, no errors, no warnings.
- `qa/contact-sheet.png` was visually reviewed for identity consistency,
  transparent unused cells, and state-appropriate Cartman behavior.
