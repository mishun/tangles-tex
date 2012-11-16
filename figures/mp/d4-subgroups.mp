input prelude.defs

verbatimtex
\input latexmp.tex
etex

filenametemplate "%j.mps";


beginfig(1);
	height := 1cm;

	begingroup
		drawoptions(withcolor textColor);

		label(btex $D_4$ etex, (0, 0));

		label(btex {\scriptsize $GS = \{I, C^2, EC, EC^3\}$} etex, (-3cm, -height));
		label(btex $C_4$ etex, (0, -height));
		label(btex {\scriptsize $DS = \{I, C^2, E, EC^2\}$} etex, (3cm, -height));

		label(btex {\tiny $ECS = \{I, EC\}$}     etex, (-4cm, -2height));
		label(btex {\tiny $EC^3S = \{I, EC^3\}$} etex, (-2cm, -2height));
		label(btex {\tiny $C_2 = \{I, C^2\}$}    etex, (   0, -2height));
		label(btex {\tiny $ES = \{I, E\}$}       etex, ( 2cm, -2height));
		label(btex {\tiny $EC^2S = \{I, EC^2\}$} etex, ( 4cm, -2height));

		label(btex {\scriptsize $ID = \{I\}$} etex, (0, -3height));

		drawoptions();
	endgroup;

	begingroup
		drawoptions(withcolor threadColor withpen threadPen);

		drawarrow (30mm, -7mm) -- (3mm, -1mm);
		drawarrow (-30mm, -7mm) -- (-3mm, -1mm);
		drawarrow (0, -7mm) -- (0, -2mm);

		drawarrow (39mm, -17mm) -- (35mm, -12mm);
		drawarrow (20mm, -17mm) -- (23mm, -12mm);
		drawarrow (7mm, -17mm) -- (16mm, -13mm);
		drawarrow (0, -17mm) -- (0, -12mm);
		drawarrow (-7mm, -17mm) -- (-16mm, -13mm);
		drawarrow (-20mm, -17mm) -- (-23mm, -12mm);
		drawarrow (-39mm, -17mm) -- (-35mm, -12mm);

		drawarrow (7mm, -29mm) -- (33mm, -22mm);
		drawarrow (3mm, -28mm) -- (15mm, -22mm);
		drawarrow (0, -27.5mm) -- (0, -22mm);
		drawarrow (-3mm, -28mm) -- (-13mm, -22mm);
		drawarrow (-7mm, -29mm) -- (-34mm, -22mm);

		drawoptions();
	endgroup;
endfig;

end.
