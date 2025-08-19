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
![Screenshot Host CPU](images/host_cpu.png)

systeminfo | find "Gesamter physischer Speicher"
![Screenshot Host RAM](host_ram.png)
```
2. Erklärung

Die Virtualisierungssoftware blockiert die Zuweisung über die verfügbaren Ressourcen hinaus.

Grund: Da es sich um einen Hypervisor Typ 2 handelt, werden alle Ressourcen über das Windows-Hostsystem an die VM weitergegeben.

Ein Hypervisor Typ 1 (z. B. ESXi) könnte in manchen Fällen Overcommitment erlauben (mehr vCPUs oder RAM als physisch vorhanden), da er direkt auf der Hardware läuft.

6. Fazit

Unsere Vermutung hat sich bestätigt:
Das System basiert auf einem Hypervisor Typ 2.
Dies zeigt sich daran, dass die Ressourcenzuweisung streng durch das Host-System limitiert wird.
