reset
set term postscript enhanced eps "Arial,12" color size 2.3,1.53
B=ARG1
PREFIX='Overhead'
system "mkdir figs"
FIGTITLE=sprintf("figs//%s%sk.eps",PREFIX,B)
FILE=sprintf("data//%s%skData.txt",PREFIX,B)

set output FIGTITLE
set key box
set lmargin 6
set rmargin 2
set bmargin 3.5
set tmargin 1

set key box top left spacing 1.34545 samplen 3 width 1 font ",12"

set grid y
set xlabel "Time to Live ( hours )" offset 0.3,0.1
set ylabel "Overhead (10^2 messages)" offset 1.5 ,0.0

set yrange [0:25]
set xrange [0:13]
set xtics 1
set mxtics 2
set ytics 5
set mytics 5

plot FILE using (column(1)/60):(column(2)/100) title "Epidemic" with lp lc 0 linewidth 1 pointsize 1 pointtype 9,\
	 FILE using (column(1)/60):(column(3)/100) title "PRoPHETv1" with lp lc rgb "#ED1B3A" linewidth 1 pointsize 1 pointtype 5,\
     FILE using (column(1)/60):(column(4)/100) title "PRoPHETv2" with lp lc rgb "#0666B1" linewidth 1 pointsize 1 pointtype 7

set output