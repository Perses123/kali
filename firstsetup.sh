#!/bin/bash

# Benutzer erstellen und sudo-Rechte geben
sudo useradd -m -p $(openssl passwd -1 osiris) osiris
sudo usermod -aG sudo osiris

# Paketmanager aktualisieren und erforderliche Pakete installieren
sudo apt update
sudo apt upgrade -y
sudo apt install tilix code tor -y

# Visual Studio Code herunterladen und installieren
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code -y

# Tor-Dienst starten
sudo service tor start

echo "Alle Schritte abgeschlossen."
