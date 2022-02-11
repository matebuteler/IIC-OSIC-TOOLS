#!/bin/bash
#

########################################################
###### Magic netlist extraction
########################################################

export MAGIC=magic
export PDKPATH=$PDK_ROOT/sky130A ; 
export MAGTYPE=$2

$MAGIC -dnull -noconsole -rcfile $PDKPATH/libs.tech/magic/sky130A.magicrc  << EOF

path
drc off
load $1  
flatten $1_flat
load $1_flat
select top cell
extract do local
extract all
ext2spice lvs
	    
ext2spice -o ${MAGTYPE}-extracted-${1%.mag}.spice

EOF

#########

\rm *.ext