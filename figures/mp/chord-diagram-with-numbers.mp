input prelude.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.mps";

vardef chord(expr i, j, n) :=
	ai := 180 i / n;
	aj := 180 j / n;

	(cosd(ai), sind(ai)){dir = (ai + 180)} .. (cosd(aj), sind(aj)){dir = aj}
enddef;

vardef putLabel(expr i, n, size) :=
	ai := 180 i / n;

	pair p;
	p := (cosd(ai), sind(ai)) scaled (size * 1.2);

	if i = 0:
		label(btex $0$ etex, p);
	elseif i = 1:
		label(btex $1$ etex, p);
	elseif i = 2:
		label(btex $2$ etex, p);
	elseif i = 3:
		label(btex $3$ etex, p);
	elseif i = 4:
		label(btex $4$ etex, p);
	elseif i = 5:
		label(btex $5$ etex, p);
	elseif i = 6:
		label(btex $6$ etex, p);
	elseif i = 7:
		label(btex $7$ etex, p);
	elseif i = 8:
		label(btex $8$ etex, p);
	elseif i = 9:
		label(btex $9$ etex, p);
	fi
enddef;

vardef drawChordDiagram(expr n)(suffix cd) =
	size := 20mm;
	point_rel := 0.04;
	line_rel := 0.02;

	pen cur_pen;
	cur_pen := pencircle scaled (line_rel * size);

	numeric tmp[];
	for i = 0 upto 2 n - 1:
		tmp[i] = cd[i];
		if i + cd[i] < 2 n:
			draw chord(i, i + tmp[i], n) scaled size withpen cur_pen withcolor threadColor;
		fi

		putLabel(i, n, size);
	endfor;

	draw fullcircle scaled 2size dashed evenly withpen cur_pen withcolor borderColor;

	for i = 0 upto 2 n - 1:
		fill fullcircle scaled point_rel shifted (cosd(180 i / n), sind(180 i / n)) scaled size withcolor borderColor;
	endfor;
enddef;

beginfig(1);
	numeric cd[];
	cd[0] := 6;
	cd[1] := 2;
	cd[2] := 3;
	cd[3] := 6;
	cd[4] := 3;
	cd[5] := 5;
	cd[6] := 2;
	cd[7] := 5;

	drawChordDiagram(4, cd);
endfig;

end.
