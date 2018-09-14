reset
set term postscript enhanced eps "Arial,16" color size 3.45,2.3

FILE="data//Rate50kData.txt"
system "mkdir figs"
set output "figs//example.eps"

set lmargin 6
set rmargin 2
set bmargin 3.5
set tmargin 1

set key box
set key bot right
set key spacing 1.34545
set key samplen 3
set key width 1
set key font ",16"

set grid y
set xlabel "Time to Live ( minutes )" offset 0.3,0.1
set ylabel "Delivery Rate" offset 1.5,0.0

set yrange [0:1]
set xrange [0:780]
set xtics 60
set mxtics 2
set ytics 0.1
set mytics 2

##for csv file
#set datafile separator ","

plot FILE using 1:2 title "Epidemic" with lp linetype 1,\
	 FILE using 1:3 title "PRoPHETv1" with lp linetype 2,\
     FILE using 1:4 title "PRoPHETv2" with lp linetype 3

set output