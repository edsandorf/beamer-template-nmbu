# Beamer Template NMBU

A Beamer theme matching [NMBU's graphical profile](https://design.nmbu.no/artikler/node/2970), for
lectures and presentations. Based on [Beamer-NMBU by Eivysaur](https://github.com/Eivysaur/Beamer-NMBU).

## Prerequisites

A TeX distribution (TeX Live, MacTeX, MiKTeX) with:

- `tikz`, `calc`, `lmodern`, `graphicx` — used by the theme itself.
- `mwe` — provides the placeholder images used in the example deck (included in TeX Live and MiKTeX).
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

### Full-slide figures

LaTeX has no "fill the remaining space" option for graphics. In Beamer, the frame title sits inside
the content area, so the space left for a figure depends on how many lines the title wraps to. The
theme measures this for you:

```latex
% Largest size that fits below the title, above the footline and within the margins
\begin{frame}{Distribution of the invasive species}
    \fullslidegraphic{figs/map.png}
\end{frame}

% Extra \includegraphics options, e.g. to trim whitespace baked into the file (l b r t)
\fullslidegraphic[trim=8bp 45bp 8bp 37bp, clip]{figs/map.png}

% Several graphics side by side at the full available height
\setfullslideheight
{\centering
    \includegraphics[height=\fullslideheight]{figs/a.png}\hspace{1em}%
    \includegraphics[height=\fullslideheight]{figs/b.png}\par}
```

- `\fullslidegraphic` keeps the aspect ratio and is meant as the only content of a frame. Inside a
  column it fills the column width.
- It works with titles that wrap, subtitles, frames without a title, top-aligned `[t]` frames, and
  `[plain]` frames, where it also uses the space the footline would have taken.
- Avoid `width=` and `height=` for full-slide graphics, and avoid wrapping them in a `figure`
  environment. The environment adds padding that pushes the graphic into the footline.

### Available logos

All logos live in `gfx/` and follow the `logo-<name>` convention. Reference them without the file
extension.

| Logo                                    | Path                                |
| --------------------------------------- | ----------------------------------- |
| NMBU                                    | `gfx/logo-nmbu`                     |
| AACSB Accredited                        | `gfx/logo-aacsb-accredited`         |
| European Union (flag)                   | `gfx/logo-eu`                       |
| Biodiversa+ – European Biodiversity Partnership | `gfx/logo-biodiversa`       |
| BRAVE (project)                         | `gfx/logo-brave`                    |
| FCT – Fundação para a Ciência e a Tecnologia (Portugal) | `gfx/logo-fct`      |
| Formas (Sweden)                         | `gfx/logo-formas`                   |
| INLAND – Center for Innovative Solutions for Sustainable Land Use and Nature Management | `gfx/logo-inland` |
| Innovation Fund Denmark                 | `gfx/logo-innovation-fund-denmark`  |
| The Research Council of Norway          | `gfx/logo-research-council-norway`  |
| Autonomous Province of Bolzano – South Tyrol | `gfx/logo-bolzano-south-tyrol` |

Logos are cropped tight to their content (no whitespace margin) so they line up at the same height
in the footline. Crop any new logo the same way, and avoid spaces in file names.

## License

TODO — confirm the license terms of the upstream [Beamer-NMBU](https://github.com/Eivysaur/Beamer-NMBU)
project this is based on, and add a `LICENSE` file here reflecting them before sharing this
repository with others.
