#!/bin/bash
clear
#Benutzer wird aufgefordert, eine Gesamtspeichergroesse zu waehlen
echo "Bitte geben Sie eine Gesamtspeichergroesse an."
#Speichergroesse wird eingelesen
read -r speichergroesse
	#Nachdem die Groesse eingelesen wurde wird ueberprueft, ob die Eingabe andere Zeichen ausser Zahlen enthaelt oder nicht groesser als 0 ist
	#Wenn das der Fall ist, wird solange nach der Groesse gefragt, bis keine anderen Zeichen ausser Zahlen enthalten sind und die Eingabe groesser 0 ist
	#Als Quelle fuer die Funktionsaufrufe ist simulationssteuerungFunktionen.sh definiert
	#Der Rueckgabewert der Funktion keineZeichenGroesserNull ist die Gesamtspeichergroesse, welche in der Variablen gewaehlteGesamtspeichergroesse gespeichert wird
	source ./simulationssteuerungFunktionen.sh
	while [ -n "$(printf '%s\n' "$speichergroesse" | sed 's/[0-9]//g')" ] || [[ ! $speichergroesse -gt 0 ]]
	do
		keineZeichenNichtGroesserNull speichergroesse
		zeichen speichergroesse
		read -r speichergroesse
	done
	gewaehlteGesamtspeichergroesse=$(keineZeichenGroesserNull)
echo "Ihre gewaehlte Speichergroesse ist: $gewaehlteGesamtspeichergroesse"
#Array mit der gewaehlten Eingabe zur Groesse
array_gesamte_groesse=($gewaehlteGesamtspeichergroesse)


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
	#Als Quelle wird die Datei simulationssteuerungFunktionen.sh angegeben
	#Es wird ueberprueft, ob die Eingabe einem der Realisierungskonzepte entspricht oder ob erneut nach einer Eingabe gefragt wird
	source ./simulationssteuerungFunktionen.sh
	while ! { [ "$konzept" = "f" ] || [ "$konzept" = "b" ] || [ "$konzept" = "n" ] || [ "$konzept" = "w" ] || [ "$konzept" = "r" ] || [ "$konzept" = "l" ]; }
	do
		ungueltigesRealisierungskonzept konzept
		read -r konzept
	done
	#Die Eingabe entspricht einem der Realisierungskonzepte
	#if-Abfragen fuer Realisierungskonzept zum ueberpruefen, welches Realisierungskonzept ausgewahlt wurde
	#Die Funktionen werden aus der Quelle simulationssteuerungFunktionen.sh aufgerufen
	source ./simulationssteuerungFunktionen.sh
	#Es wurde das Konzept First Fit ausgewaehlt
	if [ "$konzept" = "f" ]; then
		echo "Ihr gewaehltes Konzept ist: First Fit."
		#Die Funktion abfrageAktion wird von der angegebenen Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Nachdem der jeweilige Befehl ausgefuehrt wurde (alle moeglich ausser q), wird auf die Datei firstfit.sh als Quelle verwiesen, wo die Eingaben weiter verarbeitet werden in der Funktion insertFirstFit
 		#Der Funktion werden dabei zwei Arrays uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
				source ./firstfit.sh
				#insertFirstFit array_name_groesse array_gesamte_groesse
				insertFirstFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                #Funktion zum Zuruecksetzen des Speichers
                echo "Der Simulator wurde beendet."
	#Es wurde das Konzept Best Fit ausgewaehlt
	elif [ "$konzept" = "b" ]; then
		echo "Ihr gewaehltes Konzept ist: Best Fit."
		#Die Funktion abfrageAktion wird von der angegebenen Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Nachdem der jeweilige Befehl ausgefuehrt wurde (alle moeglich ausser q), wird auf die Datei bestfit.sh als Quelle verwiesen, wo die Eingaben weiter verarbeitet werden in der Funktion insertBestFit
		#Der Funktion werden dabei zwei Arrays uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
				source ./bestfit.sh
				echo "***********************"
				echo "Speicher: $gewaehlteGesamtspeichergroesse"
				echo "Name: $createPartitionsName"
				echo "Groesse: $createPartitionsGroesse"
				echo "************************"
				insertBestFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                #Funktion zum Zuruecksetzen des Speichers
                echo "Der Simulator wurde beendet."
	#Es wurde das Konzept Next Fit ausgewaehlt
	elif [ "$konzept" = "n" ]; then
		echo "Ihr gewaehltes Konzept ist: Next Fit."
		#Die Funktion abfrageAktion wird von der angegebenen Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Nachdem der jeweilige Befehl ausgefuehrt wurde (alle moeglich ausser q), wird auf die Datei nextfit.sh als Quelle verwiesen, wo die Eingaben weiter verarbeitet werden in der Funktion insertNextFit
		#Der Funktion werden dabei zwei Arrays uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
				source ./nextfit.sh
				#insertNextFit array_name_groesse array_gesamte_groesse
				insertNextFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                #Funktion zum Zuruecksetzen des Speichers
                echo "Der Simulator wurde beendet."
	#Es wurde das Konzept Worst Fit ausgewaehlt
	elif [ "$konzept" = "w" ]; then
		echo "Ihr gewaehltes Konzept ist: Worst Fit."
		#Die Funktion abfrageAktion wird von der angegebenen Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Nachdem der jeweilige Befehl ausgefuehrt wurde (alle moeglich ausser q), wird auf die Datei worstfit.sh als Quelle verwiesen, wo die Eingaben weiter verarbeitet werden in der Funktion insertWorstFit
		#Der Funktion werden dabei zwei Arrays uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
				source ./worstfit.sh
				#insertWorstFit array_name_groesse array_gesamte_groesse
				insertWorstFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                #Funktion zum Zuruecksetzen des Speichers
                echo "Der Simulator wurde beendet."
	#Es wurde das Konzept Random ausgewaehlt
	elif [ "$konzept" = "r" ]; then
		echo "Ihr gewaehltes Konzept ist: Random."
		#Die Funktion abfrageAktion wird von der angegebenen Quelle simulationssteuerungFunktionen.sh aufgerufen
		abfrageAktion
		#Der Befehl wird eingelesen
		#Nachdem der jeweilige Befehl ausgefuehrt wurde (alle moeglich ausser q), wird auf die Datei random.sh als Quelle verwiesen, wo die Eingaben weiter verarbeitet werden in der Funktion insertRandom
		#Der Funktion werden dabei zwei Arrays uebergeben
		#Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
       		read -r befehl
                	while [ "$befehl" != "q" ]
                	do
                		ablaufRealisierungskonzept befehl
				source ./randomfit.sh
				#insertRandom array_name_groesse array_gesamte_groesse
				insertRandomFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
				abfrageAktion
				read -r befehl
                	done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                #Funktion zum Zuruecksetzen des Speichers
                echo "Der Simulator wurde beendet."
	elif [ "$konzept" = "l" ]; then
                echo "Ihr gewaehltes Konzept ist: Last Fit."
                #Die Funktion abfrageAktion wird von der angegebenen Quelle simulationssteuerungFunktionen.sh aufgerufen
                abfrageAktion
                #Der Befehl wird eingelesen
		#Nachdem der jeweilige Befehl ausgefuehrt wurde (alle moeglich ausser q), wird auf die Datei lastfit.sh als Quelle verwiesen, wo die Eingaben weiter verarbeitet werden in der Funktion insertLastFit
		#Der Funktion werden dabei zwei Arrays uebergeben
                #Nachdem die Funktion ausgefuehrt wurde, wird erneut nach einer Eingabe gefragt
                read -r befehl
                        while [ "$befehl" != "q" ]
                        do
                                ablaufRealisierungskonzept befehl
                                source ./lastfit.sh
                                #insertLastFit array_name_groesse array_gesamte_groesse
				insertLastFit $gewaehlteGesamtspeichergroesse "$createPartitionsName" $createPartitionsGroesse
                                abfrageAktion
                                read -r befehl
                        done
                #Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde und im Hintergrund wird die Speicherbelegung zurueckgesetzt
                #Funktion zum Zuruecksetzen des Speichers
                echo "Der Simulator wurde beendet."
	fi
