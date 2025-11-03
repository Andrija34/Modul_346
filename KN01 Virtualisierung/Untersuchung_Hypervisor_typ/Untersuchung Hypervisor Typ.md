# B) Virtualisierungssoftware – Untersuchung Hypervisor Typ

## Vermutung
Wir nutzen VmWare Workstation auf einem **Windows-Host**.  
Da die Software auf einem bestehenden Betriebssystem läuft, vermuten wir, dass es sich um einen **Hypervisor Typ 2 (Hosted Hypervisor)** handelt.

---

## 1. Host-System prüfen (Windows)

### CPU
Befehl in Windows (CMD):
```cmd
wmic cpu get NumberOfLogicalProcessors
```
![alt text](<Screenshot 2025-08-19 102940-1.png>)
```cmd
systeminfo | find "Gesamter physischer Speicher"
```
![alt text](<Screenshot 2025-08-19 103017.png>)
2. Erklärung

Die Virtualisierungssoftware blockiert die Zuweisung über die verfügbaren Ressourcen hinaus.
![alt text](<Screenshot 2025-08-19 104113.png>) ![alt text](<Screenshot 2025-08-19 103259.png>) ![alt text](<Screenshot 2025-08-19 103231.png>)

Grund: Da es sich um einen Hypervisor Typ 2 handelt, werden alle Ressourcen über das Windows-Hostsystem an die VM weitergegeben.

Ein Hypervisor Typ 1 (z. B. ESXi) könnte in manchen Fällen Overcommitment erlauben (mehr vCPUs oder RAM als physisch vorhanden), da er direkt auf der Hardware läuft.

6. Fazit

Unsere Vermutung hat sich bestätigt:
Das System basiert auf einem Hypervisor Typ 2.
Dies zeigt sich daran, dass die Ressourcenzuweisung streng durch das Host-System limitiert wird.