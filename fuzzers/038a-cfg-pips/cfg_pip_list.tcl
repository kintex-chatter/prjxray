# Copyright (C) 2017-2023  The Project X-Ray Authors
#
# Use of this source code is governed by a ISC-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/ISC
#
# SPDX-License-Identifier: ISC
proc print_tile_pips {tile_type filename} {
    set fp [open $filename w]
    set pips [dict create]
    foreach tile [get_tiles -filter "TYPE =~ $tile_type*"] {
        puts "got tile: $tile"
        foreach pip [lsort [get_pips -of_objects  $tile]] {
            puts "got pip: $pip"
            set src [get_wires -uphill -of_objects $pip]
            set dst [get_wires -downhill -of_objects $pip]
            puts "$src ==> $dst"

            # Skip pips with disconnected nodes
            set src_node [get_nodes -of_objects $src]

            puts "src_node: $src_node"

            if { $src_node == {} } {
                puts "source node no good"
                continue
            }

            set dst_node [get_nodes -of_objects $dst]
            puts "dst_node: $dst_node"
            if { $dst_node == {} } {
                puts "dst_node node no good"
                continue
            }

            if { true } {
                set pip_string "$tile_type.[regsub {.*/} $dst ""].[regsub {.*/} $src ""]"
                if ![dict exists $pips $pip_string] {
                    puts $fp $pip_string
                    dict set pips $pip_string 1
                }
            }
        }
    }
    close $fp
}

create_project -force -part $::env(XRAY_PART) design design
set_property design_mode PinPlanning [current_fileset]
open_io_design -name io_1

print_tile_pips CFG_CENTER_MID cfg_center_mid.txt
#print_tile_pips CFG_CENTER_TOP cfg_center_top.txt
