input prelude.defs
input tangles/main.defs
input tangles/plottangle.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.mps";

beginfig(1);
	interim u := 5mm;

	draw plotTangle("tangles/tang56.dat", 0, 0) scaled 0.5;
endfig;

end.
