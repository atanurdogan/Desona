##############################################################################
# Minimal-Makefile für mehrere .v-Dateien in src/core
#  - Jeder Rezept-Block beginnt mit EXACT **einem** TAB (kein Leerzeichen!)
##############################################################################

COQC      ?= coqc                       # CI stellt das Binary bereit
COQFLAGS  ?= -Q src/core Core           # Namespace:  "Core.<Modulname>"

# ---------------------------------------------------------------------------
# Ziele
# ---------------------------------------------------------------------------

TARGETS := \
  src/core/LambdaProof.vo \
  src/core/TauProof.vo

all: $(TARGETS)                         # »make« baut beide .vo-Dateien

# ---------------------------------------------------------------------------
# Generische Regel:  *.v  →  *.vo
# ---------------------------------------------------------------------------

src/core/%.vo: src/core/%.v
	$(COQC) $(COQFLAGS) $<            #  ← dieser TAB ist entscheidend!

# ---------------------------------------------------------------------------
# Aufräumen
# ---------------------------------------------------------------------------

.PHONY: clean
clean:
	rm -f $(TARGETS) src/core/*.glob
