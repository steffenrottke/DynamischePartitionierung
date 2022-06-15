#!/bin/bash


#Prüfen ob legitime größe
#Prüfen ob überhaupt fittend
#Leere Array stellen zählen und startindex in ein array packen
#Dieses Array als potentielle Zufallswerte verwenden
#Eines davon auswählen
#Abspeichern von seekName, seekGroesse und Speicher
function insertRandomFit(){
    #seekName=$1 #der zu speichernde Name des Prozesses
    #seekGroesse=$2 #die zu speichernde Groesse des Prozesses
    seekName=${array_name_groesse[0]}
    seekGroesse=${array_name_groesse[1]}
    speicherplatz=$((${array_gesamte_groesse[0]}))
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt
    unset bereiche

    echo ">>>Das ist seekName: $seekName ;;; Das ist seekGroesse: $(($seekGroesse))"

    for i in ${groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
    let summe+=$i
    done

    if [[ $((summe+$(($seekGroesse)))) -gt $speicherplatz ]]; then #Wenn die Füllung+neue Zuweisung die Speicherkapazität überschreiten -> Abbrechen
    echo "zu gross bei $seekName $(($seekGroesse))"
    return 0
    fi

    seekCounter=0 #Counter der die freien Plätze beinhaltet
    bereicheStelle=0
    for (( i=0; i<$speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
    if [[ -z "${speicher[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
        seekCounter=$((seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
        if [[ $seekCounter -ge $(($seekGroesse)) ]]; then #Wenn der counter der leeren Plätze größer/gleich der unterzubnrGröße 
	#Freier Bereich gefunden -> Abspeichern
	bereiche[$bereicheStelle]=$(($i-($seekCounter-1))) #Start vom freien Bereich
	bereicheStelle=$((bereicheStelle+1)) #Bereiche-Array+1
	#seekCounter=0
	seekCounter=$((seekCounter-1))
	#return 1 #Erfolgreich -> Raus
        fi
    else
        seekCounter=0
    fi
    done
    bbereiche=${#bereiche[@]}
    echo "bbreiche: $bbereiche"
    if [[ $bbereiche -ne 0 ]]; then
	iindex=$(($RANDOM % $bbereiche))
	echo "iindex: $iindex"
	startAt=${bereiche[$iindex]}
	echo "startAt: $startAt"
	counter=0
	for (( y=$startAt; counter<$(($seekGroesse)); y++ ))
	do
	    speicher[$y]=$(($seekGroesse))
	counter=$((counter+1))
	echo "counter: $counter"
	done
	groesse[$startAt]=$(($seekGroesse)) #Größe an der Stelle im Array einfügen
	name[$startAt]=$seekName #Name an der Stelle im Array einfügen
	counter=0
	fi
    return 1 #Erfolgreich -> Raus    return 0 #Nicht erfolgreich -> Ciao!
}


#speicherplatz=${array_gesamte_groesse} #größe des Speichers
#speicherplatz=10
echo ">>>Speicherplatz: $speicherplatz"
unset name
unset groesse
unset speicher
unset bereiche

echo "+++++++++"
insertRandomFit "HALLOWELT" 1
echo "+++++++++"
echo "+++++++++"
insertRandomFit "NEUEWELT" 3
echo "+++++++++"
insertRandomFit "3Stelle" 5

echo "--------"
echo "Bereiche:"
echo ${bereiche[*]}
echo "--------"
echo "Speicher:"
unset $speicherout
for (( i=0; i<$speicherplatz; i++ ))
do
    if [[ -z "${speicher[$i]}" ]]; then
	$speicherout[$i]="X"
    else
	$speicherout[$i]=${speicher[$i]}
    fi
done
#echo ${speicher[*]}
echo "--------"
echo "--------"
echo "Groesse:"
echo ${groesse[*]}
echo "++++++++"
echo "++++++++"
echo "Name:"
echo ${name[*]}