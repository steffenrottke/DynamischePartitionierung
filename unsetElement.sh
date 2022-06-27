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
		    save_speicher[$y]=
		    counter=$(($counter+1))
    		done
    		save_groesse[$i]=
    		return 1
	    fi
	done
    echo "Das Element mit dem Namen $delName konnte nicht gefunden werden!" #Sofern das Element nicht gefunden wurde kommt diese Ausgabe
    return 0
}