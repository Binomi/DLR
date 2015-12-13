reset
set terminal epslatex color
set output 'tornado.tex'
set xlabel '$r$ [cm]'
set ylabel '$v$ [$\frac{\text{m}}{\text{s}}$]'

f1(x) = (x<R1) ? a1*x+c1 : (a1*R1**2+c1*R1)/x
f2(x) = (x<R2) ? a2*x+c2 : (a2*R2**2+c2*R2)/x

fit f1(x) 'tornado.dat' u 1:2 via a1,R1,c1
fit f2(x) 'tornado.dat' u 1:3 via a2,R2,c2

p 'tornado.dat' u 1:2:(0.05) w e t '$20,$cm Höhe',\
  'tornado.dat' u 1:3:(0.05) w e t '$30,$cm Höhe',\
  f1(x),f2(x)

set output
!epstopdf tornado.eps
!rm tornado.eps