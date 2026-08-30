#!/usr/bin/env bash
# Baut aus dem Artifact-Fragment (nvidia-roadmap.html) eine vollstaendige
# HTML-Seite fuer GitHub Pages (index.html).
#
# Hintergrund: Claude-Artifacts werden vom Host in ein <html>/<head>/<body>-
# Geruest eingebettet, die Quelldatei enthaelt deshalb bewusst keines.
# GitHub Pages liefert die Datei unveraendert aus und braucht ein komplettes
# Dokument. nvidia-roadmap.html bleibt die einzige Inhaltsquelle - index.html
# wird immer neu erzeugt und nie von Hand bearbeitet.
#
# Aufruf:  bash build.sh
set -euo pipefail

SRC="nvidia-roadmap.html"
OUT="index.html"

[ -f "$SRC" ] || { echo "Fehlt: $SRC" >&2; exit 1; }

# Kopfteil des Fragments = alles bis einschliesslich des ersten </style>
# (also <title> + der komplette Stylesheet-Block). Rest = Seiteninhalt.
head_part=$(awk '{print} /<\/style>/{exit}' "$SRC")
body_part=$(awk 'f{print} /<\/style>/{f=1}' "$SRC")

{
  cat <<'DOC'
<!doctype html>
<html lang="de">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="color-scheme" content="light dark">
<meta name="description" content="Interaktive NVIDIA-Roadmap von Ampere bis Feynman: Vergleichstabelle aller Architekturen, aufklappbare Detailprofile und Technologie-Atlas.">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'><rect width='16' height='16' rx='3' fill='%2376B900'/></svg>">
<style>img,svg{display:block;max-width:100%}</style>
DOC
  printf '%s\n' "$head_part"
  echo "</head>"
  echo "<body>"
  printf '%s\n' "$body_part"
  echo "</body>"
  echo "</html>"
} > "$OUT"

echo "Gebaut: $OUT ($(wc -c < "$OUT") Bytes)"
