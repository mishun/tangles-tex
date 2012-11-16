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

	path a, c;

	a := (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
	c := (cos, sin) -- 2(cos, sin);


	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a shifted (-2dist, 0);
		draw a yscaled -1 shifted (-2dist, 0);
		draw a shifted (-dist, 0);
		draw a yscaled -1 shifted (-dist, 0);
		draw a;
		draw a yscaled -1;

		draw c shifted (dist, 0);
		draw c yscaled -1 shifted (dist, 0);
		draw c xscaled -1 shifted (-2dist, 0);
		draw c scaled -1 shifted (-2dist, 0);

		drawoptions();
	endgroup;

	draw thelabel(btex $\cdots$ etex, (0, 0)) withcolor textColor;

	draw emptyTangle(radius, btex $T_1$ etex) shifted (-2dist, 0);
	draw emptyTangle(radius, btex $T_2$ etex) shifted (-dist, 0);
	draw emptyTangle(radius, btex $T_s$ etex) shifted (dist, 0);
endfig;

end.
