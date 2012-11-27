input prelude.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.%c.mps";

vardef bug(expr a, b, c, d) =
	numeric rt, rl, ds;
	rt := 3mm;
	rl := 1cm;
	ds := rl * sqrt(1/2);

	path border;
	border := fullcircle scaled 2 rt;

	picture p;
	p := nullpicture;

	for i = 0 upto 3:
		addto p doublepath ((rt, 0) -- (rl, 0)) rotated (45 + 90 i) withpen (pencircle scaled threadWidth) withcolor threadColor;
	endfor;

	addto p contour border withcolor highlightingColor;
	addto p doublepath border dashed evenly withpen borderPen withcolor borderColor;

	addto p also thelabel.llft(decimal(a), (-ds, -ds)) withcolor textColor;
	addto p also thelabel.lrt (decimal(b), (+ds, -ds)) withcolor textColor;
	addto p also thelabel.urt (decimal(c), (+ds, +ds)) withcolor textColor;
	addto p also thelabel.ulft(decimal(d), (-ds, +ds)) withcolor textColor;

	p
enddef;

delta := 15mm;

beginfig(1);
	draw bug(0, 1, 2, 3) shifted (-delta, 0);
	draw bug(0, 3, 2, 1) shifted (+delta, 0);

	draw thelabel.top(btex $E$ etex, (0, 1mm)) withcolor textColor;
	draw thelabel(btex $\longrightarrow$ etex, (0, 0)) withcolor textColor;

	draw thelabel(btex L etex, (0, 0)) shifted (-delta, 0) withcolor textColor;
	draw thelabel(btex L etex, (0, 0)) xscaled -1 rotated -90 shifted (+delta, 0) withcolor textColor;
endfig;

beginfig(2);
	draw bug(0, 1, 2, 3) shifted (-delta, 0);
	draw bug(1, 2, 3, 0) shifted (+delta, 0);

	draw thelabel.top(btex $C$ etex, (0, 1mm)) withcolor textColor;
	draw thelabel(btex $\longrightarrow$ etex, (0, 0)) withcolor textColor;

	draw thelabel(btex L etex, (0, 0)) shifted (-delta, 0) withcolor textColor;
	draw thelabel(btex L etex, (0, 0)) rotated -90 shifted (+delta, 0) withcolor textColor;
endfig;

end.
