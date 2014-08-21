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

set xtics rotate by 35 offset -5,-2.2;
set ytics nomirror;
set y2tics;

set datafile separator ';';
set decimalsign locale;
set timefmt '%H:%M:%S';
set xdata time;
set style data lines;
plot '/etc/systemd/upower-plot.csv' using 2:9 axes x1y2 title 'Charge (%)', '/etc/systemd/upower-plot.csv' using 2:4 title 'Charge (Wh)', '/etc/systemd/upower-plot.csv' using 2:6 title 'Consommation (W)', '/etc/systemd/upower-plot.csv' using 2:7 title 'Tension (V)';
"
