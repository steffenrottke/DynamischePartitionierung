#!/bin/bash
echo "#################################################################"
echo "./ausgabe_von_test10.sh"
date
echo "#################################################################"
echo
Speicherplatz=128 #groesse des Speichers

#Schleife in der Groesse des Speicherplatzes
    for (( i=0; i<$Speicherplatz; i++ ))
    do
		groesse[$i]=" " #Groesse an der Stelle im Array einfügen
	done
#	for (( i=0; i<$Speicherplatz-350; i++ ))
#	do
#	if [ $i -gt 1 ]; then groesse[$i]="3" ; fi #Groesse an der Stelle im Array einfügen
#	done
#
#	unset groesse
	echo "unset groesse - Das mit leeren \" \" Inhalten gefuellen Array 'grosse' wurde geleert"

#Schleife in der Größe des Speicherplatzes = auch die maximale Anzahl der Partionen
#(innerhalb dieses Testszenario wird von einer 1:1 Beziehung ausgegangen)
    for (( i=0; i<$Speicherplatz; i++ )) 
    do
		name[$i]=" " #Groessße an der Stelle im Array einfügen
    done
#	unset name
	echo "unset name - Das mit leeren \" \" Inhalten gefuellen Array 'name' wurde geleert"



#name=(EINS DREI FUENF VIER SECHS SIEBEN ACHT NEUN ZWO)
#name=(EINS   FUENF VIER)
name[0]="EINS"   #Stelle im Array setzen
#name[0]=" "   #Stelle im Array setzen
#<<xxx
name[1]="DREI"   #Stelle im Array setzen
name[1]=" "   #Stelle im Array setzen

name[2]="FUENF"  #Stelle im Array setzen
#name[2]=" "  #Stelle im Array setzen

name[3]="VIER"   #Stelle im Array setzen
#name[3]=" "   #Stelle im Array setzen

name[4]="SECHS"  #Stelle im Array setzen
#name[4]=" "  #Stelle im Array setzen

name[5]="SIEBEN" #Stelle im Array setzen
name[5]=" " #Stelle im Array setzen

name[6]="ACHT"   #Stelle im Array setzen
#name[6]=" "   #Stelle im Array setzen

name[7]="NEUN"   #Stelle im Array setzen
name[7]=" "   #Stelle im Array setzen

name[8]="ZWO"    #Stelle im Array setzen
name[8]=" "    #Stelle im Array setzen

name[9]="ELF"  #Stelle im Array setzen
name[9]=" "  #Stelle im Array setzen

name[10]="SECHZEHN"    #Stelle im Array setzen
name[10]=" "    #Stelle im Array setzen
#xxx


#groesse=($speicherplatz)
#groesse=(1       5 5 5 5 5 4 4 4 4                                                                                        )
#groesse=(1 3 3 3 5 5 5 5 5 4 4 4 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
#groesse=(1       5 5 5 5 5 4 4 4 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# Hier werden die Partionen in der Einheitgröße (1 MB = 1 Stelle) im Array belegt

groesse[0]="1"  #Stelle im Array setzen
groesse[1]="1"  #Stelle im Array setzen
groesse[2]="1"  #Stelle im Array setzen
groesse[3]=" "  #Stelle im Array setzen
groesse[4]=" "  #Stelle im Array setzen
groesse[5]=" "  #Stelle im Array setzen
groesse[6]=" "  #Stelle im Array setzen
groesse[7]="5"  #Stelle im Array setzen
groesse[8]="5"  #Stelle im Array setzen
groesse[9]="5"  #Stelle im Array setzen
groesse[10]="5" #Stelle im Array setzen
groesse[11]="5" #Stelle im Array setzen
groesse[12]="4" #Stelle im Array setzen
groesse[13]="4" #Stelle im Array setzen
groesse[14]="4" #Stelle im Array setzen
groesse[15]="6" #Stelle im Array setzen
groesse[16]="6" #Stelle im Array setzen
groesse[17]="6" #Stelle im Array setzen
groesse[18]="6" #Stelle im Array setzen
groesse[19]="6" #Stelle im Array setzen
groesse[20]="6" #Stelle im Array setzen
groesse[21]="6" #Stelle im Array setzen
groesse[22]="6" #Stelle im Array setzen
groesse[23]="6" #Stelle im Array setzen
groesse[24]="6" #Stelle im Array setzen
groesse[25]=" " #Stelle im Array setzen
groesse[26]=" " #Stelle im Array setzen
groesse[27]=" " #Stelle im Array setzen
groesse[28]="8" #Stelle im Array setzen
groesse[29]="8" #Stelle im Array setzen
groesse[30]=" " #Stelle im Array setzen
groesse[31]=" " #Stelle im Array setzen
groesse[32]=" " #Stelle im Array setzen
groesse[33]=" " #Stelle im Array setzen
groesse[34]=" " #Stelle im Array setzen
#yyy
#[...]
#groesse[127]="128" #Stelle im Array setzen


Part_wechsel_new=${groesse[0]}
echo "Part_wechsel_new = "$Part_wechsel_new
echo
echo "ArrayAll   = "${groesse[*]}
echo
echo "ArrayPos  0 = "${groesse[0]}
echo "ArrayPos  1 = "${groesse[1]}
echo "ArrayPos  2 = "${groesse[2]}
echo "ArrayPos  3 = "${groesse[3]}
echo "ArrayPos  4 = "${groesse[4]}
echo "ArrayPos  5 = "${groesse[5]}
echo "ArrayPos  6 = "${groesse[6]}
echo "ArrayPos  7 = "${groesse[7]}
echo "ArrayPos  8 = "${groesse[8]}
echo "ArrayPos  9 = "${groesse[9]}
echo "ArrayPos 10 = "${groesse[10]}
echo "ArrayPos 11 = "${groesse[11]}
echo "ArrayPos 12 = "${groesse[12]}
echo "ArrayPos 13 = "${groesse[13]}
echo "ArrayPos 14 = "${groesse[14]}
echo "ArrayPos 15 = "${groesse[15]}
echo "ArrayPos 16 = "${groesse[16]}
echo "ArrayPos 17 = "${groesse[17]}
echo "ArrayPos 18 = "${groesse[18]}
echo "ArrayPos 19 = "${groesse[19]}
echo "ArrayPos 20 = "${groesse[20]}
echo "ArrayPos 21 = "${groesse[21]}
echo "ArrayPos 22 = "${groesse[22]}
echo "ArrayPos 23 = "${groesse[23]}
echo "ArrayPos 24 = "${groesse[24]}
echo "ArrayPos 25 = "${groesse[25]}
echo "ArrayPos 26 = "${groesse[26]}
echo "ArrayPos 27 = "${groesse[27]}
echo "ArrayPos 28 = "${groesse[28]}
echo "ArrayPos 29 = "${groesse[29]}
echo "ArrayPos 30 = "${groesse[30]}
echo "ArrayPos 31 = "${groesse[31]}
echo "ArrayPos 32 = "${groesse[32]}
echo "ArrayPos 33 = "${groesse[33]}
echo "ArrayPos 34 = "${groesse[34]}
echo "ArrayPos 35 = "${groesse[35]}
echo "ArrayPos 36 = "${groesse[36]}
echo "ArrayPos 37 = "${groesse[37]}
echo "ArrayPos 38 = "${groesse[38]}
echo "ArrayPos 39 = "${groesse[39]}
echo "[...]"
echo "ArrayPos 40 = "${groesse[40]}
echo "ArrayPos 127 = "${groesse[127]}


####################################################################################################################
### Bis hier (sind/werden) die Simulationsdaten fuer die Testverarbeitung angelegt #################################
####################################################################################################################
### Ab hier folgt das Program (zusätzlich werden hier debugging-Ausgaben generiert) ################################
####################################################################################################################


# Hier wird ermittelt mit wie vielen Partitione(Bloecken) aktuelle der Seicher belegt ist
echo "the array [ name ] contains ${#name[@]} elements"



echo ${name[*]} > Liste.namen 
echo ${groesse[*]} > Liste.groess


#<comment
# Beginn
for i in ${groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
#	let summe+=$i #Array Inhalte addieren um die derzeitige Füllung herauszufinden
	let summe=$summe+1 #Array Inhalte addieren um die derzeitige Füllung herauszufinden
    done
	echo "Summe_akt_belegt_Speicher_a:" $summe
	summe=0
	echo
# Ende
# Beginn
for i in ${groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
#	let summeSpeicherplatz+=$i #Array Inhalte addieren um die derzeitige Füllung herauszufinden
	let summeSpeicherplatz=$summeSpeicherplatz+1 #Array Inhalte addieren um die derzeitige Füllung herauszufinden
    done
	echo "Summe_akt_belegt_Speicher_a:" $summeSpeicherplatz
	summe=0
	echo



#Schleife in der Groesse des Speicherplatzes
    echo
	for (( i=0; i<$Speicherplatz; i++ ))
    do
		ArrayfreiBloecke_size[$i]=" " # Array wird in seiner Struktur erstellt
    done
#	unset ArrayfreiBloecke # alle Positionsinhalte im Array werden geloescht
	echo "unset ArrayfreiBloecke - Das mit leeren \" \" Inhalten gefuellen Array 'ArrayfreiBloecke' wurde geleert"
	echo

#
    for (( i=0; i<$Speicherplatz; i++ )) 
    do
		ArraybelegteBloecke_size[$i]=" " # Array wird in seiner Struktur erstellt
    done
#	unset ArraybelegteBloecke # alle Positionsinhalte im Array werden geloescht
	echo "unset ArraybelegteBloecke - Das mit leeren \" \" Inhalten gefuellen Array 'ArraybelegteBloecke' wurde geleert"
	echo


	g_old=${groesse[0]}

	echo "186 - Anzahl der Inhalt von \$groesse :"${#groesse[@]}
	
#	for ((i=0; i<=${#groesse[@]}; i=i+1))
	for ((i=0; i<=$Speicherplatz; i=i+1))
		do
	if [[ $g_old  -eq "${groesse[$i]}" ]]
		then
			echo "Schleife_a : "$i
			let inc_gross=$inc_gross+1
		else [[ $g_old  -ne "${groesse[$i]}" ]]
			Ay_size=$Ay_size" "$inc_gross
			inc_gross=1
			g_old=${groesse[$i]}
			echo "Schleife_b : "$i
			echo "g_old :"$g_old

		fi
    done
echo
# Da die aktuelle Zaehlung noch Fragmente und Partionen beinhaltet,
# werden fuer die spaetere Berechnung der Belegungs- und Mengenangaben an zwei Array ('a' & 'b') uebergeben
	echo "Inhalt von \$Ay_size :"$Ay_size
    Array_size_a=($Ay_size) # Fragmente und Partionen
    Array_size_b=($Ay_size) # In nachfolgender Routine werden Fragmente geloescht und Partionen beibehalten
	

echo "355 Bildschirmausgabe der bearbeiteten Array fuer die spaetere Qualifizierung der Partitionen (Farbzuordung/Voluminas)"
echo
	for ((i=0; i<=14; i=i+1)) 
		do
		if [ $i = 0 ]; then echo "Bildschirmausgabe der groessten Partionen/Block in ArrayPos NAME"; fi
		echo "Inhalt von \$Array_size_a_$i : "${Array_size_a[$i]}
    done
echo

echo "217"

# Hier werden die Fragmente und deren Groesse anhand der nicht belegten name-Array-Position ermittelt und
# mit dem groesse-Array abgeglichen -> Fragmente und Partionen/Bloecke werden in getrennte Listen dokumentiert
	echo "221 - Inhalt von \$Array_size :"${Array_size_a[*]}
	echo "222 - Anzahl der Inhalt von \$Array_size :"${#Array_size_a[@]}


#
	for ((i=0; i<=$Speicherplatz; i=i+1))
		do
		if [ $i = 0 ]
			then
			echo "Partitionsname:Partitionsgroesse" > Fragmente.liste
			echo "Partitionsname:Partitionsgroesse" > BloeckePartitionen.liste
			
			
			
		fi
		
		if [ -z ${name[$i]} ]
			then
			echo $i"groessePos":"${name[$i]}:${Array_size_b[$i]}" >> Fragmente.liste
			ArrayfreiBloecke_size[$i]="${Array_size_b[$i]}"
			freiBloecke=$freiBloecke"${Array_size_b[$i]} "			
			unset Array_size_b[$i]
			echo "groesse der leeren Fragmente geloescht"
				else
				echo "${name[$i]}:${Array_size_a[$i]}" >> BloeckePartitionen.liste
				ArraybelegteBloecke_size[$i]="${Array_size_b[$i]}"
				belegteBloecke=$belegteBloecke"${Array_size_b[$i]} "

echo "281 - Inhalt von \$ArraybelegteBloecke :"${ArraybelegteBloecke_size[*]}
echo "282 - Inhalt von \$ArrayfreiBloecke    :"${ArrayfreiBloecke_size[*]}

		fi

    done
echo "281 - Inhalt von \$ArraybelegteBloecke :"${ArraybelegteBloecke_size[@]}
echo "282 - Inhalt von \$ArrayfreiBloecke    :"${ArrayfreiBloecke_size[@]}

# Hier werden die ermittelten Werte des Array mit den belegten Bloecken
# in 3 weitere Arrays geclonet um die weitere Groessen- und Farbbestimmung durchzufuehren
# -------------------------------------------------------------------------------------	
echo
array_greenelements_smale=("${ArraybelegteBloecke_size[@]}")
echo "319 - Inhalt von \$array_greenelements_smale :"${array_greenelements_smale[*]}
echo
array_blueelements_medium=("${ArraybelegteBloecke_size[@]}")
echo "322 - Inhalt von \$array_blueelements_medium :"${array_blueelements_medium[*]}
echo
array_redelements_large=("${ArraybelegteBloecke_size[@]}")
echo "325 - Inhalt von \$array_redelements_large   :"${array_redelements_large[*]}
echo	
	
echo
echo "256 - Anzahl der Inhalt von \$freiBloecke :"$freiBloecke
echo
echo "258 - Anzahl der Inhalt von \$belegteBloecke :"$belegteBloecke
echo
echo "249"

echo "355 Bildschirmausgabe der bearbeiteten Array fuer die spaetere Qualifizierung der Partitionen (Farbzuordung/Voluminas)"
echo
	for ((i=0; i<=14; i=i+1)) 
		do
		if [ $i = 0 ]; then echo "Bildschirmausgabe der groessten Partionen/Block in ArrayPos NAME"; fi
		echo "Inhalt von \$Array_size_b_$i : "${Array_size_b[$i]}
    done
echo

# Ende
#comment
echo

# Hier werden die jeweils groessten und kleinesten Partitionen ermittelt
# ----------------------------------------------------------------------
#${array_redelements_smale[0]}=Psmale
P_large=0

	for ((i=0; i<=${#ArraybelegteBloecke_size[@]}; i=i+1))
		do
		if [[ ${ArraybelegteBloecke_size[$i]} -gt $P_large ]]
		then
			echo "Schleife_P_large : "$i
			P_large=${ArraybelegteBloecke_size[$i]}
			echo "P_large : "$P_large
		fi
	
    done
			echo "zeile 374 : "$i

#${array_greenelements_smale[0]}=Psmale
	P_smale=999998

	for ((i=0; i<=${#ArraybelegteBloecke_size[@]}; i=i+1))
		do
		if [ -z ${ArraybelegteBloecke_size[$i]} ]
		then 
			echo "ArrayPosLeer" $i
		elif [[ ${ArraybelegteBloecke_size[$i]} -lt $P_smale ]]
		then
			echo "Schleife_P_large : "$i
			P_smale=${ArraybelegteBloecke_size[$i]}
			echo "P_smale : "$P_smale
		fi
	
    done
			echo "zeile 392 : "$i
echo
echo "#######################################################################"
echo "der kleinste gefundene Wert ist "$P_smale", der groeste ist "$P_large
echo "#######################################################################"
echo

# In den Clone-Arrays wird nun nach den beiden extrem-Werten gesucht und diese dann entfernt
# ------------------------------------------------------------------------------------------
echo "Zeile 398 - Inhalt von array_redenelements_large :"${array_redelements_large[*]}

	for ((i=0; i<=${#ArraybelegteBloecke_size[@]}; i=i+1))
		do
		if [[ ${ArraybelegteBloecke_size[$i]} -lt $P_large ]] #2> /dev/null 
		then
			unset array_redelements_large[$i]
		fi
    done
echo "Zeile 407 - Inhalt von array_redenelements_large :"${array_redelements_large[*]}
echo
##############################################################################################
echo
echo "Zeile 411 - Inhalt von \$array_blueelements_medium :"${array_blueelements_medium[*]}

	for ((i=0; i<=${#ArraybelegteBloecke_size[@]}; i=i+1))
		do
		if  [[ ${ArraybelegteBloecke_size[$i]} -eq $P_large ]] 
		then
			unset array_blueelements_medium[$i]
		fi
		if  [[  ${ArraybelegteBloecke_size[$i]} -eq $P_smale ]] 
		then
			unset array_blueelements_medium[$i]
		fi
    done
echo "Zeile 424 - Inhalt von array_redenelements_large :"${array_blueelements_medium[*]}
echo
##############################################################################################
echo
echo "Zeile 428 - Inhalt von \$array_greenelements_smale :"${array_greenelements_smale[*]}

	for ((i=0; i<=${#ArraybelegteBloecke_size[@]}; i=i+1))
		do
		if [[ ${ArraybelegteBloecke_size[$i]} -gt $P_smale ]] 
		then
			unset array_greenelements_smale[$i]
		fi
    done
echo "Zeile 437 - Inhalt von \$array_greenelements_smale :"${array_greenelements_smale[*]}
echo
##############################################################################################
echo "Zeile 440"

# Bildschirmausgabe der bearbeiteten Array fuer die spaetere Qualifizierung der Partitionen (Farbzuordung/Voluminas)
echo
	for ((i=0; i<=14; i=i+1)) 
		do
		if [ $i = 0 ]; then echo "Bildschirmausgabe der groessten Partionen/Block in ArrayPos NAME"; fi
		echo "Inhalt von \$array_redelements_large_$i : "${array_redelements_large[$i]}
    done
echo
echo
	for ((i=0; i<=14; i=i+1)) 
		do
		if [ $i = 0 ]; then echo "Bildschirmausgabe der sonstigen Partionen/Block in ArrayPos NAME"; fi
		echo "Inhalt von \$array_blueelements_medium$i : "${array_blueelements_medium[$i]}
    done
echo
echo
	for ((i=0; i<=14; i=i+1)) 
		do
		if [ $i = 0 ]; then echo "Bildschirmausgabe der kleinesten Partionen/Block in ArrayPos NAME"; fi
		echo "Inhalt von \$array_greenelements_smale_$i : "${array_greenelements_smale[$i]}
    done

echo "Zeile 415"




echo "Summe_akt_belegt_Speicher_b:" ${#groesse[@]}
echo "Summe_akt_belegt_Speicher_c:" ${#Array_size[@]}


# Restspeichermenge ermitteln nach dem Ende des letzen belegte Blockes
let Restspeichermenge=$Speicherplatz-${#groesse[@]}
echo "Restspeichermenge : "$Restspeichermenge


# für die Speicherbereichdarstellung Farbewerte-Variablen erstellen: [TEXT im Vordergund];[HINTERGRUND]


#weiss
c1="\e[30;107m"

#blau
c2="\e[97;44m"

#rot
c3="\e[97;41m"

#gruen
c4="\e[30;42m"

#default
c0="\e[0m"		# Variable für Standfarbausgabe

#descriptor="${number}-${location}-${supplier}-${model}-${serial_no}-${plex}-${form}-${color}-${tcpip_adress}-${tcpip_port}-${tandem}-${start_sheet}"   #U003 U004
#block_tmp="${block_tmp}${block_x}"
echo $block_tmp


#############################################################################################

for i in ${groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
    do
#	let summe+=$i #Array Inhalte addieren um die derzeitige Füllung herauszufinden
	let SummeSpeicherBelegung=$SummeSpeicherBelegung+1 #Array Inhalte addieren um die derzeitige Füllung herauszufinden
    done

#Berechnung der Speicherbelegung in % mit einer Dezimalstell
SpeicherBelegungProzent_awk=$(awk -v "a=$SummeSpeicherBelegung" -v "b=$Speicherplatz" 'BEGIN {printf "%.1f\n", ((a/b)*100)+0.05}')
echo "In der Variable -SpeicherBelegungProzent_awk- ist die Ausgabe des awk gespeichert:" $SpeicherBelegungProzent_awk 
#############################################################################################



clear
echo "======================================================="
echo "Visuelle Darstellung der Speicherbelegung" "[ $Speicherplatz MB ]"
echo "======================================================="
echo


#############################################################################################
echo "Restspeichermenge "$Restspeichermenge" = speicherplatz "$Speicherplatz
if [ $Restspeichermenge -eq $Speicherplatz ]; then
#	for ((i=0; i<3; i=i+1)); do echo $i; done
	block_x="+"
#	for ((i=0; i<3; i=i+1)); do echo $i; echo $i; done
	for ((i=0; i<$Restspeichermenge; i=i+1)); do block_tmp="${block_tmp}${block_x}"; done
	echo $i
	echo $block_tmp
	segment="-e $c1""${block_tmp}"

	echo "z55"
	echo $segment

fi
#############################################################################################

#
<comment
#############################################################################################
    seekCounter=0 #Counter der die freien Plätze beinhaltet
    for (( i=0; i<=$Speicherplatz; i++ )) #Schleife in der Größe des Speicherplatzes
    do
	if [[ -z "${groesse[$i]}" ]]; then #Wenn die i-te Stelle im Speicher leer ist
	    seekCounter=$((seekCounter+1)) #Aufeinander folgende leere Plätze werden hochgezählt
	    if [[ $seekCounter -ge $seekGroesse ]]; then #Wenn der counter der leeren Plätze größer/gleich der unterzubnrGröße 
		index=$(($i-($seekCounter-1)))
		groesse[$index]=$seekGroesse #Größe an der Stelle im Array einfügen
		echo "Arraygroesse = " "${groesse[*]}"
		name[$index]=$seekName #Name an der Stelle im Array einfügen
		return 1 #Erfolgreich -> Raus
	    fi
	fi
    done
comment
#############################################################################################


if [ $Restspeichermenge -ne $Speicherplatz  ]
then
echo "Anfang01"
first=1
firstName=1

Part_wechsel_old="${groesse[0]}"
echo "Part_wechsel_old (initial gesetzt) = "$Part_wechsel_old
block_x="+"


#### test wechel der Partion erkennen
#<<comment
# Beginn - kann gelöscht werden
#for i in ${groesse[@]} #Durch alle Array Inhalte vom Array groesse loopen
#    do
	for ((i=0; i<${#groesse[@]}; i=i+1))
		do
		echo ${groesse[$i]} "WieWoWas"
		let Schleife=$i+1
		echo "Schleife i : "$Schleife 
		Part_wechsel_new="${groesse[$i]}"
		if [ -z ${groesse[$i]} ]; then echo "Leere ArrayPos"; Part_wechsel_new=999999; fi #Wenn die i-te Stelle im Speicher leer ist
			echo "Part_wechsel_new (for-Schleife) = "$Part_wechsel_new
			echo "Part_wechsel_old (for-Schleife) = "$Part_wechsel_old
#			echo
# ===========================================================================================================================

# Wenn die Zaehlung fuer eine Partition abgeschlossen ist werden hier die Bloecke qualifiziert und zusammen gesetzt 
		if [ $Part_wechsel_old -ne $Part_wechsel_new ] 2> /dev/null # Ausgabeumleitung der Fehlermeldung "unary operator expected" nach "stdout" der leere Inhalt des Array den Vergleich nicht zulaesst
		then
		if [ $firstName -eq 1 ]; then iNAME=-1; firstName=0; fi # Startwert fuer die Pruefung in den Parallel-Arrays (Clone) zur Farbzuordung (rot/blau/gruen/weiss)
		let iNAME=$iNAME+1
		echo "Zeile_608" $iNAME

# ===========================================================================================================================

	# Bei nur einer vorhandene Partion wird der Farbwert Standardmaessig auf blau gesetzt
		if [ ${#Array_size_b[@]} -eq 1 ]
		then
			echo "Hier lang, iss eh nur eine Partion"
			segment_tmp="$c2""${block_tmp}""$c0"
			echo $Part_wechsel_old"blau"
		fi

# ===========================================================================================================================

	# Bei nur 2 vorhandene Partion kann deren Farbwert auf blau bei 50/50 oder gesetzt gruen/rot bei A^=B
		if [ ${#Array_size_b[@]} -eq 2 ]
		then
		let breakpoint=($P_smale+$P_large)*5/10
		echo "breakpoint : " $breakpoint
		echo "Zeile_658 Ausgabe wenn 2 Partionen Array_Name : " $iNAME "-" ${array_greenelements_smale[$iNAME]}
			if [ $P_smale -eq $P_large ]
			then
			echo "Zeile_661"
				echo "Ist die groesste ermittelte Partition gleich der kleinesten Partition wird blau gewaehlt"
				segment_tmp="$c2""${block_tmp}""$c0"
				echo $Part_wechsel_old"blau"
			else
				if [[ ${array_redelements_large[$iNAME]} -gt $breakpoint ]]
				then
				echo "Zeile_668"
					echo "Ist die aktuelle Partition groesser 50% der belegteBloecke wird rot gewaehlt"
					segment_tmp="$c3""${block_tmp}""$c0"
					echo $Part_wechsel_old"rot"
				else
					if [[ ${array_greenelements_smale[$iNAME]} -le $breakpoint ]]
					then
						echo "Zeile_676"
						echo "Ist die aktuelle Partition kleiner/gleich 50% der belegteBloecke wird gruen gewaehlt"
						segment_tmp="$c4""${block_tmp}""$c0"
						echo $Part_wechsel_old"gruen"
					fi
				fi
			fi
		fi	
# ===========================================================================================================================

	# Ab 3 vorhandene Partion kann deren Farbwert 
		if [ ${#Array_size_b[@]} -ge 3 ]
		then
		let breakpoint=($P_smale+$P_large)*5/10
		echo "breakpoint : " $breakpoint
		echo "Zeile_658 Ausgabe wenn 2 Partionen Array_Name : " $iNAME "-" ${array_greenelements_smale[$iNAME]}
			if [ $P_smale -eq $P_large ]
			then
			echo "Zeile_661"
				echo "Es sind alle ermittelten Partition gleichgross - wird blau gewaehlt"
				segment_tmp="$c2""${block_tmp}""$c0"
				echo $Part_wechsel_old"blau"
			else
				if [[ -z "${array_redelements_large[$iNAME]}" ]]
				then
					if [[ -z "${array_greenelements_smale[$iNAME]}" ]]
					then
						echo "Zeile_676"
						echo "Da die vorlaufenden Pruefungen weder kleien noch grosse Bloecke gefunden hat - wird blau gewaehlt"
						segment_tmp="$c2""${block_tmp}""$c0"
						echo $Part_wechsel_old"blau"
					else
						echo "Zeile_676"
						echo "Das gepruefte Feld ist nicht leer, also befindet sich hier eine kleine Partition/Bloecke - es wird gruen gewaehlt"
						segment_tmp="$c4""${block_tmp}""$c0"
						echo $Part_wechsel_old"gruen"
					fi
				else
					echo "Das gepruefte Feld ist nicht leer, also befindet sich hier eine groesse Partition/Bloecke - es wird rot gewaehlt"
					segment_tmp="$c3""${block_tmp}""$c0"
					echo $Part_wechsel_old"rot"
				fi
			fi
		fi	
# ===========================================================================================================================


		echo $block_tmp
		

		if [[ $Part_wechsel_old = "999999" ]]; then segment_tmp="$c1""${block_tmp}""$c0"; echo $Part_wechsel_old"weiss"; fi

#		segment_tmp="${block_tmp}"
		echo "segment_tmp : "-e $segment_tmp
#		if [ $first=1 ]; then segment="$c4""${segment}"" ${segment_tmp}"; first=0; fi
		
#		if [ $first=1 ]; then segment="${segment}""${segment_tmp}"; fi
		if [ $first=0 ]; then segment="${segment}""${segment_tmp}"; fi
		echo "Segmente hintereinander : "$segment

#	segment="-e $c1""${block_tmp}"

		echo "z228"
#		segment="$c4""$segment"
#		echo -e $segment $c0
#		oder so 
		echo -e $segment

		
		echo "Part_wechsel_old (AAA) = "$Part_wechsel_old
		Part_wechsel_old="${groesse[$i]}"
		if [ -z ${groesse[$i]} ]; then echo "Leere ArrayPos"; Part_wechsel_old=999999; fi 
		echo "Part_wechsel_old (BBB) = "$Part_wechsel_old
		block_tmp=""
		segment_tmp=""

		fi


# Solange die selbe Partition besteht wird hier fortlaufend eine Feld angefuegt
		if [ $Part_wechsel_old -eq $Part_wechsel_new ] 2> /dev/null # Ausgabeumleitung der Fehlermeldung "unary operator expected" nach "stdout" der leere Inhalt des Array den Vergleich nicht zulaesst
		then
#		    for (( i=1; i<=${#grossklein[*]}; i+2 )) #Schleife in der Größe des Speicherplatzes
#		    for (( i=0; i<=2; i++ )) #Schleife in der Größe des Speicherplatzes
#			do
#			echo "grossklein_a"
#			echo $i
#			if [ $i = $Part_wechsel_old ]; then block_tmp="${block_tmp}$c4${block_x}$c0"
#			fi
#			done

		block_tmp="${block_tmp}${block_x}"
		echo

		fi
		
		
		
		done
		
	echo $block_tmp
	segment_tmp="$c1""${block_tmp}""$c0"
	echo "segment_tmp : "$segment_tmp
	segment="${segment}""${segment_tmp}"


echo -e $c0"Ab hier erfolgt die tatsaechlich Ausgabe - Segmente hintereinander : "
	clear
	
	echo
	echo "==============================================================================="
echo -e $c0"   ===>>  Die aktuelle Belegung des Speicherbereich  <<==="
	echo "==============================================================================="
	echo
	echo -e $segment
	echo
echo -e $c0"==============================================================================="
#	echo -e $c1"freie Bloecke"$c0" "$c2"belegte Bloecke"$c0" "$c3"groesster belegter Block"$c0" "$c4"kleinster belegter Block"$c0
#	echo -e $c1$segment


#	if [ ]; then count01=$summe+1
#	Part_wechsel_new=${groesse[@]}
#
#	Part_wechsel_old=$Part_wechsel_new
#	echo "Wechel der Partion - Neu: "$Part_wechsel_new
#  done
# Ende - kann gelöscht werden
#comment
#### test wechel der Partion erkennen
	
fi
#############################################################################################
#comment


echo 
echo -e $c1"freie Bloecke"$c0" "$c2"belegte Bloecke"$c0" "$c3"groesste belegte Bloecke"$c0" "$c4"kleinste belegte Bloecke"$c0
echo
echo "###############################################################################"


#awk -F: '
#	BEGIN{ printf "%s\t%s","Partitionsname","Partitionsgroesse" }
#	{ printf ( $1 ~ "name" ? RS : "\t" ) $2}
#	END { print "" }
#' testohne.sh

#awk -F ":" '{print $1 "\t" $2}' BloeckePartitionen.liste
echo
awk -F ":" '{print $1 "\t\t" $2}' BloeckePartitionen.liste


echo " "
echo "Informationen der Speicherbelegung"
echo "-----------------------------------------------------------------------"
echo "-> Speicherbelegung                              : " $SummeSpeicherBelegung "MB von "$Speicherplatz "MB"
echo "-> Speicherbelegung in %                         : " $SpeicherBelegungProzent_awk" %"
echo "-> Grad der externen Fragmentierung              : "
echo "-> Gesamtzahl der belegten Bloecke im Adressraum : " ${#Array_size_b[@]}
echo "-> Gesamtzahl der freien Bloecke im Adressraum   : " 
echo "-> Groesster Block im Adressraum                 : " $P_large
echo "-> Kleinster Block im Adressraum                 : " $P_smale
echo "-----------------------------------------------------------------------"
echo
echo
echo
echo
echo
echo
echo
echo