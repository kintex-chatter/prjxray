# Copyright (C) 2017-2023  The Project X-Ray Authors.
#
# Use of this source code is governed by a ISC-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/ISC
#
# SPDX-License-Identifier: ISC
export FUZDIR=$(shell pwd)
PIP_TYPE?=cfg_center
PIPLIST_TCL=$(FUZDIR)/cfg_pip_list.tcl

BUILD_DIR = build
RUN_OK = run.ok

TODO_RE=".*"

MAKETODO_FLAGS=--pip-type ${PIP_TYPE} --seg-type $(PIP_TYPE) --re $(TODO_RE) --sides "mid"
N = 1

SEGMATCH_FLAGS=-c 186

A_PIPLIST=cfg_center.txt

CHECK_ARGS= --zero-entries --timeout-iters 2

include ../pip_loop.mk

#$(BUILD_DIR)/segbits_cfg_center_top.rdb: $(SPECIMENS_OK)
#	${XRAY_SEGMATCH} ${SEGMATCH_FLAGS} -o $(BUILD_DIR)/segbits_cfg_center_top.rdb \
#		$(shell find $(BUILD_DIR) -name segdata_cfg_center_top.txt)

$(BUILD_DIR)/segbits_cfg_center_mid.rdb: $(SPECIMENS_OK)
	${XRAY_SEGMATCH} ${SEGMATCH_FLAGS} -o $(BUILD_DIR)/segbits_cfg_center_mid.rdb \
		$(shell find $(BUILD_DIR) -name segdata_cfg_center_mid.txt)

RDBS = $(BUILD_DIR)/segbits_cfg_center_mid.rdb # $(BUILD_DIR)/segbits_cfg_center_top.rdb

database: ${RDBS}
#	${XRAY_DBFIXUP} --db-root $(BUILD_DIR) --zero-db bits.dbf \
#		--seg-fn-in $(BUILD_DIR)/segbits_cfg_center_top.rdb \
#		--seg-fn-out $(BUILD_DIR)/segbits_cfg_center_top.db
	${XRAY_DBFIXUP} --db-root $(BUILD_DIR) --zero-db bits.dbf \
		--seg-fn-in $(BUILD_DIR)/segbits_cfg_center_mid.rdb \
		--seg-fn-out $(BUILD_DIR)/segbits_cfg_center_mid.db

	# Keep a copy to track iter progress
#	cp $(BUILD_DIR)/segbits_cfg_center_top.rdb $(BUILD_DIR)/$(ITER)/segbits_cfg_center_top.rdb
#	cp $(BUILD_DIR)/segbits_cfg_center_top.db $(BUILD_DIR)/$(ITER)/segbits_cfg_center_top.db
	cp $(BUILD_DIR)/segbits_cfg_center_mid.rdb $(BUILD_DIR)/$(ITER)/segbits_cfg_center_mid.rdb
	cp $(BUILD_DIR)/segbits_cfg_center_mid.db $(BUILD_DIR)/$(ITER)/segbits_cfg_center_mid.db

	# Clobber existing .db to eliminate potential conflicts
	cp ${XRAY_DATABASE_DIR}/${XRAY_DATABASE}/segbits*.db $(BUILD_DIR)/database/${XRAY_DATABASE}
#	XRAY_DATABASE_DIR=$(BUILD_DIR)/database ${XRAY_MERGEDB} cfg_center_top $(BUILD_DIR)/segbits_cfg_center_top.db
	XRAY_DATABASE_DIR=$(BUILD_DIR)/database ${XRAY_MERGEDB} cfg_center_mid $(BUILD_DIR)/segbits_cfg_center_mid.db

pushdb: database
#	${XRAY_MERGEDB} cfg_center_top $(BUILD_DIR)/segbits_cfg_center_top.db
	${XRAY_MERGEDB} cfg_center_mid $(BUILD_DIR)/segbits_cfg_center_mid.db

.PHONY: database pushdb run clean
