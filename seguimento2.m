total2 =100;
mapa=zeros(total2);
oo=[total2/2  total2/2];


   #media=[-1.2415  -1.2415];
   media=[38.2000   34.5714   41.9086   45.5686];
   
   #desviacion=[48.455   48.455];
   desviacion=[ 16.80197   17.05715   19.90234   18.23161];




p=[]
for iii=1:total2
  for jjj=1:total2
     p=[p ; [iii jjj]];
  endfor
endfor
size(p)
x=generarX1(repmat(oo,length(p),1),p,media,desviacion);
x2=[ones(total2*total2,1) h(theta1,x)]
for kkk=1:8
  subplot(4,4,kkk);
  mapa=zeros(total2);
  for iii=1:(total2*total2)
    mapa(iii)=h(theta2(:,kkk),x2(iii,:));
  endfor
  mapa(oo(1),oo(2))=0.5;
  imshow((mapa)');
endfor  




[ruta,pila]=dijkstra(oo,total2);
for ii=1:(total2)
  for jj=1:(total2)
    if prod([ii,jj]!=oo)
      mapa(ii,jj)=direccion(ruta,[ii,jj],total2);
    else
      mapa(ii,jj)=0.5;
    endif
  endfor
endfor  

for ii=1:8
  subplot(4,4,ii+8);
  imshow(mapa==ii);
endfor