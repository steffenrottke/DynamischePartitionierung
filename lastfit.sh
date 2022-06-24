#!/bin/bash
function insertLastFit(){
    save_speicherplatz=$1
    seekName=$2 #der zu speichernde Name des Prozesses
    seekGroesse=$3 #die zu speichernde Groesse des Prozesses
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

    for i in ${save_groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
	let summe+=$i
    done

    if [[ $(($summe+$(($seekGroesse)))) -gt $save_speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
	echo "zu gross bei $seekName $seekGroesse"
	return 0
    fi

    seekCounter=0 #Counter der die freien Plätze beinhaltet
    for (( i=$(($save_speicherplatz-1)); i>=0; i-- )) #Schleife in der Größe des Speicherplatzes
    do
	if [[ -z "${save_speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
	    seekCounter=$(($seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
	    if [[ $seekCounter -ge $seekGroesse ]]; then #Wenn der counter der leeren Plätze größer/gleich der unterzubnrGröße
		index=$(($i+$seekGroesse-1))
		LFCounter=1
		for (( y=$index; $LFCounter<=$seekGroesse; y--)) #Schleife von hinten durchlaufen
		do
		    save_speicher[$y]=$seekGroesse
		    LFCounter=$((LFCounter+1))
		done
		save_groesse[$index]=$seekGroesse #Größe an der Stelle im Array einfügen
		save_name[$index]=$seekName #Name an der Stelle im Array einfügen
		break
	    fi
	else
	    seekCounter=0
	fi
    done
    return 1
}