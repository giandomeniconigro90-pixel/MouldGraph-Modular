# MouldGraph (versione modulare)

App desktop per l'analisi dei dati delle presse industriali e il monitoraggio live
(Cannon, Persico, Krauss Maffei). Python, CustomTkinter, Matplotlib.

Questa è la versione **divisa in moduli** di [MouldGraph](https://github.com/giandomeniconigro90-pixel/MouldGraph).
Il codice viene dal monolite `log_analyzer_desktop_live.py` (commit `a5d62b3` di MouldGraph).
Ogni funzione, classe e metodo è stato copiato senza modifiche, e il confronto
dell'albero sintattico pezzo per pezzo lo ha confermato. Il monolite originale resta
intatto nel repository MouldGraph.

## Avvio

```
pip install -r requirements.txt
python avvia_mouldgraph.py
```

## Exe (PyInstaller)

```
pyinstaller --noconfirm MouldGraph.spec
```

## Struttura

| File | Contenuto |
|---|---|
| `avvia_mouldgraph.py` | Punto di ingresso |
| `mouldgraph/app.py` | `LogAnalyzerApp`: finestra principale, `__init__`, `_build_ui`; compone i mixin dei tab |
| `mouldgraph/tabs/tab_analisi.py` | Tab Analisi log: apertura, filtri, statistiche, timeline, AI, export JSON/CSV |
| `mouldgraph/tabs/tab_siemens.py` | Tab Siemens |
| `mouldgraph/tabs/tab_grafici.py` | Tab Grafici: anteprima, schermo intero, note, generazione PDF |
| `mouldgraph/tabs/tab_csv.py` | Tab CSV: grafico interattivo, confronto, range, anomalie, export |
| `mouldgraph/tabs/tab_live.py` | Tab Live Data: seriale/simulazione, allarmi, multi-grafico, export |
| `mouldgraph/tabs/tab_help.py` | Tab Guida |
| `mouldgraph/plot_canvas.py` | `InteractivePlotCanvas` (grafico interattivo matplotlib) |
| `mouldgraph/widgets.py` | `TimelineCanvas`, `LineChart`, `PumpCanvas` |
| `mouldgraph/csv_parsers.py` | Parser CSV universale e ciclo lungo, serie, interpolazione |
| `mouldgraph/log_analysis.py` | Parsing log testuali, timeline, analisi AI, anomalie, CSV Siemens |
| `mouldgraph/csv_validation.py` | Validazione CSV e riconoscimento profilo |
| `mouldgraph/pdf_plant.py` | Report PDF plant (profili presse/stampi) |
| `mouldgraph/pdf_lamborghini.py` | Report PDF Lamborghini / Persico v8, pacchetti nativi |
| `mouldgraph/pdf_front_firewall.py` | Report PDF Front Firewall e riconoscimento tipo CSV |
| `mouldgraph/constants.py` | Colori e costanti condivise |
| `mouldgraph/serial_support.py` | Supporto opzionale pyserial |
| `mouldgraph/ui_utils.py` | `_isolate_scroll` |

I metodi di un tab si modificano nel file del tab. Tutti finiscono comunque in
`LogAnalyzerApp`, quindi `self.` funziona tra un tab e l'altro.

## Test

```
python -m unittest discover -s tests
```

Prove manuali: `PROVA_GRAFICO.md` e `PROVA_LIVE.md` (avvio rapido con i file `AVVIA_PROVA_*.cmd`).

## Problemi noti

- Tab Grafici: le note non vengono salvate, perché `_NOTES_FILE` non è definito
  e l'errore è nascosto da `except Exception: pass`. È ereditato dal monolite.
