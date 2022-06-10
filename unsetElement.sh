#!/bin/bash

function unsetElement(){
    delName=$1 #Name des Elements das gelöscht werden soll
    max=$speicherplatz #Maximaler verfügbarer Speicherplatz (um zu wissen wie lange die Schleife laufen soll)
    for (( i=0; i<$max; i++ ))
    do
	if [[ $delName == ${name[$i]} ]]; then #Wenn der name an der i-ten Stelle den gleichen Namen hat wie das ges
	    name[$i]=
	    #groesse[$i]=
	    delSize=${groesse[$i]}
	    counter=1
	    for (( y=$i; $counter<=$delSize; y++ ))
	    do
		echo "Habe stelle $y gelöscht"
		speicher[$y]=
		counter=$((counter+1))
	    done
	    groesse[$i]=
	    #name und groesse unsetten
	    return 1 #hat geklappt
	fi
    done
    return 0 #Element mit dem namen nicht gefunden