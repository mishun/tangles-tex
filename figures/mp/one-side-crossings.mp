input prelude.defs
input tangles.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.mps";

beginfig(1);
	radius := 5mm;
	dist := 2.8radius;
	phi := 45;

	sin := radius * sind(phi);
	cos := radius * cosd(phi);

	path a, c;

	a := (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
	c := (cos, sin) -- 2(cos, sin);

	path d, e;

	d := (-dist + cos, sin){dir phi} .. (0, 0){dir -phi} .. (0.5dist, -0.7radius){dir 0};
	e := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} -- (2cos, 2sin){dir phi};

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a yscaled  1 shifted (-dist, 0);
		draw a yscaled -1 shifted (-dist, 0);
		draw a yscaled  1;
		draw a yscaled -1;

		draw c xscaled -1 shifted (-dist, 0);
		draw c  scaled -1 shifted (-dist, 0);

		draw d yscaled  1 shifted (2dist, 0);
		draw d yscaled -1 shifted (2dist, 0);

		draw e yscaled  1 shifted (4dist, 0);
		draw e yscaled -1 shifted (4dist, 0);

		drawoptions()
	endgroup;

	begingroup
		draw thelabel(btex $\cdots$ etex, (0, 0)) withcolor textColor;
		draw thelabel(btex $\cdots$ etex, (3dist, 0)) withcolor textColor;
	endgroup;

	draw emptyTangle(radius, btex etex) shifted (-dist, 0);
	draw emptyTangle(radius, btex etex) shifted (+dist, 0);
endfig;

end.
