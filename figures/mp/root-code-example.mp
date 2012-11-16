input prelude.defs
input tangles.defs

verbatimtex
%&latex 
\input latexmp.tex
etex


radius := 18mm;

path e[];
e[0] := (1, -0) .. (0.966928, 0.00720241) .. (0.906833, 0.022962) .. (0.838625, 0.0435106) .. (0.76938, 0.0659505) .. (0.700442, 0.0875054) .. (0.631047, 0.105053) .. (0.56075, 0.114852) .. (0.492115, 0.112604);
e[1] := (0.200625, -0.523319) .. (0.232443, -0.577283) .. (0.271224, -0.626201) .. (0.313561, -0.671111) .. (0.357676, -0.714484) .. (0.402194, -0.758374) .. (0.444937, -0.80279) .. (0.481069, -0.843165) .. (0.5, -0.866025);
e[2] := (-0.315143, -0.42716) .. (-0.335435, -0.495342) .. (-0.35787, -0.558944) .. (-0.381528, -0.618888) .. (-0.406606, -0.677013) .. (-0.433306, -0.734538) .. (-0.460841, -0.790557) .. (-0.4859, -0.839413) .. (-0.5, -0.866025);
e[3] := (-0.47763, -0.00485735) .. (-0.547733, 0.0154854) .. (-0.619544, 0.0249966) .. (-0.690973, 0.0267124) .. (-0.762346, 0.0232773) .. (-0.834089, 0.0169133) .. (-0.904507, 0.00957399) .. (-0.96622, 0.00318358) .. (-1, 0);
e[4] := (-0.00962703, 0.500172) .. (-0.0883894, 0.550173) .. (-0.163712, 0.597633) .. (-0.235214, 0.643687) .. (-0.303233, 0.690586) .. (-0.367664, 0.740017) .. (-0.426789, 0.791374) .. (-0.475198, 0.83882) .. (-0.5, 0.866025);
e[5] := (-0.00962703, 0.500172) .. (0.0687095, 0.556214) .. (0.145275, 0.606148) .. (0.219341, 0.6523) .. (0.29081, 0.697814) .. (0.359131, 0.745089) .. (0.422091, 0.794139) .. (0.473653, 0.839696) .. (0.5, 0.866025);
e[6] := (0.353873, -0.208695) .. (0.342288, -0.151235) .. (0.33552, -0.0979303) .. (0.336044, -0.0492516) .. (0.345364, -0.00511248) .. (0.364571, 0.0342148) .. (0.394625, 0.0679859) .. (0.436657, 0.0949198) .. (0.492115, 0.112604);
e[7] := (0.200625, -0.523319) .. (0.183124, -0.469659) .. (0.178078, -0.420412) .. (0.184083, -0.375868) .. (0.200263, -0.335806) .. (0.225986, -0.299899) .. (0.26074, -0.267516) .. (0.303918, -0.237585) .. (0.353873, -0.208695);
e[8] := (0.353873, -0.208695) .. (0.36466, -0.26538) .. (0.369492, -0.316934) .. (0.366308, -0.363308) .. (0.354029, -0.404908) .. (0.331973, -0.441899) .. (0.299559, -0.474216) .. (0.256039, -0.501634) .. (0.200625, -0.523319);
e[9] := (0.492115, 0.112604) .. (0.514794, 0.0550576) .. (0.522978, 0.00369502) .. (0.519101, -0.0419615) .. (0.504504, -0.0825136) .. (0.480011, -0.118482) .. (0.446192, -0.150609) .. (0.403617, -0.180127) .. (0.353873, -0.208695);
e[10] := (-0.00962703, 0.500172) .. (0.0684515, 0.451759) .. (0.142574, 0.407424) .. (0.212551, 0.365486) .. (0.278668, 0.323449) .. (0.340976, 0.278792) .. (0.398883, 0.229303) .. (0.450608, 0.17359) .. (0.492115, 0.112604);
e[11] := (0.200625, -0.523319) .. (0.135029, -0.535813) .. (0.0689445, -0.53931) .. (0.00458474, -0.535221) .. (-0.0582585, -0.524716) .. (-0.120668, -0.508525) .. (-0.183951, -0.486946) .. (-0.249043, -0.459902) .. (-0.315143, -0.42716);
e[12] := (-0.47763, -0.00485735) .. (-0.419079, -0.0384081) .. (-0.37342, -0.0797809) .. (-0.339404, -0.126794) .. (-0.315849, -0.178419) .. (-0.301964, -0.23423) .. (-0.297327, -0.294225) .. (-0.301788, -0.35864) .. (-0.315143, -0.42716);
e[13] := (-0.315143, -0.42716) .. (-0.374955, -0.389341) .. (-0.423888, -0.347715) .. (-0.461627, -0.302244) .. (-0.48838, -0.252666) .. (-0.504107, -0.198674) .. (-0.508337, -0.139818) .. (-0.500062, -0.0754028) .. (-0.47763, -0.00485735);
e[14] := (-0.47763, -0.00485735) .. (-0.439323, 0.0693672) .. (-0.392628, 0.139586) .. (-0.340416, 0.204758) .. (-0.283685, 0.2658) .. (-0.222554, 0.324287) .. (-0.156709, 0.381995) .. (-0.0857175, 0.440502) .. (-0.00962703, 0.500172);

pair v[];
v[1] := (0.353873, -0.208695); %+6-7+8-9
v[2] := (0.492115, 0.112604); %-6+9-0-10
v[3] := (0.200625, -0.523319); %-8+7+11+1
v[4] := (-0.315143, -0.42716); %-11-12+13+2
v[5] := (-0.47763, -0.00485735); %-13+12+14+3
v[6] := (-0.00962703, 0.500172); %-14+10+5+4

transform t;
t := identity scaled radius;


beginfig(1);
	for i = 0 upto 14:
		draw e[i] transformed t withpen threadPen withcolor threadColor;
	endfor;

	for i = 1 upto 6:
		fill fullcircle scaled 1mm shifted (v[i] transformed t) withcolor threadColor;
	endfor;

	draw tangleBorder(radius);

	begingroup
		drawoptions(withpen (pencircle scaled 1.5 threadWidth) withcolor threadColor);

		drawarrow (subpath (2, 0) of e[4] ) transformed t;
		drawarrow (subpath (6, 8) of e[10]) transformed t;
		drawarrow (subpath (2, 0) of e[14]) transformed t;
		drawarrow (subpath (5, 8) of e[9] ) transformed t;
		drawarrow (subpath (6, 8) of e[12]) transformed t;
		drawarrow (subpath (5, 8) of e[8] ) transformed t;

		drawoptions();
	endgroup;

	fill fullcircle scaled 1mm shifted (v[6] transformed t) withcolor highlightingColor;
	drawarrow (reverse halfcircle scaled 5mm) rotated -45 shifted (v[6] transformed t) withpen altPen withcolor highlightingColor;

	begingroup
		drawoptions(withcolor textColor);

		label.bot (btex {\tiny $1$} etex, v[6] transformed t);
		label.urt (btex {\tiny $2$} etex, v[2] transformed t);
		label.llft(btex {\tiny $3$} etex, v[5] transformed t);
		label.ulft(btex {\tiny $4$} etex, v[1] transformed t);
		label.llft(btex {\tiny $5$} etex, v[4] transformed t);
		label.llft(btex {\tiny $6$} etex, v[3] transformed t);

		drawoptions();
	endgroup;

	draw thelabel.rt(btex $ A = \left[ \begin{array}{c c c c}
		0 & 0 & 2 & 3 \\
		1 & 0 & 4 & 4 \\
		1 & 5 & 5 & 0 \\
		2 & 6 & 6 & 2 \\
		3 & 6 & 0 & 3 \\
		4 & 0 & 5 & 4
		\end{array} \right] $ etex, (1.1 radius, 0)) withcolor textColor;
endfig;

beginfig(2);
	for i = 0 upto 14:
		draw e[i] transformed t withpen threadPen withcolor threadColor;
	endfor;

	draw tangleBorder(radius);

	begingroup
		drawoptions(withpen (pencircle scaled 1.5 threadWidth) withcolor threadColor);

		drawarrow (subpath (3, 0) of e[7] ) transformed t;
		drawarrow (subpath (5, 8) of e[7] ) transformed t;
		drawarrow (subpath (6, 8) of e[11]) transformed t;
		drawarrow (subpath (3, 0) of e[9] ) transformed t;
		drawarrow (subpath (3, 0) of e[12]) transformed t;
		drawarrow (subpath (2, 0) of e[10]) transformed t;

		drawoptions();
	endgroup;

	for i = 1 upto 6:
		fill fullcircle scaled 1mm shifted (v[i] transformed t) withcolor threadColor;
	endfor;

	fill fullcircle scaled 1mm shifted (v[3] transformed t) withcolor highlightingColor;
	drawarrow (halfcircle scaled 5mm) rotated 125 shifted (v[3] transformed t) withpen altPen withcolor highlightingColor;

	begingroup
		drawoptions(withcolor textColor);

		label.llft(btex {\tiny $1$} etex, v[3] transformed t);
		label.ulft(btex {\tiny $2$} etex, v[1] transformed t);
		label.llft(btex {\tiny $3$} etex, v[4] transformed t);
		label.urt (btex {\tiny $4$} etex, v[2] transformed t);
		label.llft(btex {\tiny $5$} etex, v[5] transformed t);
		label.bot (btex {\tiny $6$} etex, v[6] transformed t);

		drawoptions();
	endgroup;

	draw thelabel.rt(btex $ A = \left[ \begin{array}{c c c c}
		2 & 3 & 0 & 2 \\
		1 & 1 & 4 & 4 \\
		1 & 5 & 5 & 0 \\
		2 & 0 & 6 & 2 \\
		3 & 6 & 0 & 3 \\
		4 & 0 & 0 & 5
		\end{array} \right] $ etex, (1.1 radius, 0)) withcolor textColor;
endfig;

end.
