input prelude.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j-%c.mps";

u:=4mm;
path p[];


def ddraw primary p =
	linecap := butt;
	draw p withpen (threadPen scaled 4) withcolor backgroundColor;
	linecap := rounded;
	draw p withpen threadPen withcolor threadColor;
enddef;


beginfig(31);
	z1 = 0.6dir(90) * u;
	z2 = 0.6dir(90+120) * u;
	z3 = 0.6dir(90-120) * u;
	p1 := (-0.6)[z1, z2] -- 1.6[z1, z2];
	p2 := (-0.6)[z1, z3] -- 1.6[z1, z3];
	p3 := (-0.6)[z2, z3] -- 1.6[z2, z3];

	for i = 1 upto 3: ddraw p[i]; endfor
endfig;

beginfig(32);
	z1 = 0.6dir(-90) * u;
	z2 = 0.6dir(-90+120) * u;
	z3 = 0.6dir(-90-120) * u;
	p1 := (-0.6)[z1, z2] -- 1.6[z1, z2];
	p2 := (-0.6)[z1, z3] -- 1.6[z1, z3];
	p3 := (-0.6)[z2, z3] -- 1.6[z2, z3];

	for i=1 upto 3: ddraw p[i]; endfor
endfig;

beginfig(21);
	p1 := (-1u, -1u){dir 20} .. (0.4u, 0) .. {dir 160}(-1u, 1u);
	p2 := p1 reflectedabout (origin, up);

	for i = 1 upto 2: ddraw p[i]; endfor
endfig;

beginfig(22);
	p1 := (-1u, -1u){dir 20} .. {dir 160}(-1u, 1u);
	p2 := p1 reflectedabout (origin, up);

	for i = 1 upto 2: ddraw p[i]; endfor
endfig;

beginfig(11);
	p1 := (-1u,-1u){dir 45} .. (1u, 0){-up} .. {dir 135}(-1u, 1u);
	p2 := subpath (0, length(p1) / 2) of p1;

	for i=1 upto 2: ddraw p[i]; endfor
endfig;

beginfig(12);
	p1 := (-1u, -1u){dir 25} .. (-1u, 1u);

	ddraw p1;
endfig;

end.
