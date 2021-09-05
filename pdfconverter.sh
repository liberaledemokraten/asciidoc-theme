#!bin/bash
#titel                  : pdfconverter.sh
#beschreibung           : Dieses Skript erstellt eine PDF Datei aus einer AsciiDoc Datei mit Hilfe der ld-theme.
#autor                  : Kasim Dönmez
#datum                  : 20210905
#version                : 5.0
#nutzweise              : bash pdfconverter.sh document.adoc
#bemerkungen            : Installiere `bash` und `asciidoctor-pdf` um dieses Skript auszuführen.
#                         Der Dateipfad des Eingabedokumentes darf relativ zum Verzeichnis sein,
#                         in dem das Skript ausgeführt wurde.
#
#abhängigkeiten:
#asciidoctor_version    : 2.0
#asciidoctor-pdf_version: 1.5
#ruby_version           : 2.6
#==============================================================================

__version="$0
Autor   : Kasim Dönmez
Version : 5.0
Datum   : 20210905"
__usage="Nutzweise: bash $0 document.adoc [Optionen]

Optionen:
  -b | --braille
    Nutze das inklusive (braille) Thema für Personen mit Sehbehinderungen

  -c | --colored
    Nutze das bunte (colored) Thema mit orangenem Cover

  --compass
    Nutze das Thema mit einem bunten Kompass im Cover

  -f=document.adoc | --filename=document.adoc
    Konvertiere das Dokument 'document.adoc'
	
  -h | --help
    Zeige diesen Hilfstext zur Nutzweise

  -v | --version
    Zeige Versionsinformationen

Info: Per Default wird das schlichte (plain) Thema genutzt
Achtung: zuletzt eingegebene Optionen können vorige Argumente ersetzen

$__version"

if [ $# -eq 0 ]
  then
    echo "Fehler: Keine AsciiDoc Datei spezifiziert."
	echo "$__usage"
	exit
fi
filename=$1
theme="ld-theme_plain.yml"

for i in "$@"
do
case $i in
  -b|--braille)
  theme="ld-theme_braille.yml"
  ;;
  -c|--colored)
  theme="ld-theme_colored.yml"
  ;;
  --compass)
  theme="ld-theme_compass.yml"
  ;;
  -f=*|--filename=*)
  filename="${i#*=}"
  ;;
  -h|--help)
  echo "$__usage"
  exit
  ;;
  -v|--version)
  echo "$__version"
  exit
  ;;
esac
done

echo "Konvertiere "$filename" in PDF mit "$theme

pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do cd `dirname "$SCRIPT_PATH"`; SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

asciidoctor-pdf -a pdf-theme=$SCRIPT_PATH/$theme -a pdf-fontsdir=$SCRIPT_PATH/fonts/ $filename
