# Hypervisoren – Typ 1 und Typ 2

## Was ist ein Hypervisor?
Ein **Hypervisor** (auch *Virtual Machine Monitor*, VMM) ist eine Software- oder Firmware-Schicht, die das Erstellen und Verwalten mehrerer **virtueller Maschinen (VMs)** auf einem einzigen physischen Rechner ermöglicht.  
Jede VM verhält sich so, als laufe sie auf eigenständiger Hardware. Der Hypervisor verteilt dabei die vorhandenen Ressourcen wie CPU, RAM und Netzwerke auf die VMs.

---

## Hypervisor Typ 1 (Bare-Metal)
- Wird **direkt auf der Hardware** installiert, ohne darunterliegendes Betriebssystem.  
- Hat direkten Zugriff auf Hardware → **hohe Performance und geringe Latenz**.  
- **Sicherer**, da keine zusätzliche Schicht (Host-OS) als Angriffsfläche existiert.  
- Wird vor allem in **Rechenzentren, Cloud-Umgebungen und produktiven Systemen** eingesetzt.  
- Beispiele: **VMware ESXi**, **Microsoft Hyper-V**, **Xen**, **KVM**.

---

## Hypervisor Typ 2 (Hosted)
- Läuft **auf einem bestehenden Betriebssystem** wie eine normale Anwendung.  
- Nutzt Ressourcen über das Host-OS → **geringere Leistung** und höhere Latenz.  
- **Einfach zu installieren und nutzen**, daher beliebt bei Entwicklern, Testumgebungen oder Privatanwendern.  
- Sicherheit eingeschränkt, da die VMs vom Host-OS abhängen.  
- Beispiele: **Oracle VirtualBox**, **VMware Workstation**, **Parallels Desktop**.

---

## Vergleich: Typ 1 vs. Typ 2

| Merkmal         | Typ 1 (Bare-Metal)                        | Typ 2 (Hosted)                          |
|------------------|-------------------------------------------|------------------------------------------|
| **Installation** | Direkt auf der Hardware                   | Als Anwendung auf einem Host-Betriebssystem |
| **Performance**  | Hoch (direkter Hardwarezugriff)           | Niedriger (geht über Host-OS)            |
| **Sicherheit**   | Sehr hoch (isolierte VMs)                 | Abhängig vom Host-OS                     |
| **Komplexität**  | Höhere Anforderungen, komplexer           | Einfach, benutzerfreundlich              |
| **Einsatzgebiet**| Rechenzentren, Cloud, Produktivsysteme    | Desktop, Entwicklung, Testumgebungen     |
| **Beispiele**    | VMware ESXi, Hyper-V, Xen, KVM            | VirtualBox, VMware Workstation, Parallels |

---

## Fazit
Ein Hypervisor ermöglicht Virtualisierung, also das gleichzeitige Ausführen mehrerer Betriebssysteme auf derselben Hardware.  
- **Typ 1** bietet höchste Leistung und Sicherheit – ideal für professionelle Umgebungen.  
- **Typ 2** ist einfacher, aber weniger leistungsstark – ideal für Lern-, Entwicklungs- und Testzwecke.
