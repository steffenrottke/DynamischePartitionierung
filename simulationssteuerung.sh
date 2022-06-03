#!/bin/bash
clear
#Benutzer kann zwischen den Befehlen mit den Shortcuts d,c,n und q auswaehlen
echo "Bitte geben Sie einen Befehl ein."
echo ""
echo "Es stehen diese Befehle zur Verfuegung:
->d: delete, Partition loeschen
->c: create, Partition anlegen
->n: new, Speicherbelegeung zuruecksetzen
->q: quit, Simulation beenden"
#Der ausgewaehlte Befehl wird eingelesen
       read -r befehl
       #Die if-Anweisung ueberprueft welcher Befehl ausgefuehrt werden soll
       if [ "$befehl" = "c" ]; then
                #Wenn der Befehl create entspricht, wird nun die Abfrage nach dem Namen und anschliessend nach der Groesse gestartet
                #Die Variablen createPartitionsName und createPartitionsGroesse speichern den Namen bzw. die jeweilige Groesse bis zu dem eingegebenen c
                echo 'Bitte geben Sie einen Namen für die Partition ein und bestaetigen Sie mit: " c".'
			read -r name
				#Nachdem der Name eingelesen wurde wird ueberprueft, ob die Einagbe mit einem c bestaetigt wurde oder nicht
				#Wenn nicht, wird solange nach dem Namen gefragt, bis mit c bestaetigt wurde
				#Die Funktionen zur Ueberpruefung befinden sich in: simulationssteuerungFunktionen.sh, das zu Beginn als Quelle angegeben ist
				source ./simulationssteuerungFunktionen.sh
					while [[ ! "$name" =~ " c" ]]
					do
						frageNachNameNichtBestaetigt name
						read -r name
					done
				createPartitionsName=$(frageNachNameBestaetigt)
                echo 'Bitte geben Sie eine Groesse für die Partition ein und bestaetigen Sie mit: " c".'
                        	read -r groesse
				#Nachdem die Groesse eingelesen wurde wird ueberprueft, ob die Eingabe mit einem c bestaetigt wurde oder nicht und ob es sich um eine Zahl groesser 0 handelt, die eingegeben wurde
				#Wenn nicht, wird solange nach der Groesse gefragt, bis mit c bestaetigt wurde und die Eingabe nur Zahlen groesser 0 enthaelt
				#Die Funktionen zur Ueberpruefung befinden sich in: simulationssteuerungFunktionen.sh, das zu Beginn als Quelle angegeben ist
				source ./simulationssteuerungFunktionen.sh
					while [ -n "$(printf '%s\n' "${groesse/ c*/}" | sed 's/[0-9]//g')" ] || [[ ! "$groesse" =~ " c" ]] || [[ ! ${groesse/ c*/} -gt 0 ]]
					do
						zeichenBestaetigt groesse
						zeichenNichtBestaetigt groesse
						keineZeichenBestaetigtNichtGroesserNull groesse
						keineZeichenBestaetigtGroesserNull groesse
						keineZeichenNichtBestaetigtNichtGroesserNull groesse
						keineZeichenNichtBestaetigtGroesserNull groesse
						read -r groesse
					done
				createPartitionsGroesse=$(keineZeichenBestaetigtGroesserNull)
                echo "Der eingegebene Name für die Partition ist: $createPartitionsName und die gewaehlte Groesse ist: $createPartitionsGroesse."
		#Array mit den gewaehlten Eingaben zum Namen und zur Groesse
		array_name_groesse=($createPartitionsName $createPartitionsGroesse)
                #Die Speicherbelegung wird nun ausgegeben
                echo "Die Speicherbelegung sieht wie folgt aus: "
                #Visuelle Ausgabe des Speichers und die Informationen zur Speicherbelegung
	#Wenn der Befehl delete gewaehlt wurde, wird nun gefragt, wie der zu loeschende Partitionsname ist
	elif [ "$befehl" = "d" ]; then
                echo 'Bitte geben Sie den Namen der zu loeschenden Partition ein und bestaetigen Sie mit " c".'
                #Die Variable deletePartitionsName speichert den Namen bis zu dem eingegebenen c
                        read -r name
			#Nachdem der Name eingelesen wurde, wird geprueft, ob mit c bestaetigt wurde oder nicht
			#Wenn nicht, wird solange nach dem Namen gefragt, bis mit c bestaetigt wurde
			#Die Funktionen zur Ueberpruefung befinden sich in: simulationssteuerungFunktionen.sh, das zu Beginn als Quelle angegeben ist
			source ./simulationssteuerungFunktionen.sh
				while [[ ! "$name" =~ " c" ]]
				do
					frageNachNameNichtBestaetigt name
					read -r name
				done
			deletePartitionsName=$(frageNachNameBestaetigt)
                echo "Die ausgewaehlte Partition ist: $deletePartitionsName."
		#Array mit der gewaehlten Eingabe zum Namen
		array_name=($deletePartitionsName)
                #Ausgabe der Speicherbelegung
                echo "Die Speicherbelegung sieht wie folgt aus: "
                #Visuelle Ausgabe des Speichers und die Informationen zur Speicherbelegung
	#Wenn der Befehl new gewaehlt wurde, wird nun ausgegeben, dass die Speicherbelegung zurueckgesetzt wurde und die jetzige Speicherbelegung wird ausgegeben
        elif [ "$befehl" = "n" ]; then
                echo "Die Speicherbelegung wurde zurueckgesetzt. Sie sieht jetzt wie folgt aus: "
                #Visuelle Ausgabe des Speichers und die Informationen zur Speicherbelegung
	#Wenn der Befehl quit gewaehlt wurde, wird nun ausgegeben, dass der Simulator beendet wurde
        elif [ "$befehl" = "q" ]; then
                echo "Der Simulator wurde beendet."
	#Wenn keiner der vier vorherigen Befehle eingegeben wurde, wird eine Fehlermeldung ausgegeben und die derzeitige Speicherbelegung
        else
                echo "Es wurde ein ungueltiger Befehl eingegeben."
                echo "Die Speicherbelegung sieht wie folgt aus: "
                #Visuelle Ausgabe des Speichers und die Informationen zur Speicherbelegung
        fi
