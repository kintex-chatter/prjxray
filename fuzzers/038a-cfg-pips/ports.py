#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (C) 2017-2023  The Project X-Ray Authors.
#
# Use of this source code is governed by a ISC-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/ISC
#
# SPDX-License-Identifier: ISC

ports = {
    # has no inputs
    #"EFUSE_USR": [
    #    # ("EFUSEUSR", 32), # Output
    #],
    "DNA_PORT": [
        ("CLK",   1),
        ("DIN",   1),
        # ("DOUT",  1), # Output
        ("READ",  1),
        ("SHIFT", 1),
    ],
    "ICAPE2": [
        ("CLK",   1),
        ("CSIB",  1),
        ("I",    32),
        # ("O",    32), # Output
        ("RDWRB", 1),
    ],
    "BSCANE2": [
        # ("CAPTURE", 1), # Output
        # ("DRCK",    1), # Output
        # ("RESET",   1), # Output
        # ("RUNTEST", 1), # Output
        # ("SEL",     1), # Output
        # ("SHIFT",   1), # Output
        # ("TCK",     1), # Output
        # ("TDI",     1), # Output
        ("TDO",     1),
        # ("TMS",     1), # Output
        # ("UPDATE",  1), # Output
    ],
    "DCIRESET": [
        # ("LOCKED", 1), # Output
        ("RST",    1),
    ],
    "CAPTUREE2": [
        ("CAP",   1),
        ("CLK",   1),
    ],
    "STARTUPE2": [
        # ("CFGCLK",    1), # Output
        # ("CFGMCLK",   1), # Output
        ("CLK",       1),
        # ("EOS",       1),
        ("GSR",       1),
        ("GTS",       1),
        ("KEYCLEARB", 1),
        ("PACK",      1),
        # ("PREQ",      1), # Output
        ("USRCCLKO",  1),
        ("USRCCLKTS", 1),
        ("USRDONEO",  1),
        ("USRDONETS", 1),
    ],
    # has no inputs
    #"FRAME_ECCE2": [
    #    # ("CRCERROR",       1), # Output
    #    # ("ECCERROR",       1), # Output
    #    # ("ECCERRORSINGLE", 1), # Output
    #    # ("FAR",           26), # Output
    #    # ("SYNBIT",         5), # Output
    #    # ("SYNDROME",      13), # Output
    #    # ("SYNDROMEVAL ID", 1), # Output
    #    # ("SYNWORD",        7), # Output
    #],
    # has no inputs
    #"USR_ACCESSE2": [
    #    # ("CFGCLK",    1), # Output
    #    # ("DATA",     32), # Output
    #    # ("DATAVALID", 1), # Output
    #],
}
