total2 =40;
mapa=zeros(total2);
oo=[total2/2  total2/2];

media=[-1.2415  -1.2415];
desviacion=[48.455   48.455];
p=[]
for iii=1:total2
  for jjj=1:total2
     p=[p ; [iii jjj]];
  endfor
endfor
size(p)
x=generarX1(oo,p,media,desviacion);
for kkk=1:4
  subplot(2,2,kkk);
  mapa=zeros(total2);
  for iii=1:(total2*total2)
    mapa(iii)=round((h(theta1(:,kkk),x(iii,:)))-0.39);
  endfor
  mapa(oo(1),oo(2))=0.5;
  imshow(mapa);
endfor  