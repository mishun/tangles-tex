input prelude.defs
input tangles.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.mps";


beginfig(1);
	radius := 7mm;
	dist := 4radius;
	phi := 45;

	sin := radius * sind(phi);
	cos := radius * cosd(phi);
	path p, q;
	p := (-dist + cos, -sin){dir -phi} .. (dist - cos, -sin){dir phi};
	q := (0, 0) -- (0, -100radius);

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw (-dist - radius, 0) -- (-dist - 2.5radius, 0);
		draw (dist + radius, 0) -- (dist + 2.5radius, 0);
		draw (0, radius) -- (0, 2.5radius);
		draw (-radius, 0) -- (-dist + radius, 0);
		draw (radius, 0) -- (dist - radius, 0);
		draw p;

		drawoptions();
	endgroup;

	begingroup
		drawoptions(withpen borderPen dashed evenly withcolor borderColor);

		draw fullcircle xscaled 7radius yscaled 3.4radius shifted (-0.5dist, 0);
		draw fullcircle xscaled 7radius yscaled 3.4radius shifted (0.5dist, 0);

		drawoptions();
	endgroup;

	begingroup
		drawoptions(withcolor textColor);

		draw thelabel.top(btex $\times a$ etex, (-dist - 2radius, 0));
		draw thelabel.top(btex $\times b$ etex, (dist + 2radius, 0));
		draw thelabel.rt(btex $\times c$ etex, (0, 2radius));
		draw thelabel.top(btex $\times d$ etex, 1/2[(-radius, 0), (-dist + radius, 0)]);
		draw thelabel.top(btex $\times e$ etex, 1/2[(radius, 0), (dist - radius, 0)]);
		draw thelabel.bot(btex $\times f$ etex, p intersectionpoint q);

		draw thelabel.bot(btex $A$ etex, (-0.5dist, 1.7radius));
		draw thelabel.bot(btex $B$ etex, (0.5dist, 1.7radius));

		drawoptions();
	endgroup;

	draw emptyTangle(radius, btex $A\cap B$ etex) shifted (0, 0);
	draw emptyTangle(radius, btex $A\setminus B$ etex) shifted (-dist, 0);
	draw emptyTangle(radius, btex $B\setminus A$ etex) shifted (dist, 0);
endfig;

end.
