COQFLAGS := -Q src/core
all: LambdaProof.vo TauProof.vo

%.vo: %.v
coqc $(COQFLAGS) $<
