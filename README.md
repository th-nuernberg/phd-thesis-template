# Template for PhD Theses at Promotionszentrum Angewandte Informatik (PZAI)

## Overview

This project contains LaTeX files for building your thesis document. 
The default build tool is `latexmk`, which simplifies the compilation process by automatically handling dependencies and multiple runs of LaTeX-related commands. 
For users who prefer a manual approach, an alternative build sequence using `pdflatex`, `biber`, and `makeglossaries` is also available.

## Requirements

To build the project, you need the following software installed:
- **LaTeX distribution** (e.g., TeX Live, MiKTeX, or MacTeX)
- **`latexmk`** (included in most LaTeX distributions)
- **`biber`** (for bibliography management with `biblatex`)
- **`makeglossaries`** (for glossaries and acronym handling)

## Build Instructions

### Default Build with `latexmk`
`latexmk` is an automation tool for LaTeX projects. It determines the necessary sequence of commands (e.g., multiple runs of `pdflatex`, `biber`, `makeglossaries`) to produce a properly compiled document. It monitors dependencies and ensures everything is up-to-date.

1. Open a terminal in the project directory.
2. Choose one of the two commands:
  - Run `make` to compile the document normally with `latexmk` terminating after the compilation is done.
  - Run `make interactive` to enable interactive, continuous compilation with real-time preview (i.e. with `-pvc`).

This will invoke `latexmk` to compile the `main.tex` file into `main.pdf`.
The output PDF will be in the same directory as the `main.tex` file.

#### Why `latexmk`?

[Latexmk](https://ctan.org/pkg/latexmk) automatically resolves dependencies and determines the number of runs needed for cross-references, glossaries, and bibliographies. 
In continuous preview mode (`-pvc`) it keeps the PDF updated as you edit your LaTeX files.

### Alternative Build

For those who prefer more control, the project includes a manual build sequence:

- Open a terminal in the project directory.
- Run the following command: `make alt-build`

This performs the following steps:

- Runs `pdflatex` to generate auxiliary files.
- Runs `biber` to process bibliographies.
- Runs `makeglossaries` to handle glossaries and acronyms.
- Performs additional `pdflatex` runs to resolve cross-references.

The output PDF will be in the same directory as the `main.tex` file.

## Cleaning Auxiliary Files

To remove temporary and auxiliary files generated during the build process (e.g., `.aux`, `.log`, `.glo`, etc.), run:

```bash
make clean
```

This command cleans both the main project directory and the content folder where additional files may reside.

## Project Structure

- `README.md`: This file.
- `main.tex`: The main LaTeX file for the document.
- `content/`: A folder containing additional chapters or sections included in the main file.
- `Makefile`: Contains build instructions for the project.
- Auxiliary files: Temporary files generated during the build process, which can be removed using `make clean`.

## Notes

Ensure that `biber` and `makeglossaries` are installed and available in your system path.

If using continuous preview mode with `latexmk` (i.e., `make interactive`), you can edit the LaTeX source files, and the PDF will automatically update.


