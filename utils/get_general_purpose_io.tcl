# Copyright (C) 2020  The Project U-Ray Authors.
#
# Use of this source code is governed by a ISC-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/ISC
#
# SPDX-License-Identifier: ISC

create_project -force -part $::env(URAY_PART) design design
set_property design_mode PinPlanning [current_fileset]
open_io_design -name io_1

set allowed_sites [get_sites -of_objects [get_package_pins -filter "IS_GENERAL_PURPOSE == 1"]]
set fp [open "../general_purpose_io_sites.txt" "w"]
foreach site $allowed_sites {
    puts $fp $site
}
close $fp
