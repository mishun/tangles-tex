
HsFiguresList := \
	$(addprefix nonalt-collisions-jones-double-jones-, 1 2 3) \
	$(addprefix tangle-doubling-example-, 1 2) \
	$(addprefix tangle-jones-skein-example-, 1 2 3 4 5) \
	$(addprefix alternating-build-4-case-, 1 2 3 4 5 6 7 8) \
	$(addprefix d4-group-basis-, 1 2 3) \
	$(addprefix alternating-tangles-, 12 22 23 32 33 34 42 43 44 45 52 53 54 55 56) \
	$(addprefix nonalt-tangles-, 23 33 34 42 43 44 45) \
	$(addprefix border-deletion-sequence-, 1 2 3 4 5 6) \
	$(addprefix tangle-border-operation-, 11 12 21 22 31 32) \
	$(addprefix reidemeister-, 11 12 21 22 31 32) \
	$(addprefix pass-, 11 12 21 22) \
	$(addprefix tangle-decomp-example-, 1 2) \
	$(addprefix root-code-example1-, 1 2) \
	chord-diagram-with-numbers \
	rational-and-4-tangle \
	one-side-crossings \
	simplest-projection

MpFiguresList := \
	$(addprefix nonalternating-tangles-, 1 2 3) \
	$(addprefix root-code-example-, 1 2) \
	$(addprefix virtual-, 1 2 3) \
	tangle-sum \
	d4-subgroups \
	tangle-decomp-proof \
	tangle-decomp-theorem \
	tangle-to-graph


OutDir  := eps
IncDir  := defs
AuxDir  := intermediate
Schemes := bw color
Tags    := % %-0 %-1 %-2 %-3 %-4 %-5 %-6 %-7 %-8 %-9 \
	%-10 %-11 %-12 %-13 %-14 %-15 %-16 %-17 %-18 %-19 \
	%-20 %-21 %-22 %-23 %-24 %-25 %-26 %-27 %-28 %-29 \
	%-30 %-31 %-32 %-33 %-34 %-35 %-36 %-37 %-38 %-39 \
	%-40 %-41 %-42 %-43 %-44 %-45 %-46 %-47 %-48 %-49 \
	%-50 %-51 %-52 %-53 %-54 %-55 %-56 %-57 %-58 %-59


vpath %.mp mp
vpath %.hs hs


.PHONY: all
all: HsFigures MpFigures


.PHONY: DirectoryStructure
DirectoryStructure:
	mkdir -p $(foreach d, $(OutDir) $(AuxDir), $(addprefix $(d)/, $(Schemes)))

.PHONY: MpFigures
MpFigures: DirectoryStructure $(foreach sch, $(Schemes), $(addprefix $(OutDir)/$(sch)/, $(addsuffix .eps, $(MpFiguresList))))

.PHONY: HsFigures
HsFigures: DirectoryStructure $(foreach sch, $(Schemes), $(addprefix $(OutDir)/$(sch)/, $(addsuffix .eps, $(HsFiguresList))))


define MpostRule
.SECONDARY:
$(addprefix $(AuxDir)/$(1)/, $(addsuffix .mps, $(Tags))): %.mp $(IncDir)/prelude.defs $(IncDir)/schemes/$(1)/scheme.defs
	mpost -tex="latex -quiet" -output-directory=$(AuxDir)/$(1) -aux-directory=$(AuxDir)/$(1) -include-directory=$(IncDir) -include-directory=defs/schemes/$(1) $$<
#	mv $$(notdir $$(basename $$<))* $$(dir $$@)
endef
$(foreach sch,$(Schemes),$(eval $(call MpostRule,$(sch))))

define HsRule
.SECONDARY:
$(AuxDir)/$(1)/%.hs.exe: %.hs $(IncDir)/Figures.hs $(IncDir)/schemes/$(1)/FigureScheme.hs
	ghc --make -i=$(IncDir)/ -i=$(IncDir)/schemes/$(1)/ -hidir=$$(dir $$@) -odir=$$(dir $$@) -o $$@ $$<
	rm -f $$(dir $$@)Main.*
endef
$(foreach sch,$(Schemes),$(eval $(call HsRule,$(sch))))

.SECONDARY:
$(addprefix $(AuxDir)/, $(addsuffix .mps, $(Tags))): $(AuxDir)/%.hs.exe
	$< $(dir $@)


$(OutDir)/%.eps: $(AuxDir)/%.mps
	sed 's/@??@/$(subst /,\/,$<)/' $(IncDir)/eps-template.tex > $<.temp.tex
	latex -quiet -aux-directory=$(dir $<) -output-directory=$(dir $<) $<.temp.tex
	dvips -quiet -E -o $@ $(basename $<.temp.tex)


.PHONY: clean
clean:
	rm -rf $(AuxDir)
	rm -f mp/*.mpx
