reset
set term postscript enhanced eps "Arial,16" color size 3.45,2.3

FILE="data//Rate50kData.txt"
system "mkdir figs"
set output "figs//example2.eps"

set lmargin 6
set rmargin 2
set bmargin 3.5
set tmargin 1

#set key box
#set key bot right
#set key spacing 1.34545
#set key samplen 3
#set key width 1
#set key font ",14"
set key box bot right spacing 1.34545 samplen 3 width 1 font ",14"

set grid y
set xlabel "Time to Live ( hours )" offset 0.3,0.1
set ylabel "Delivery Rate" offset 1.5,0.0

set yrange [0:1]
set xrange [0:13]
set xtics 1
set mxtics 2
set ytics 0.1
set mytics 2

set arrow 1 from 5,0.7 to 6,0.42 filled size 0.5, 15, 60 lw 2
set label 1 "some text" at 4,0.75

##for csv file
#set datafile separator ","
	 
plot FILE using (column(1)/60):2 title "Epidemic" with lp lc 0 linewidth 1 pointsize 1.5 pointtype 9,\
	 FILE using (column(1)/60):3 title "PRoPHETv1" with lp lc rgb "#ED1B3A" linewidth 1 pointsize 1.5 pointtype 5,\
     FILE using (column(1)/60):4 title "PRoPHETv2" with lp lc rgb "#0666B1" linewidth 1 pointsize 1.5 pointtype 7

set output