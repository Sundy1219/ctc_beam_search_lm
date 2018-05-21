#/bin/bash
#lmplz -o 2 --prune 0 1 <text >lm.arpa
lmplz -o 2 <text >lm.arpa
build_binary lm.arpa lm.binary #build binary LM
