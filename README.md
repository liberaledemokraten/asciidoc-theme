# LD AsciiDoc Theme

## General Infos
This is a repository containing several themes to be used with [Asciidoctor PDF](https://github.com/asciidoctor/asciidoctor-pdf). An in-depth theming guide can be found in the [Asciidoctor PDF Theming Guide](https://github.com/asciidoctor/asciidoctor-pdf/blob/v1.5.4/docs/theming-guide.adoc).

Following themes are part of this repository:

* Plain ([ld-theme_plain.yml](ld-theme_plain.yml)) - a theme with a plain title cover without a background image
* Colored  ([ld-theme_colored.yml](ld-theme_colored.yml)) - a theme with a colored title cover
* Compass ([ld-theme_compass.yml](ld-theme_compass.yml)) - a theme with a colored compass on its title cover
* Compass-2 ([ld-theme_compass-2.yml](ld-theme_compass-2.yml)) - a plain theme with a compass on its title cover
* Braille ([ld-theme_braille.yml](ld-theme_braille.yml)) - a plain theme with Atkinson Hyperlegible as font and a larger font size

## Sample PDF Files
Some sample PDF files (in German) can be found in the below links:

* [Sample Plain PDF](https://cloud.liberale-demokraten.de/s/HnCkzp4XrBMo6mw)
* [Sample Colored PDF](https://cloud.liberale-demokraten.de/s/rGLBJ37AYC4ptNr)
* [Sample Compass PDF](https://cloud.liberale-demokraten.de/s/yrrBcJSMMM7oiAe)
* [Sample Compass-2 PDF](https://cloud.liberale-demokraten.de/s/MgFDLEZ85ff7raf)
* [Sample Braille PDF](https://cloud.liberale-demokraten.de/s/WBmjN3PrrfmS63Z)
* [Sample Plain Article PDF](https://cloud.liberale-demokraten.de/s/6pmLoz3x2bexBH7)

NOTE: The images and logos displayed in the linked PDFs may be protected, trademarked or otherwise copyrighted. Therefore, they also aren't covered by the license of this project itself.

## Requirements

* [Asciidoctor[(https://asciidoctor.org/)
* Asciidoctor PDF
* Bash (for [pdfconverter.sh](pdfconverter.sh))

## Installation
The installation of the theme is quite straightforward. Just clone this repository locally in a folder or download it as ZIP and unzip it. That's it. However, the above requirements should also be met for the theme to be used.

### Linux Users
Simply install `asciidoctor` and `asciidoctor-pdf` with your distribution's package manager (e.g. `apt-get`). Should that not work for you, install `ruby` and call `gem install asciidoctor` and `gem install asciidoctor-pdf` in the shell.

### Windows Users
For ruby users, this might be a bit trickier. Here, you can start by installing the [RubyInstaller](https://rubyinstaller.org) and then run `gem install asciidoctor` and `gem install asciidoctor-pdf` in the shell (e.g. PowerShell). To run the `pdfconverter.sh` script, you may need to install [Cygwin](httpw://cygwin.com). Alternatively, use a Linux distribution on your Windows machine using WSL, e.g. [Debian for WSL](https://www.microsoft.com/en-us/p/debian/9msvkqc78pk6) and proceed as described above for Linux users.

### Usage
The classic usage (without `pdfconverter.sh`) is pretty straightforward as it is. Just call the following on your shell:

```sh
$ asciidoctor-pdf -a pdf-theme=ld-theme_plain.yml -a pdf-fontsdir=fonts/ document.adoc
```

The output will be `document.pdf` in the same direcotry.

However, with the `pdfconverter.sh` script, the usage is slightly easier:

```sh
$ bash pdfconverter.sh document.adoc
```

The above line equals to the same as the first example. With the script however, you can also easily specify which theme to use with that bash script:

```
Usage: bash pdfconverter.sh document.adoc [options]

options:
  -b | --braille
    Use the more accessible (braille) theme

  -c | --colored
    Use the colored theme

  --compass
    Use the compass theme

  -f=document.adoc | --filename=document.adoc
    convert the file 'document.adoc'
	
  -h | --help
    show usage (in German) and exit

NOTE: The plain theme is set as the default theme. You can however also add a '-p' for it if you wish so.
CAUTION: The latest option may overwrite previously entered ones.
```

## Writing an AsciiDoc
The themes are to be used to generate PDFs from AsciiDoc files. AsciiDoc files are just plaintext files written with the AsciiDoc syntax, slightly similar to but not the same as markdown. The sample `.adoc` files within this repository are written in AsciiDoc. You may find further information within the [AsciiDoc Quick Reference](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/).

## Authors
These themes and the shell script were written by [Kasim Dönmez](https://github.com/mkasimd) on behalf of the Liberale Demokraten - Die Sozialliberalen.

## Copyright
Copyright © 2020 - present Liberale Demokraten - Die Sozialliberalen. Free use of this theme and the bash script is granted under the terms of the MIT license. For the full text of the license, see the [LICENSE](LICENSE.txt) file. All documents such as adoc and PDF files with the exception of the software documentation and the software itself are licensed under [CC BY-SA 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/). Please note that some resources such as images and fonts, if present, might be licensed under different terms and be otherwise copyrighted or trademarked.

The use of the resources provided by this project shall be done in a way that your modifications to the code, distribution thereof or use of the provided files does not imply any endorsement by the authors or copyright holders of this project. You shall not use this project or contents thereof in the name of the authors or copyright holders unless explicitly permitted.
