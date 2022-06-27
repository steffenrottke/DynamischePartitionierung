#!/bin/bash
vo_groessterblock=-1
function visualout(){
    unset vo_name
    unset vo_speicher
    unset vo_groesse
    vo_name="${save_name[@]}"
    vo_speicher="${save_speicher[@]}"
    vo_groesse="${save_groesse[@]}"
    vo_max=$gewaehlteGesamtspeichergroesse

    unset speicherout_speicher
    unset speicherout_name
    unset speicherout_groesse
    unset vo_groessterblock
    unset vo_kleinsterblock
    vo_belegterblock=0
    vo_kleinsterblock=$(($vo_max+1))

    for i in ${vo_groesse[@]}
    do
	let vo_belegterblock+=$i
    done

echo "Speicher:"
for (( i=0; i<$save_speicherplatz; i++ ))
do


    if [[ -z "${save_name[$i]}" ]]; then
	nameout[$i]="X"
    else
	nameout[$i]=${save_name[$i]}
    fi

    if [[ -z "${save_groesse[$i]}" ]]; then
	groesseout[$i]="X"
    else
	groesseout[$i]=${save_groesse[$i]}
    fi


    if [[ -z "${save_speicher[$i]}" ]]; then
	speicherout[$i]="X"
    else
	speicherout[$i]=${save_speicher[$i]}
	if [[ ${save_speicher[$i]} -gt $vo_groessterblock ]]; then
	    vo_groessterblock=${save_speicher[$i]}
	fi
	if [[ ${save_speicher[$i]} -lt $vo_kleinsterblock ]]; then
	    vo_kleinsterblock=${save_speicher[$i]}
	fi
    fi
done

if [[ $vo_kleinsterblock -eq $(($save_speicherplatz+1)) ]]; then
    unset vo_kleinsterblock
fi

echo ${speicherout[*]}
echo "++++++++++"
    echo "----------"

    echo "**********"
    echo "Gespeicherte Namen: ${nameout[*]}"
    echo "**********"

    echo "----------"
    echo "Gespeicherte Größen: ${groesseout[*]}"
    echo "----------"

    echo ""
    echo "++++++++++"
    echo "Belegung: $vo_belegterblock von $vo_max"
    echo "Anzahl belegte Blöcke: $vo_belegterblock"
    echo "Anzahl freie Blöcke: $(($vo_max-$vo_belegterblock))"
    echo "Größter Block: $vo_groessterblock"
    echo "Kleinster Block: $vo_kleinsterblock"
    echo "++++++++++"
}