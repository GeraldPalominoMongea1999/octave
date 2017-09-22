total2 =50;
mapa=zeros(total2);
oo=[total2/2  total2/2];
theta2=zeros(5,8);
#1 x1 x2 x3 x4 

[X1,Y1]=generarPuntos(total2);
X2=h(theta1,X1)
X2=[ones(length(Y1),1) X2]
function Y=respuestaNodo2(Y1,nodo)
  Y=((nodo==Y1))
endfunction  
for i=1:8
  Y=respuestaNodo2(Y1,i);
  [theta2(:,i),historial]=entrenamiento(theta2(:,i),X2,Y,4000,0.1);
  promedio(i)=historial(length(historial)-1);
  subplot(2,4,i);
  plot(historial);
endfor
