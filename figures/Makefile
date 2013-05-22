Figures := \
	tangle-sum \
	alternating-build-4-case-1 \
	alternating-build-4-case-2 \
	alternating-build-4-case-3 \
	alternating-build-4-case-4 \
	alternating-build-4-case-5 \
	alternating-build-4-case-6 \
	alternating-build-4-case-7 \
	alternating-build-4-case-8 \
	chord-diagram-with-numbers \
	d4-group-basis-1 \
	d4-group-basis-2 \
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

IncDir  := defs
AuxDir  := intermediate
Schemes := bw color
Tags    := %.mps %-0.mps %-1.mps %-2.mps %-3.mps %-4.mps %-5.mps %-6.mps %-7.mps %-8.mps %-9.mps %-10.mps %-11.mps %-12.mps %-21.mps %-22.mps %-31.mps %-32.mps

vpath %.mp mp

.PHONY: all
all: DirectoryStructure $(addprefix eps/bw/, $(addsuffix .eps, $(Figures))) $(addprefix eps/color/, $(addsuffix .eps, $(Figures)))

.PHONY: DirectoryStructure
DirectoryStructure:
	@mkdir -p $(addprefix $(AuxDir)/, $(Schemes)) $(addprefix eps/, $(Schemes))

.SECONDARY:
$(addprefix $(AuxDir)/bw/, $(Tags)): %.mp
	mpost -tex="latex -quiet" -output-directory=$(AuxDir)/bw -aux-directory=$(AuxDir)/bw -include-directory=$(IncDir) -include-directory=schemes/bw $<

.SECONDARY:
$(addprefix $(AuxDir)/color/, $(Tags)): %.mp
	mpost -tex="latex -quiet" -output-directory=$(AuxDir)/color -aux-directory=$(AuxDir)/color -include-directory=$(IncDir) -include-directory=schemes/color $<

eps/bw/%.eps: $(AuxDir)/bw/%.mps
	@sed 's/@??@/$(subst /,\/,$<)/' "$(IncDir)/eps-template.tex" > "$<.temp.tex"
	@latex -quiet -aux-directory=$(AuxDir)/bw -output-directory=$(AuxDir)/bw "$<.temp.tex"
	@dvips -quiet -E -o "$@" "$(basename $<.temp.tex)"

eps/color/%.eps: $(AuxDir)/color/%.mps
	@sed 's/@??@/$(subst /,\/,$<)/' "$(IncDir)/eps-template.tex" > "$<.temp.tex"
	@latex -quiet -aux-directory=$(AuxDir)/color -output-directory=$(AuxDir)/color "$<.temp.tex"
	@dvips -quiet -E -o "$@" "$(basename $<.temp.tex)"

.PHONY: clean
clean:
	rm -rf $(AuxDir)
	rm -f mp/*.mpx
