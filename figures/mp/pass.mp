input prelude.defs
input tangles.defs

verbatimtex
\input latexmp.tex
etex

phi := 30;

vardef passTangle(expr radius, txt) =
	sin := radius * sind(phi);
	cos := radius * cosd(phi);
	tails := 3 * radius;

	image(
		begingroup
			drawoptions(withpen threadPen withcolor threadColor);

			draw (-cos, sin) -- (-tails, sin);
			draw (-cos, -sin) -- (-tails, -sin);

			draw (cos, sin) -- (tails, sin);
			draw (cos, -sin) -- (tails, -sin);

			drawoptions();
		endgroup;

		draw emptyTangle(radius, txt);
	)
enddef;


dist := 18mm;
radius := 4mm;
offset := 2.0 radius;
hole := 2mm;

beginfig(1);
	picture l, r;

	l := image(
		draw (-offset, -1.5 radius) -- (-offset, 1.5 radius) withpen threadPen withcolor threadColor;

		fill (fullcircle scaled hole shifted (-offset, radius * sind(phi))) withcolor backgroundColor;
		fill (fullcircle scaled hole shifted (-offset, -radius * sind(phi))) withcolor backgroundColor;

		draw passTangle(radius, btex $T$ etex);
	);

	r := image(
		draw (offset, -1.5 radius) -- (offset, 1.5 radius) withpen threadPen withcolor threadColor;

		fill (fullcircle scaled hole shifted (offset, radius * sind(phi))) withcolor backgroundColor;
		fill (fullcircle scaled hole shifted (offset, -radius * sind(phi))) withcolor backgroundColor;

		draw passTangle(radius, btex $T$ etex);
	);

	draw l shifted (-dist, 0);
	draw r shifted (dist, 0);
	draw thelabel(btex $\backsimeq$ etex, (0, 0));
endfig;


beginfig(2);
	picture l, r;

	l := image(
		draw (0, radius){dir 90} .. (-offset, radius * sind(phi)){dir 270} -- (-offset, -radius * sind(phi)){dir 270} .. (0, -radius){dir 90} withpen threadPen withcolor threadColor;

		fill (fullcircle scaled hole shifted (-offset, radius * sind(phi))) withcolor backgroundColor;
		fill (fullcircle scaled hole shifted (-offset, -radius * sind(phi))) withcolor backgroundColor;

		draw passTangle(radius, btex $T$ etex);
	);

	r := image(
		draw (0, radius){dir 90} .. (offset, radius * sind(phi)){dir 270} -- (offset, -radius * sind(phi)){dir 270} .. (0, -radius){dir 90} withpen threadPen withcolor threadColor;

		fill (fullcircle scaled hole shifted (offset, radius * sind(phi))) withcolor backgroundColor;
		fill (fullcircle scaled hole shifted (offset, -radius * sind(phi))) withcolor backgroundColor;

		draw passTangle(radius, btex $T$ etex);
	);

	draw l shifted (-dist, 0);
	draw r shifted (dist, 0);
	draw thelabel(btex $\backsimeq$ etex, (0, 0));
endfig;

end.
