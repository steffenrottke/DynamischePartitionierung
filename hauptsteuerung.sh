#!/bin/bash
clear
#Alle Dateien auf die im folgenden Teil zugegriffen wird, sind als Quellen definiert
source ./simulationssteuerungFunktionen.sh
source ./firstfit.sh
source ./bestfit.sh
source ./nextfit.sh
source ./worstfit.sh
source ./random.sh
source ./lastfit.sh

#Benutzer wird aufgefordert, eine Gesamtspeichergroesse zu waehlen
echo "Bitte geben Sie eine Gesamtspeichergroesse an."
#Speichergroesse wird eingelesen
read -r speichergroesse
	#Nachdem die Groesse eingelesen wurde wird ueberprueft, ob die Eingabe andere Zeichen ausser Zahlen enthaelt oder nicht groesser als 0 ist
	#Wenn das der Fall ist, wird solange nach der Groesse gefragt, bis keine anderen Zeichen ausser Zahlen enthalten sind und die Eingabe groesser 0 ist
	#Als Quelle fuer die Funktionsaufrufe wird simulationssteuerungFunktionen.sh genutzt
	#Der Rueckgabewert der Funktion keineZeichenGroesserNull ist die Gesamtspeichergroesse, welche in der Variablen gewaehlteGesamtspeichergroesse gespeichert wird
	while [ -n "$(printf '%s\n' "$speichergroesse" | sed 's/[0-9]//g')" ] || [[ ! $speichergroesse -gt 0 ]]
	do
		keineZeichenNichtGroesserNull speichergroesse
		zeichen speichergroesse
		read -r speichergroesse
	done
	gewaehlteGesamtspeichergroesse=$(keineZeichenGroesserNull)
echo "Ihre gewaehlte Speichergroesse ist: $gewaehlteGesamtspeichergroesse"


echo ""
echo ""
#Benutzer wird aufgefordert, das Realisierungskonzept auszuwaehlen, es gibt die Wahl zwischen den Shortcuts f,b,n,w,r und l
echo "Bitte geben Sie ein, welches Realisierungskonzept genutzt werden soll. Es stehen folgenden Realisierungskonzepte zur Verfuegung:
-> f (First Fit)
-> b (Best Fit)
-> n (Next Fit)
-> w (Worst Fit)
-> r (Random)
-> l (Last Fit)"
#Das ausgewaehlte Konzept wird eingelesen
read -r konzept
	#Als Quelle wird die Datei simulationssteuerungFunktionen.sh genutzt
	#Es wird ueberprueft, ob die Eingabe einem der Realisierungskonzepte entspricht oder ob erneut nach einer Eingabe gefragt wird
	while ! { [ "$konzept" = "f" ] || [ "$konzept" = "b" ] || [ "$konzept" = "n" ] || [ "$konzept" = "w" ] || [ "$konzept" = "r" ] || [ "$konzept" = "l" ]; }
	do
		ungueltigesRealisierungskonzept konzept
		read -r konzept
	done
	#Die Eingabe entspricht einem der Realisierungskonzepte
	#Es folgt ein case-Statement zum ueberpruefen, welches Realisierungskonzept ausgewahlt wurde
	#Die Funktionen werden aus der Quelle simulationssteuerungFunktionen.sh aufgerufen
	#Es wurde das Konzept First Fit ausgewaehlt
	case "$konzept" in
	"f")
		echo "Ihr gewaehltes Konzept ist: First Fit."
		#Die Funktion abfrageAktion wird von der Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Es wird die Funktion ablaufRealisierungskonzept aufgerufen und der eingelesene Befehl uebergeben
		#Nachdem der jeweilige Befehl ausgewaehlt wurde (alle moeglich ausser q), wird die Funktion insertFirstFit aufgerufen, wenn der Befehl ein c ist
 		#Der Funktion werden dabei drei Werte uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
				arrayMitBisherigenNamen="${save_name[@]}"
                                ablaufRealisierungskonzept befehl
				if [ "$befehl" = "c" ]; then
				insertFirstFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
				fi
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                echo "Der Simulator wurde beendet."
		;;
	#Es wurde das Konzept Best Fit ausgewaehlt
	"b")
		echo "Ihr gewaehltes Konzept ist: Best Fit."
		#Die Funktion abfrageAktion wird von der Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Es wird die Funktion ablaufRealisierungskonzept aufgerufen und der eingelesene Befehl uebergeben
		#Nachdem der jeweilige Befehl ausgewaehlt wurde (alle moeglich ausser q), wird die Funktion insertBestFit aufgerufen, wenn der Befehl ein c ist
		#Der Funktion werden dabei drei Werte uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
				if [ "$befehl" = "c" ]; then
                                insertBestFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                fi
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                echo "Der Simulator wurde beendet."
		;;
	#Es wurde das Konzept Next Fit ausgewaehlt
	"n")
		echo "Ihr gewaehltes Konzept ist: Next Fit."
		#Die Funktion abfrageAktion wird von der Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Es wird die Funktion ablaufRealisierungskonzept aufgerufen und der eingelesene Befehl uebergeben
		#Nachdem der jeweilige Befehl ausgewaehlt wurde (alle moeglich ausser q), wird die Funktion insertNextFit aufgerufen, wenn der Befehl ein c ist
		#Der Funktion werden dabei drei Werte uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
				if [ "$befehl" = "c" ]; then
                                insertNextFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                fi
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                echo "Der Simulator wurde beendet."
		;;
	#Es wurde das Konzept Worst Fit ausgewaehlt
	"w")
		echo "Ihr gewaehltes Konzept ist: Worst Fit."
		#Die Funktion abfrageAktion wird von der Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Es wird die Funktion ablaufRealisierungskonzept aufgerufen und der eingelesene Befehl uebergeben
		#Nachdem der jeweilige Befehl ausgewaehlt wurde (alle moeglich ausser q), wird die Funktion insertWorstFit aufgerufen, wenn der Befehl ein c ist
		#Der Funktion werden dabei drei Werte uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
				if [ "$befehl" = "c" ]; then
                                insertWorstFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                fi
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                echo "Der Simulator wurde beendet."
		;;
	#Es wurde das Konzept Random ausgewaehlt
	"r")
		echo "Ihr gewaehltes Konzept ist: Random."
		#Die Funktion abfrageAktion wird von der Quelle simulationssteuerungFunktionen.sh aufgerufen
		abfrageAktion
		#Der Befehl wird eingelesen
		#Es wird die Funktion ablaufRealisierungskonzept aufgerufen und der eingelesene Befehl uebergeben
		#Nachdem der jeweilige Befehl ausgewaehlt wurde (alle moeglich ausser q), wird die Funktion insertRandomFit aufgerufen, wenn der Befehl ein c ist
		#Der Funktion werden dabei drei Werte uebergeben
		#Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
       		read -r befehl
                	while [ "$befehl" != "q" ]
                	do
                		ablaufRealisierungskonzept befehl
				if [ "$befehl" = "c" ]; then
                                insertRandomFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                fi
				abfrageAktion
				read -r befehl
                	done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                echo "Der Simulator wurde beendet."
		;;
	"l")
                echo "Ihr gewaehltes Konzept ist: Last Fit."
                #Die Funktion abfrageAktion wird von der Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Es wird die Funktion ablaufRealisierungskonzept aufgerufen und der eingelesene Befehl uebergeben
		#Nachdem der jeweilige Befehl ausgewaehlt wurde (alle moeglich ausser q), wird die Funktion insertLastFit aufgerufen, wenn der Befehl ein c ist
		#Der Funktion werden dabei drei Werte uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
                                insertLastFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                echo "Der Simulator wurde beendet."
		;;
	esac
