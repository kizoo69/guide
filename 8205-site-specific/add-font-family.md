# AI Job Rule: Add Font Family

1. Place the new font archive inside `fonts/`.
2. Extract only font binaries (`*.ttf` or `*.otf`) into a temporary workspace.
3. Move the extracted files into `static/fonts/<family-name>/`, using consistent filenames that reflect weight/style.
4. Create (or update) a Sass partial under `assets/scss/fonts/_<FamilyName>.scss` with `@font-face` blocks pointing to `/fonts/<family-name>/<filename>.ttf` and the appropriate `font-weight` values.
5. Import the partial into the main Sass bundle and run `hugo server` (or the relevant build pipeline) to confirm that the font loads correctly.
