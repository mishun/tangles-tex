input prelude.defs
input tangles.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.mps";

beginfig(1);
	radius := 7mm;
	dist := 2.8radius;
	phi := 45;

	sin := radius * sind(phi);
	cos := radius * cosd(phi);

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
		draw (cos, -sin){dir -phi} .. (dist - cos, -sin){dir phi};
		draw (-cos, sin){dir (90 + phi)} .. (-dist + cos,  sin){dir (-90 - phi)};
		draw (-cos, -sin){dir (-90 - phi)} .. (-dist + cos, -sin){dir (90 + phi)};

		draw (dist + cos, sin) -- (dist + 2cos, 2sin);
		draw (dist + cos, -sin) -- (dist + 2cos, -2sin);
		draw (-dist - cos, sin) -- (-dist - 2cos, 2sin);
		draw (-dist - cos, -sin) -- (-dist - 2cos, -2sin);

		drawoptions();
	endgroup;

	draw emptyTangle(radius, btex $A\cap B$ etex) shifted (0, 0);
	draw emptyTangle(radius, btex $A\setminus B$ etex) shifted (-dist, 0);
	draw emptyTangle(radius, btex $B\setminus A$ etex) shifted (dist, 0);
endfig;

end.
