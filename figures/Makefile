
Scheme := bw
Figures := \
	tangle-sum \
	alternating-build-4-case.1 \
	alternating-build-4-case.2 \
	alternating-build-4-case.3 \
	alternating-build-4-case.4 \
	alternating-build-4-case.5 \
	alternating-build-4-case.6 \
	alternating-build-4-case.7 \
	alternating-build-4-case.8 \
	chord-diagram-with-numbers \
	d4-group-basis.1 \
	d4-group-basis.2 \
	d4-subgroups \
	nonalternating-tangles.1 \
	nonalternating-tangles.2 \
	nonalternating-tangles.3 \
	one-side-crossings \
	pass.1 \
	pass.2 \
	rational-and-4-tangle \
	reidemeister.11 \
	reidemeister.12 \
	reidemeister.21 \
	reidemeister.22 \
	reidemeister.31 \
	reidemeister.32 \
	root-code-example.1 \
	root-code-example.2 \
	sequential-border-deletion \
	simplest-projection \
	tangle-border-deletion.1 \
	tangle-border-deletion.2 \
	tangle-border-deletion.3 \
	tangle-decomp-example \
	tangle-decomp-proof \
	tangle-decomp-theorem \
	tangle-to-graph \
	virtual.1 \
	virtual.2 \
	virtual.3


EpsDir := eps/$(Scheme)
AuxDir := obj
IncDir := defs
MpDir  := mp
SchDir := schemes
SchFile := scheme-mutable.defs

LatexFlags = -aux-directory=$(AuxDir) -output-directory=$(AuxDir)
MPostFlags = -tex="latex -quiet" -output-directory=$(AuxDir) -aux-directory=$(AuxDir) -include-directory=$(IncDir)

define MakeMpsFromMp
	mpost $(MPostFlags) $<
endef

TempTexFile = $<.temp.tex

define MakeEpsFromMps
	@sed 's/@??@/$(subst /,\/,$<)/' "$(IncDir)/eps-template.tex" > "$(TempTexFile)"
	@latex -quiet $(LatexFlags) "$(TempTexFile)"
	@dvips -quiet -E -o "$@" "$(basename $(TempTexFile))"
endef


.PHONY: all
all: DirectoryStructure SchemeStructure Pictures

.PHONY: DirectoryStructure
DirectoryStructure:
	@mkdir -p "$(AuxDir)"
	@mkdir -p "$(EpsDir)"

.PHONY: SchemeStructure
SchemeStructure:
	@cp $(SchDir)/$(Scheme).defs $(IncDir)/$(SchFile)

.PHONY: Pictures
Pictures: $(addprefix $(EpsDir)/, $(addsuffix .eps, $(Figures)))
	@rm -f $(IncDir)/$(SchFile)


$(AuxDir)/%.1: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.2: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.3: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.4: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.5: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.6: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.7: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.8: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.9: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.10: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.11: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.12: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.21: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.22: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.31: $(MpDir)/%.mp
	$(MakeMpsFromMp)

$(AuxDir)/%.32: $(MpDir)/%.mp
	$(MakeMpsFromMp)


$(AuxDir)/%.mps: $(MpDir)/%.mp
	$(MakeMpsFromMp)


$(EpsDir)/%.eps: $(AuxDir)/%.mps
	$(MakeEpsFromMps)

$(EpsDir)/%.eps: $(AuxDir)/%
	$(MakeEpsFromMps)


.PHONY: clean
clean:
	@rm -rf "$(AuxDir)"
	@rm -f $(MpDir)/*.mpx
	@rm -f $(IncDir)/$(SchFile)
