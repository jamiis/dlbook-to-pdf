#!/usr/bin/env bash

SITE="site"

plzinstall=" is required, please install it. Aborting."
hash wget >/dev/null 3>&1      || { echo >&2 "wget $plzinstall"; exit 1; }
hash phantomjs >/dev/null 2>&1 || { echo >&2 "phantomjs $plzinstall"; exit 1; }
hash pdftk >/dev/null 2>&1     || { echo >&2 "pdftk $plzinstall"; exit 1; }

# mirror latest website, excluding earlier drafts
rm -rf $SITE
mkdir -p $SITE
cd $SITE
echo "mirroring site"
wget --recursive \
     --level=3 \
     --convert-links \
     --page-requisites \
     --no-parent \
     --no-verbose \
     --no-host-directories \
     --exclude-directories=/version-* \
     --cut-dirs=1 \
   http://www.deeplearningbook.org/

# convert each chapter into pdfs
echo "convert chapters to pdfs"
find . -name "*.html" | while read htmlpath; do
  htmlfile="${htmlpath%.*}.html"
  pdffile="${htmlpath%.*}.pdf"
  echo "$htmlfile -> $pdffile"
  phantomjs ../rasterize.js "${htmlfile}" "$pdffile" "312mm*424mm"
done

# merge pdfs
echo "concatenating pdfs"
pdftk \
  TOC.pdf \
  acknowledgements.pdf \
  notation.pdf \
  intro.pdf \
  part_basics.pdf \
  linear_algebra.pdf \
  prob.pdf \
  numerical.pdf \
  ml.pdf \
  part_practical.pdf \
  mlp.pdf \
  regularization.pdf \
  optimization.pdf \
  convnets.pdf \
  rnn.pdf \
  guidelines.pdf \
  applications.pdf \
  part_research.pdf \
  linear_factors.pdf \
  autoencoders.pdf \
  representation.pdf \
  graphical_models.pdf \
  monte_carlo.pdf \
  partition.pdf \
  inference.pdf \
  generative_models.pdf \
  bib.pdf \
  index-.pdf \
  cat output dlbook.pdf
mv dlbook.pdf ..
cd ..
