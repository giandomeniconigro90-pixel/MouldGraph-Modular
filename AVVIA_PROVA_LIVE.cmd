@echo off
cd /d "%~dp0"
where py >nul 2>nul
if errorlevel 1 (
    python avvia_mouldgraph.py
) else (
    py -3 avvia_mouldgraph.py
)
if errorlevel 1 (
    echo Avvio fallito. Usa Python con le dipendenze della versione funzionante.
    pause
)
