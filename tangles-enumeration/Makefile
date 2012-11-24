Targets := tangles

OutDir := out
AuxDir := intermediate

outFiles = $(addprefix $(OutDir)/, $(addsuffix $(2), $(1)))

.PHONY: all
all: DirectoryStructure $(call outFiles, $(Targets),.pdf)

.PHONY: DirectoryStructure
DirectoryStructure:
	@mkdir -p $(OutDir) $(AuxDir)

$(OutDir)/%.dvi: %.tex
	latex -aux-directory=$(AuxDir) -output-directory=$(OutDir) $<
	latex -aux-directory=$(AuxDir) -output-directory=$(OutDir) $<

.SECONDARY:
%.ps: %.dvi
	dvips -t a4 -o $@ $<

.SECONDARY:
%.pdf: %.ps
	ps2pdf $< $@

.PHONY: clean
clean:
	@rm -rf $(AuxDir)
