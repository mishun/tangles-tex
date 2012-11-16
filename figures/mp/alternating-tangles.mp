input prelude.defs

verbatimtex
\input latexmp.tex
etex


spacing := 15 * 2.5;

vardef grouper(expr h) :=
	r := 0;
	l := -5;

	image( draw (r, 0) -- (l, 0) -- (l, -h) -- (r, -h) withpen altPen; )
enddef;

% offsets = [(0, 0), (3, 0), (3, 1), (6, 0), (6, 1), (6, 2), (0, 3), (0, 4), (0, 5), (0, 6)]
beginfig(1);
endfig;

beginfig(2);
endfig;

end.
