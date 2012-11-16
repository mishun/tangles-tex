input prelude.defs

verbatimtex
\input latexmp.tex
etex


radius := 2mm;
dist := 2.8radius;
phi := 45;

sin := radius * sind(phi);
cos := radius * cosd(phi);


picture subt;
subt := image(
	path b;
	b := fullcircle scaled 2radius;

	fill b withcolor highlightingColor;
	draw b withpen borderPen withcolor borderColor;
);


beginfig(1);
	path a, c, d;

	a := (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
	c := (cos, sin) -- 2(cos, sin);
	d := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} .. (dist, 0){dir -phi} -- (dist + 2cos, -2sin){dir phi};

	draw thelabel(btex $\cdots$ etex, (-dist, 0)) withcolor textColor;

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a yscaled  1 shifted (-2dist, 0);
		draw a yscaled -1 shifted (-2dist, 0);
		draw c xscaled -1 shifted (-2dist, 0);
		draw c  scaled -1 shifted (-2dist, 0);
		draw d yscaled  1;
		draw d yscaled -1;

		drawoptions();
	endgroup;

	begingroup
		draw subt shifted (-2dist, 0);
		draw fullcircle xscaled (2dist + 3radius) yscaled 4radius shifted (-dist, 0) dashed evenly withpen borderPen withcolor borderColor;
	endgroup;
endfig;

beginfig(2);
	path a, d;

	a := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} -- (2cos, 2sin){dir phi};
	d := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} .. (dist, 0){dir -phi} -- (dist + 2cos, -2sin){dir phi};

	draw thelabel(btex $\cdots$ etex, (-dist, 0)) withcolor textColor;

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a xscaled -1 yscaled  1 shifted (-2dist, 0);
		draw a xscaled -1 yscaled -1 shifted (-2dist, 0);
		draw d yscaled  1;
		draw d yscaled -1;

		drawoptions();
	endgroup;

	draw fullcircle xscaled (2dist + 3radius) yscaled 4radius shifted (-dist, 0) withpen borderPen dashed evenly withcolor borderColor;
endfig;

beginfig(3);
	path a, c, d;

	a := (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
	c := (cos, sin) -- 2(cos, sin);
	d := (cos, sin){dir phi} .. (dist, 0){dir -phi} -- (dist + 2cos, -2sin){dir phi};

	draw thelabel(btex $\cdots$ etex, (-dist, 0)) withcolor textColor;

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a yscaled  1 shifted (-2dist, 0);
		draw a yscaled -1 shifted (-2dist, 0);
		draw a yscaled  1 shifted ( -dist, 0);
		draw a yscaled -1 shifted ( -dist, 0);
		draw c xscaled -1 shifted (-2dist, 0);
		draw c  scaled -1 shifted (-2dist, 0);
		draw d yscaled  1;
		draw d yscaled -1;

		drawoptions();
	endgroup;

	begingroup
		draw subt shifted (-2dist, 0);
		draw subt shifted (0, 0);
		draw fullcircle xscaled (2dist + 3radius) yscaled 4radius shifted (-dist, 0) dashed evenly withpen borderPen withcolor borderColor;
	endgroup;
endfig;

beginfig(4);
	path a, d, e;

	a := (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
	d := (cos, sin){dir phi} .. (dist, 0){dir -phi} -- (dist + 2cos, -2sin){dir phi};
	e := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} -- (2cos, 2sin){dir phi};

	draw thelabel(btex $\cdots$ etex, (-dist, 0)) withcolor textColor;

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a yscaled  1 shifted (-dist, 0);
		draw a yscaled -1 shifted (-dist, 0);
		draw d yscaled  1;
		draw d yscaled -1;
		draw e xscaled -1 yscaled  1 shifted (-2dist, 0);
		draw e xscaled -1 yscaled -1 shifted (-2dist, 0);

		drawoptions();
	endgroup;

	begingroup
		draw subt shifted (0, 0);
		draw fullcircle xscaled (2dist + 3radius) yscaled 4radius shifted (-dist, 0) dashed evenly withpen borderPen withcolor borderColor;
	endgroup;
endfig;

beginfig(5);
	path a, c, d;

	a := (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
	c := (cos, sin) -- 2(cos, sin);
	d := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} .. (dist - cos, sin){dir -phi};

	draw thelabel(btex $\cdots$ etex, (-dist, 0)) withcolor textColor;

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a yscaled  1 shifted (-2dist, 0);
		draw a yscaled -1 shifted (-2dist, 0);
		draw c xscaled -1 shifted (-2dist, 0);
		draw c  scaled -1 shifted (-2dist, 0);
		draw c yscaled  1 shifted (dist, 0);
		draw c yscaled -1 shifted (dist, 0);
		draw d yscaled  1;
		draw d yscaled -1;

		drawoptions();
	endgroup;

	begingroup
		draw subt shifted (-2dist, 0);
		draw subt shifted (dist, 0);
		draw fullcircle xscaled (2dist + 3radius) yscaled 4radius shifted (-dist, 0) dashed evenly withpen borderPen withcolor borderColor;
	endgroup;
endfig;

beginfig(6);
	path a, c, d;

	a := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} -- (2cos, 2sin){dir phi};
	c := (cos, sin) -- 2(cos, sin);
	d := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} .. (dist - cos, sin){dir -phi};

	draw thelabel(btex $\cdots$ etex, (-dist, 0)) withcolor textColor;

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a xscaled -1 yscaled  1 shifted (-2dist, 0);
		draw a xscaled -1 yscaled -1 shifted (-2dist, 0);
		draw d yscaled  1;
		draw d yscaled -1;
		draw c yscaled  1 shifted (dist, 0);
		draw c yscaled -1 shifted (dist, 0);

		drawoptions();
	endgroup;

	begingroup
		draw subt shifted (dist, 0);
		draw fullcircle xscaled (2dist + 3radius) yscaled 4radius shifted (-dist, 0) dashed evenly withpen borderPen withcolor borderColor;
	endgroup;
endfig;

beginfig(7);
	path a, c, d;

	a := (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
	c := (cos, sin) -- 2(cos, sin);

	draw thelabel(btex $\cdots$ etex, (-dist, 0)) withcolor textColor;

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a yscaled  1 shifted (-2dist, 0);
		draw a yscaled -1 shifted (-2dist, 0);
		draw a yscaled  1 shifted ( -dist, 0);
		draw a yscaled -1 shifted ( -dist, 0);
		draw c xscaled -1 shifted (-2dist, 0);
		draw c  scaled -1 shifted (-2dist, 0);
		draw a yscaled  1;
		draw a yscaled -1;
		draw c yscaled  1 shifted (dist, 0);
		draw c yscaled -1 shifted (dist, 0);

		drawoptions();
	endgroup;

	begingroup
		draw subt shifted (-2dist, 0);
		draw subt shifted (0, 0);
		draw subt shifted (dist, 0);
		draw fullcircle xscaled (2dist + 3radius) yscaled 4radius shifted (-dist, 0) dashed evenly withpen borderPen withcolor borderColor;
	endgroup;
endfig;

beginfig(8);
	path a, c, e;

	a := (cos, sin){dir phi} .. (dist - cos, sin){dir -phi};
	c := (cos, sin) -- 2(cos, sin);
	e := (-0.5dist, -0.7radius){dir 0} .. (0, 0){dir phi} -- (2cos, 2sin){dir phi};

	draw thelabel(btex $\cdots$ etex, (-dist, 0)) withcolor textColor;

	begingroup
		drawoptions(withpen threadPen withcolor threadColor);

		draw a yscaled  1 shifted (-dist, 0);
		draw a yscaled -1 shifted (-dist, 0);
		draw a yscaled  1;
		draw a yscaled -1;
		draw c yscaled  1 shifted (dist, 0);
		draw c yscaled -1 shifted (dist, 0);
		draw e xscaled -1 yscaled  1 shifted (-2dist, 0);
		draw e xscaled -1 yscaled -1 shifted (-2dist, 0);

		drawoptions();
	endgroup;

	begingroup
		draw subt shifted (0, 0);
		draw subt shifted (dist, 0);
		draw fullcircle xscaled (2dist + 3radius) yscaled 4radius shifted (-dist, 0) dashed evenly withpen borderPen withcolor borderColor;
	endgroup;
endfig;

end.
