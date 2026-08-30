# NVIDIA Silizium-Roadmap

Interaktive Einzelseite zu NVIDIAs GPU-Architekturen von **Ampere (2020)** bis
**Feynman (2028)** — Vergleichstabelle, aufklappbare Detailprofile pro
Generation und ein Atlas mit 56 Technologien.

**Live:** https://mendeltem.github.io/nvidia-roadmap/

## Inhalt

| Abschnitt | Was drin steht |
|---|---|
| Zeitstrahl | KI-Durchsatz pro GPU relativ zu A100, Wurzelskala, anklickbar |
| Vergleichstabelle | 8 Generationen × 22 Merkmale, gruppiert nach Silizium, Rechenleistung, Speicher, Interconnect, Rack-System |
| Generationen | Aufklappbare Profile: Mikroarchitektur, Kerndaten, Neuerungen, Systeme, Delta zum Vorgänger |
| Technologie-Atlas | 56 Karten, filterbar nach Bereich und Reifegrad |

Abgedeckt: Ampere · Ada Lovelace · Hopper · Blackwell · Blackwell Ultra ·
Rubin · Rubin Ultra · Feynman.

## Aufbau des Repos

    nvidia-roadmap.html   Inhaltsquelle (HTML-Fragment, ohne <html>/<head>/<body>)
    build.sh              wrappt das Fragment zu einem vollständigen Dokument
    index.html            erzeugt — GitHub Pages liefert diese Datei aus

Die Quelldatei ist bewusst ein Fragment, weil sie zusätzlich als Claude-Artifact
veröffentlicht wird und der Host dort sein eigenes `<html>`-Gerüst ergänzt.

**`index.html` nie von Hand bearbeiten.** Änderungen gehören in
`nvidia-roadmap.html`, danach:

```bash
bash build.sh
```

Keine Abhängigkeiten, kein Build-Tool, kein Netzzugriff zur Laufzeit — eine
einzelne Datei mit eingebettetem CSS und JavaScript. Systemschriften statt
Webfonts, Hell- und Dunkelmodus über `prefers-color-scheme`.

## Datenstand und Methodik

Stand **August 2026**.

- Werte für Ampere bis Rubin stammen aus NVIDIA-Datenblättern,
  Architektur-Whitepapers und GTC-Präsentationen.
- Angaben zu **Rubin Ultra und Feynman** beruhen auf Roadmap-Folien der GTC 2025
  und 2026 und sind bis zum Marktstart nicht verbindlich. Sie sind auf der Seite
  türkis markiert.
- Alle Leistungsangaben sind **dichte Werte ohne Sparsity-Verdopplung**, jeweils
  für die SXM-/OAM-Variante.
- „Relativ zu A100" vergleicht das jeweils schnellste unterstützte
  KI-Zahlenformat und mischt daher bewusst Präzisionen: Ampere rechnet FP16,
  Hopper FP8, ab Blackwell NVFP4. Ein erheblicher Teil des Faktors ~320 stammt
  aus geringerer Genauigkeit, nicht aus mehr Silizium.
- Wo NVIDIA nichts veröffentlicht hat, steht „n. v." statt einer Schätzung.

Nicht enthalten: Preise, kundenspezifische Liefertermine und Werte, die nur aus
Zuliefererberichten stammen.

## Lizenz

Der Seitencode steht unter der MIT-Lizenz (siehe `LICENSE`). Produkt- und
Markennamen gehören ihren jeweiligen Inhabern; dieses Projekt steht in keiner
Verbindung zu NVIDIA.
