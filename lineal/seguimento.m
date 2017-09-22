total2 =100;
mapa=zeros(total2);
oo=[total2/2  total2/2];

#media=[-1.2415  -1.2415];
   media=[-0.089018  -0.257583];
   
   #desviacion=[48.455   48.455];
desviacion=[ 0.70188   0.65910];
p=[]
for iii=1:total2
  for jjj=1:total2
     p=[p ; [iii jjj]];
  endfor
endfor
size(p)
x=generarX1(repmat(oo,length(p),1),p,media,desviacion);
for kkk=1:4
  subplot(2,4,kkk);
  mapa=zeros(total2);
  for iii=1:(total2*total2)
    mapa(iii)=h(theta1(:,kkk),x(iii,:));
  endfor
  mapa(oo(1),oo(2))=0.5;
  imshow(mapa);
endfor  