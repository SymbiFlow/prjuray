#!/bin/bash
# Copyright (C) 2017-2020  The Project X-Ray Authors.
# Copyright (C) 2020  The Project U-Ray Authors.
#
# Use of this source code is governed by a ISC-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/ISC
#
# SPDX-License-Identifier: ISC

source $URAY_GENHEADER
echo '`define SEED 32'"'h$(echo $1 | md5sum | cut -c1-8)" > setseed.vh

# Some projects have hard coded top.v, others are generated
if [ -f $FUZDIR/top.py ] ; then
    set +e
    python3 $FUZDIR/top.py >top.v
    RET=$?
    set -e
    if [ $RET -ne 0 ]; then
        rm top.v
    fi
    exit $RET
fi

