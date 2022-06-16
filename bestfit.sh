#!/bin/bash
function insertBestFit(){
    speicherplatz=$1
    seekName=$2
    seekGroesse=$3
    summe=0 #Hier wird die Summe der belegten Speicherblöcke hinterlegt

    echo ">>>Das ist speicherplatz: $speicherplatz ;;; seekName: $seekName ;;; Das ist seekGroesse: $(($seekGroesse))"

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
	    #echo "seekCounter: $seekCounter"
            seekCounter=$((seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
    	    #seekCounter=$((seekCounter-1))
	    #return 1 #Erfolgreich -> Raus
        else
	    if [[ $seekCounter -gt 0 ]]; then
		    #echo ">>>Unterbrochen bei i: $i"
        	    pStartCalc=$(($i-$seekCounter))
		    #echo "pStartCalc: $pStartCalc"
		    pEndCalc=$(($pStartCalc+$seekCounter-1))
		    #echo "pEndClac: $pEndCalc"
		    potentialStart+=($pStartCalc)
		    #echo "potentialStart: ${potentialStart[*]}"
		    potentialEnd+=($pEndCalc)
		    #echo "potentialEnd: ${potentialEnd[*]}"
		    #echo "----------"
	            seekCounter=0
	    fi
        fi
    done

    if [[ $seekCounter -eq $speicherplatz ]]; then
	potentialStart=(0)
	potentialEnd=($speicherplatz)
    fi


    kleinsteDifferenz=$(($speicherplatz+1))
    #echo "count arr: ${#potentialStart}"
    for (( i=0; i<${#potentialStart}; i++ ))
    do
	#echo "bin drin"
	#platzGroesse=$((${potentialEnd[$i]}-${potentialStart[$i]}))
	echo "pE: ${potentialEnd[$i]} ;;; pS: ${potentialStart[$i]}"
	for (( y=${potentialEnd[$i]}; y>=${potentialStart[$i]}; y-- ))
	do
	    platzGroesse=$(($platzGroesse+1))
	done
	#echo "Das ist platzGroesse: $platzGroesse"
	if [[ $platzGroesse -ge $seekGroesse ]]; then
	    differenz=$(($platzGroesse-seekGroesse))
		#echo "Das ist differenz: $differenz"
	    if [[ $differenz -lt $kleinsteDifferenz ]]; then
		kleinsteDifferenz=$differenz
		kleinsteDifferenzStelle=${potentialStart[$i]}
		#echo ">>>: Das ist kDS: $kleinsteDifferenzStelle"
		platzGroesse=0
	    fi
	fi
    done

    counter=0
    for (( y=$kleinsteDifferenzStelle; $counter<$(($seekGroesse)); y++ ))
    do
        speicher[$y]=$(($seekGroesse))
	counter=$((counter+1))
    done
    groesse[$kleinsteDifferenzStelle]=$(($seekGroesse)) #Größe an der Stelle im Array einfügen
    name[$kleinsteDifferenzStelle]=$seekName #Name an der Stelle im Array einfügen
    counter=0

    return 1 #Erfolgreich -> Raus    return 0 #Nicht erfolgreich -> Ciao!
}


#speicherplatz=${array_gesamte_groesse} #größe des Speichers
#speicherplatz=10
unset name
unset groesse
unset speicher
unset potentialStart
unset potentialEnd

insertBestFit 10 "heyy" 2
#insertBestFit $1 $2 $3
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
echo ${speicher[*]}
echo "--------"
echo "--------"
echo "Groesse:"
echo ${groesse[*]}
echo "++++++++"
echo "++++++++"
echo "Name:"
echo ${name[*]}