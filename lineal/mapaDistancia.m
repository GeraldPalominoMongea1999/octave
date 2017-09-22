totalM=100;
dijkstra_2;
mapa=zeros(totalM,totalM);
p=round(totalM/2)*[1 1];
[ruta,pila]=dijkstra(p,totalM);
for i=1:totalM*totalM
    mapa(ruta(2,i),ruta(3,i))=ruta(1,i);
endfor  
imshow(mapa/(max(max(mapa))));