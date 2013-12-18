#!/bin/bash

# Represent all functions using 'memcpy' by its Callees and the types of parameters and local variables

echo -e 'Symbol\tmemcpy' | python2 ./lookup.py | awk '{print $2}' | ./funcLs.py -e | egrep '(Callee|ParameterType|IdentifierDeclType)' | awk '{ print $2 "\t" $5}' | ./demux.py -O bagOfWords
sally -n 1 --input_format=dir bagOfWords/data/ bagOfWords/embedding.libsvm --hash_file bagOfWords/feats.gz --vect_embed=tfidf

# echo 'type:Symbol AND code:memcpy' | ./lookup.py | ./function.py | awk '{print "functionId:" $1}' | ./lookup.py --complete | egrep 'type:(Callee|ParameterType|IdentifierDeclType)' | awk '{print $2}'