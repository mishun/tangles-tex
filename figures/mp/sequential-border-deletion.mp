input prelude.defs
input tangles/main.defs
input tangles/plottangle.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.mps";

beginfig(1);
	interim u := 8mm;

	for i = 1 upto 5:
		draw plotTangle("tangles/tang5" & decimal(i) & ".dat", 0, 0);
		currentpicture := currentpicture shifted (-1.5u, 0);
		draw thelabel(btex ${}\to{}$ etex, (0, 0)) withcolor textColor;
		currentpicture := currentpicture shifted (-1.5u, 0);
	endfor
	draw plotTangle("tangles/tang56.dat", 0, 0);
endfig;

end.
