
HsFiguresList := \
	nonalt-collisions-jones-double-jones-1 \
	nonalt-collisions-jones-double-jones-2 \
	nonalt-collisions-jones-double-jones-3 \
	tangle-doubling-example-1 \
	tangle-doubling-example-2 \
	tangle-jones-skein-example-1 \
	tangle-jones-skein-example-2 \
	tangle-jones-skein-example-3 \
	tangle-jones-skein-example-4 \
	tangle-jones-skein-example-5 \
	alternating-build-4-case-1 \
	alternating-build-4-case-2 \
	alternating-build-4-case-3 \
	alternating-build-4-case-4 \
	alternating-build-4-case-5 \
	alternating-build-4-case-6 \
	alternating-build-4-case-7 \
	alternating-build-4-case-8 \
	d4-group-basis-1 \
	d4-group-basis-2 \
	d4-group-basis-3 \
	alternating-tangles-1

MpFiguresList := \
	tangle-sum \
	chord-diagram-with-numbers \
	d4-subgroups \
	nonalternating-tangles-1 \
	nonalternating-tangles-2 \
	nonalternating-tangles-3 \
	one-side-crossings \
	pass-1 \
	pass-2 \
	rational-and-4-tangle \
	reidemeister-11 \
	reidemeister-12 \
	reidemeister-21 \
	reidemeister-22 \
	reidemeister-31 \
	reidemeister-32 \
	root-code-example-1 \
	root-code-example-2 \
	sequential-border-deletion \
	simplest-projection \
	tangle-border-deletion-1 \
	tangle-border-deletion-2 \
	tangle-border-deletion-3 \
	tangle-decomp-example \
	tangle-decomp-proof \
	tangle-decomp-theorem \
	tangle-to-graph \
	virtual-1 \
	virtual-2 \
	virtual-3


OutDir  := eps
IncDir  := defs
AuxDir  := intermediate
Schemes := bw color
Tags    := % %-0 %-1 %-2 %-3 %-4 %-5 %-6 %-7 %-8 %-9 %-10 %-11 %-12 %-21 %-22 %-31 %-32


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
$(addprefix $(AuxDir)/$(1)/, $(addsuffix .mps, $(Tags))): %.mp
	mpost -tex="latex -quiet" -output-directory=$(AuxDir)/$(1) -aux-directory=$(AuxDir)/$(1) -include-directory=$(IncDir) -include-directory=defs/schemes/$(1) $$<
#	mv $$(notdir $$(basename $$<))* $$(dir $$@)
endef
$(foreach sch,$(Schemes),$(eval $(call MpostRule,$(sch))))

define HsRule
.SECONDARY:
$(AuxDir)/$(1)/%.hs.exe: %.hs
	ghc --make -i=defs/ -i=defs/schemes/$(1)/ -hidir=$$(dir $$@) -odir=$$(dir $$@) -o $$@ $$<
	rm -f $$(dir $$@)/Main.*
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
