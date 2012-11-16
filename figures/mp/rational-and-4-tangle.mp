input prelude.defs
input tangles/main.defs
input tangles/plottangle.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.mps";

beginfig(1);
	interim u := 17mm;

	draw plotTangle("tangles/tang2.dat", 1, 0) shifted (-2.5 u, 0);
	draw plotTangle("tangles/tang3.dat", 1, 0);
endfig;

end.
