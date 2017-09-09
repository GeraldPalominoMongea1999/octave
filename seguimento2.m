total2 =100;
mapa=zeros(total2);
oo=[total2/2  total2/2];

media=[-1.2415  -1.2415];
desviacion=[48.455   48.455];
theta1 =[    1.758906    0.043837   -0.644010    0.664415;
             3.201451   -6.787582   -0.401316  -25.578814;
             8.677889    5.076642   25.582663   -0.401003]
    
    
    theta2 =[  -2.401440  -3.802026  -4.269591  -8.828809  -4.156617  -3.868842  -1.953640   2.168507;
                4.654187   1.038332   0.033687   0.991475  -0.616125  -2.531318  -2.858136  -4.403928;
               -2.458153  -4.857758   4.466002   1.435604   0.821110   5.524392  -4.590364  -2.191284;
               -4.686481   4.808224   2.187829   4.274827  -0.042055  -3.897056  -1.466605  -2.197859;
               -2.592751  -2.741607  -5.509524   4.508552   0.246353   0.978578   4.720296  -4.606257  ]








p=[]
for iii=1:total2
  for jjj=1:total2
     p=[p ; [iii jjj]];
  endfor
endfor
size(p);

function x=generarX1(oo,p,media,desviacion)
  a=(oo-p)(:,1);
  b=(oo-p)(:,2);
  x=[a b];
  x=(x.-media)./desviacion;
  x=[ones(length(a),1) x];
endfunction


x=generarX1(oo,p,media,desviacion);
x2=[ones(total2*total2,1) h(theta1,x)];
for kkk=1:8
  subplot(2,8,kkk);
  mapa=zeros(total2);
  for iii=1:(total2*total2)
    mapa(iii)=h(theta2(:,kkk),x2(iii,:));
  endfor
  mapa(oo(1),oo(2))=0.5;
  imshow(mapa');
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
  subplot(2,8,ii+8);
  imshow(mapa==ii);
endfor