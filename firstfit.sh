#!/bin/bash
function insertFirstFit(){
    save_speicherplatz=$1
    seekName=$2 #der zu speichernde Name des Prozesses
    seekGroesse=$3 #die zu speichernde Groesse des Prozesses
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

    for i in ${save_groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
	let summe+=$i
    done

    if [[ $(($summe+$(($seekGroesse)))) -gt $save_speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
        echo "Der Wert zu $seekName (Größe $(($seekGroesse))) ist zu groß für den verfügbaren Speicherplatz!"
	return 0
    fi

    seekCounter=0 #Counter der die freien Plätze beinhaltet
    for (( i=0; i<=$save_speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
	if [[ -z "${save_speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
    	    seekCounter=$(($seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
    	    if [[ $seekCounter -ge $seekGroesse ]]; then #Wenn der Counter der leeren Plätze größer/gleich der zu Speichernden Größe ist
		index=$(($i-($seekCounter-1))) #Startposition festlegen
		for (( y=$index; y<$(($index+$seekGroesse)); y++ )) #Die Schleife X-Mal durchlaufen (größenabhängig)
		do
		    save_speicher[$y]=$seekGroesse #$seekGroesse in das Array einfügen
		done
		save_groesse[$index]=$seekGroesse #Größe an der Stelle $index im Array einfügen
		save_name[$index]=$seekName #Name an der Stelle $index im Array einfügen
		break
    	    fi
	    else
    		seekCounter=0 #Counter resetten
	fi
    done
    return 1
}