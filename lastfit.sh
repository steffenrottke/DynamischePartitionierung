#!/bin/bash

function insertLastFit(){
    seekName=${array_name_groesse[0]} #der zu speichernde Name des Prozesses
    seekGroesse=${array_name_groesse[1]} #die zu speichernde Groesse des Prozesses
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt
    speicherplatz=$((${array_gesamte_groesse[0]})) #größe des Speichers

	echo ""
	echo ""
	echo "Speicher:"
	echo ${speicher[*]}
	echo "--------"
	echo "--------"
	echo "Groesse:"
	echo ${seekGroesse[*]}
	echo "++++++++"
	echo "++++++++"
	echo "Name:"
	echo ${seekName[*]}

    for i in ${groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
	let summe+=$i #Array Inhalte addieren um die derzeitige Füllung herauszufinden
    done
    if [[ $((summe+$(($seekGroesse)))) -gt $speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
	return 0
    fi
    seekCounter=0 #Counter der die freien Plätze beinhaltet
    for (( i=$speicherplatz; i>=0; i-- )) #Schleife in der Größe des Speicherplatzes
    do
	if [[ -z "${groesse[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
	    seekCounter=$((seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
	    if [[ $seekCounter -ge $(($seekGroesse)) ]]; then #Wenn der counter der leeren Plätze größer/gleich der unterzubnrGröße 
		index=$(($i-($seekCounter-1)))
		groesse[$index]=$(($seekGroesse)) #Größe an der Stelle im Array einfügen
		name[$index]=$seekName #Name an der Stelle im Array einfügen
		return 1 #Erfolgreich -> Raus
	    fi
	fi
    done
    return 0 #Nicht erfolgreich -> Ciao!
}
