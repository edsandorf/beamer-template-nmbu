# Beamer Template NMBU

A Beamer theme matching [NMBU's graphical profile](https://design.nmbu.no/artikler/node/2970), for
lectures and presentations. Based on [Beamer-NMBU by Eivysaur](https://github.com/Eivysaur/Beamer-NMBU).

## Prerequisites

A TeX distribution (TeX Live, MacTeX, MiKTeX) with:

- `tikz`, `calc`, `lmodern`, `graphicx` — used by the theme itself.
- `biblatex` with the **biber** backend — used by the example for citations. Biber is a separate
  executable, not just a package: make sure it's on your `PATH` and selected as the bibliography
  backend in whatever editor/build tool you compile with (Overleaf handles this automatically;
  local editors like TeXstudio/VS Code's LaTeX Workshop usually need `biber` picked explicitly
  as the bibliography tool, not the older `bibtex`).

## What to deploy

Only these files are the actual theme — copy them together as a unit into wherever you're writing
a presentation (a teaching lecture folder, a `Projects/Outputs/Presentations/<slug>/` folder):

```
beamerthemenmbu.sty
beamercolorthemenmbu.sty
beamerfontthemenmbu.sty
beamerinnerthemenmbu.sty
beamerouterthemenmbu.sty
gfx/
```

`NMBU-example.tex` and `references.bib` are demo/reference material only — they show the theme in
use, but don't need to ship alongside it.

## Usage

In your own `.tex` file, in the same directory as the theme files above:

```latex
\documentclass[aspectratio=169]{beamer}
\usetheme{nmbu}

% Comma-separated list of logos shown in the footline (no file extension)
\newcommand*{\logos}{
    gfx/logo-nmbu,
    gfx/logo-aacsb-accredited
}

\begin{document}
\begin{frame}
  \titlepage
\end{frame}
\end{document}
```

`\logos` is defined per-presentation, not inside the theme — so different decks can show different
logo combinations without touching the shared theme files. See `NMBU-example.tex` for a fuller
worked example, including math, blocks, and citations with `biblatex`.

## License

TODO — confirm the license terms of the upstream [Beamer-NMBU](https://github.com/Eivysaur/Beamer-NMBU)
project this is based on, and add a `LICENSE` file here reflecting them before sharing this
repository with others.
