subplot(1,1,1)
total=30;
mapa=zeros(total);
p=[1,1];
o=[7,9];
cont=0;
[ruta,pila]=dijkstra(p,total);
v=prod((p!=o)')
while prod((p!=o)') && cont<2000 
  mapa(o(1),o(2))++;
  o=ruta(2:3,m(o,total))';
  mapa(o(1),o(2))++;
  #pause()
  imshow(mapa/max(max(mapa)))
  pause(0.5);
  cont++;
  v=prod((p!=o)');
  cont<2000 ;
  if prod(p==o)
    print("se encontro el punto ")
    pause()
  endif  
endwhile
 printf("mmmmmmmmm ")
p
o
r
mapa