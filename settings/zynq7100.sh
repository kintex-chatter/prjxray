# Copyright (C) 2017-2024  The Project X-Ray Authors.
#
# Use of this source code is governed by a ISC-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/ISC
#
# SPDX-License-Identifier: ISC
export XRAY_DATABASE="zynq7"
export XRAY_PART="xc7z100ffg1156-1"
export XRAY_ROI_FRAMES="0x00000000:0xffffffff"

# All CLB's in part, all BRAM's in part, all DSP's in part.
# This is the whole area of the device
export XRAY_ROI_TILEGRID="SLICE_X0Y0:SLICE_X213Y349 RAMB18_X0Y0:RAMB18_X11Y139 RAMB36_X0Y0:RAMB36_X11Y69 DSP48_X0Y0:DSP48_X14Y139"

export XRAY_EXCLUDE_ROI_TILEGRID=""

# left side has IOI3, right side doesn't
export XRAY_IOI3_TILES="LIOI3_X0Y9"
# This seems also very arbitrary? Value set according to 7010/7020
export XRAY_PS7_INT="INT_L_X18Y300"

# These settings must remain in sync
# This is a subset of XRAY_ROI_TILEGRID, maybe one bank. 
# Just using full device here w/o optimization
export XRAY_ROI="SLICE_X0Y0:SLICE_X213Y349 RAMB18_X0Y0:RAMB18_X11Y139 RAMB36_X0Y0:RAMB36_X11Y69 DSP48_X0Y0:DSP48_X14Y139 IOB_X0Y0:IOB_X0Y249 IOB_X1Y200:IOB_X1Y349"

# This is the "Colume:" and "Row:" as shown in Vivado Tile Properties, using full device
export XRAY_ROI_GRID_X1="0"
export XRAY_ROI_GRID_X2="352"
export XRAY_ROI_GRID_Y1="1"
export XRAY_ROI_GRID_Y2="363"

source $(dirname ${BASH_SOURCE[0]})/../utils/environment.sh

env=$(python3 ${XRAY_UTILS_DIR}/create_environment.py)
ENV_RET=$?
if [[ $ENV_RET != 0 ]] ; then
	return $ENV_RET
fi
eval $env
