dijkstra_2;
totalD=100;

[ruta,pila]=dijkstra([totalD/2 totalD/2],totalD);
mapa=zeros(totalD);
for i=1:totalD
  for j=1:totalD
    if !prod([i j]==[totalD/2 totalD/2])
      mapa(i,j)=direccion(ruta,[i,j],totalD);
     endif 
  endfor
endfor
mapa(totalD/2,totalD/2)=0;

for i=[1 , 3 ,2 , 4]
  subplot (2,4,i+4)
  
  imshow((mapa==i)+(mapa==i+1)+(mapa==i+2)+(mapa==i+3));
endfor  
#subplot(3,3,9)
#imshow(mapa/max(max(mapa)))