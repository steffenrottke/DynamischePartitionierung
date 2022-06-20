#!/bin/bash
function insertFirstFit(){
    save_speicherplatz=$1
    seekName=$2 #der zu speichernde Name des Prozesses
    seekGroesse=$3 #die zu speichernde Groesse des Prozesses
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

    #echo ">>>Das ist seekName: $seekName ;;; Das ist seekGroesse: $seekGroesse"

    for i in ${save_groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
	let summe+=$i
    done

    if [[ $(($summe+$(($seekGroesse)))) -gt $save_speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
	echo "zu gross bei $seekName $seekGroesse"
	return 0
    fi

    seekCounter=0 #Counter der die freien Plätze beinhaltet
    for (( i=0; i<=$save_speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
	if [[ -z "${save_speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
	    seekCounter=$(($seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
	    #echo "Bin bei $i und habe $seekCounter freie Plaetze gefunden. Speichere jetzt Wert $seekGroesse ab."
	    if [[ $seekCounter -ge $seekGroesse ]]; then #Wenn der counter der leeren Plätze größer/gleich der unterzubnrGröße 
		index=$(($i-($seekCounter-1)))
		for (( y=$index; y<$(($index+$seekGroesse)); y++ ))
		do
		    save_speicher[$y]=$seekGroesse
		done
		save_groesse[$index]=$seekGroesse #Größe an der Stelle im Array einfügen
		save_name[$index]=$seekName #Name an der Stelle im Array einfügen
		break
	    fi
	else
	    seekCounter=0
	fi
    done

#    echo "Speicher:"
#    echo ${save_speicher[*]}
#    echo "--------"
#    echo "--------"
#    echo "Groesse:"
#    echo ${save_groesse[*]}
#    echo "++++++++"
#    echo "++++++++"
#    echo "Name:"
#    echo ${save_name[*]}
    return 1 #Erfolgreich -> Ciao!
}