#!/bin/bash
gnuplot -p -e "

set terminal pdf;
set output 'out.pdf';

set title 'Historique de la consommation';
set grid x y;
set ylabel 'Charge (Wh)
Consommation (W)
Tension (V)';
set y2label 'Charge (%)';

set autoscale  y;
set autoscale y2;

set bmargin at screen 0.15;

set xtics rotate by 35 offset -2,-1.5;
set ytics nomirror;
set y2tics;

set datafile separator ';';
set decimalsign locale;
set timefmt '%m/%d/%y %H:%M:%S';
set xdata time;
set style data lines;
plot '/etc/systemd/upower-plot.csv' using 1:8 axes x1y2 title 'Charge (%)', '/etc/systemd/upower-plot.csv' using 1:3 title 'Charge (Wh)', '/etc/systemd/upower-plot.csv' using 1:5 title 'Consommation (W)', '/etc/systemd/upower-plot.csv' using 1:6 title 'Tension (V)';
"
