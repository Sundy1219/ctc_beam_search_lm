#!/bin/bash
#This is just an example compilation.  You should integrate these files into your build system.  Boost jam is provided and preferred.

echo You must use ./bjam if you want language model estimation, filtering, or support for compressed files \(.gz, .bz2, .xz\) 1>&2

rm {lm,util}/*.o 2>/dev/null
set -e

CXX=${CXX:-g++ -Wall -std=c++11}

CXXFLAGS+=" -I. -O2 -DNDEBUG -DKENLM_MAX_ORDER=6"

echo "${#NPLM}"
#If this fails for you, consider using bjam.
if [ ${#NPLM} != 0 ]; then
  CXXFLAGS+=" -DHAVE_NPLM -lneuralLM -L$NPLM/src -I$NPLM/src -lboost_thread-mt -fopenmp"
  ADDED_PATHS="lm/wrappers/*.cc"
fi
echo 'Compiling with '$CXX $CXXFLAGS

#Grab all cc files in these directories except those ending in test.cc or main.cc
objects=""
for i in scorer.cpp util/double-conversion/*.cc util/*.cc lm/*.cc $ADDED_PATHS; do
  if [ "${i%test.cc}" == "$i" ] && [ "${i%main.cc}" == "$i" ]; then
    $CXX $CXXFLAGS -c $i -o ${i%.cc}.o
    objects="$objects ${i%.cc}.o"
  fi
done

#mkdir -p bin
if [ "$(uname)" != Darwin ]; then
  CXXFLAGS="$CXXFLAGS -lrt"
fi
#$CXX lm/build_binary_main.cc $objects -o bin/build_binary $CXXFLAGS $LDFLAGS
$CXX ctc_beam_search_decoder.cpp $objects -o ctc_beam_search_decoder $CXXFLAGS $LDFLAGS
#$CXX lm/query_main.cc $objects -o bin/query $CXXFLAGS $LDFLAGS
