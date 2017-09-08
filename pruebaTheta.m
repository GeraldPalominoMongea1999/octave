subplot(1,1,1)
total=30
mapa=zeros(total)
p=[30,9]
o=[7,9]
cont=0
while !prod(p==o) && cont<2000 
  mapa(o(1),o(2))++;
  x=generarx(o,p,mapa,total,mediaX0,desviacion0);
  [r,d]=direccionAprendisaje(theta,x,o,total)
  o=r;
  imshow(mapa/max(max(mapa)))
  pause(0.5)
  cont++;
  if prod(p==o)
    print("se encontro el punto ")
    pause()
  endif  
endwhile
p
o
r
mapa