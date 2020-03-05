#!/bin/bash

HOMEPWNDIR="/app/HomePWN/"

source $HOMEPWNDIR/homePwn/bin/activate

python3 $HOMEPWNDIR/homePwn.py $@
