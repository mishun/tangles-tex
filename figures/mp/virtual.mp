input prelude.defs
input tangles/main.defs
input tangles/plottangle.defs
input tangles/plotknot.defs
input tangles/circknot.defs
input tangles/chord.defs

verbatimtex
\input latexmp.tex
etex


beginfig(1);
	interim u := 32mm;
	circpackknot("tangles/link1.dat", 1, 0, 1);
	currentpicture := currentpicture shifted (-1.7u, 0);
	circpackknot("tangles/tang_bouq.dat", 1, 0, 1);
endfig;

beginfig(2);
	interim u := 20mm;
	pickup normal;
	numbouquet(7, 4, 6, 3, 5, 6, 7, 3, 4, 5);
	currentpicture := currentpicture shifted (-1.9u, 0);
	u := 14mm;

	fill fullcircle scaled 2u withcolor background;
	draw plotTangle("tangles/tang1.dat", 1, 0);
	u := 20mm;
	currentpicture := currentpicture shifted (-1.8u, 0);
	bouquet(7, 4, 6, 3, 5, 6, 7, 3, 4, 5);
	u := u / 4;
	fill fullcircle scaled 2u withcolor background;
	draw plotTangle("tangles/tang1.dat", 1, 0);
endfig;

beginfig(3);
	interim u := 45mm;
	string s;
	pair p, q[];

	vardef gd(expr p)=
		draw p withpen pencircle scaled .22mm;
	enddef;

	background:=white;

	forever:
		s := readfrom "tangles/gen2dots.dat";
		exitif s=EOF;
		p:=scantokens(s);
		if (xpart(p)++ypart(p))>0.2: gd(p scaled u); fi
	endfor
	closefrom "tangles/gen2dots.dat";

	forever:
		k:=0;
		forever:
			s:=readfrom "tangles/gen2contour.dat";
			exitif s="line"; exitif s=EOF;
			k:=k+1;
			q[k]:=scantokens(s) scaled u;
		endfor
		exitif s = EOF;
		%draw for i=1 upto k: q[i].. endfor cycle withpen pencircle scaled 0.22mm dashed dashpattern(on 0.01pt off 1pt);
		draw for i=1 upto k: q[i].. endfor cycle withpen pencircle scaled 0.12pt;
	endfor
	closefrom "tangles/gen2contour.dat";

	pickup normal;
	plotknot("tangles/g2knot.dat");
endfig;

end.
