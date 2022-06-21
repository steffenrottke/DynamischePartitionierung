#!/bin/bash
function unsetElement(){
    delName=$1 #Name des Elements das gelöscht werden soll
    max=$save_speicherplatz #Maximaler verfügbarer Speicherplatz (um zu wissen wie lange die Schleife laufen soll)
    for (( i=0; i<$max; i++ ))
    do
	if [[ $delName == ${save_name[$i]} ]]; then #Wenn der name an der i-ten Stelle den gleichen Namen hat wie das ges
	    save_name[$i]=
	    delSize=${save_groesse[$i]}
	    counter=1
	    for (( y=$i; $counter<=$delSize; y++ ))
	    do
		echo "Habe Stelle $y gelöscht"
		save_speicher[$y]=
		counter=$(($counter+1))
	    done
	    save_groesse[$i]=
	    return 1 #hat geklappt
	fi
    done
    return 0 #Element mit dem namen nicht gefunden
}