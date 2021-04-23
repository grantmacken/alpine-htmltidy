#!/bin/sh -l

cat - | \
  tidy \
  --quiet yes \
  --tidy-mark no \
  --indent auto \
  --show-errors 0 \
  --show-warnings no \
  --show-info no \
  --output-xml yes

exit 0

