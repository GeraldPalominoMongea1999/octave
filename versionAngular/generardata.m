p=[15,20];# objetibo
o=[2,2]; # inicio 
total=50;
visitado=zeros(total);
[ruta, pila]=dijkstra(p,total);
# ecuacion de parabola 
#[x,y]=p-o
#v:numero de visitas 
#h1*1+h2*x**2 + h3*y**2 + h4*xy + h5*y+h6*x
#h7*(v*x)**2 + h8*(y*v)**2 + h9*(xy*v) + h10*(y*v)+h11*(x*v)+h12*v
#son 8 thetas  
theta=ones(12,8);
function [d]=generarX(o,p,v)
  x=(o-p)(:,1);
  y=(o-p)(:,2);
  d=[x.**2 y.**2 x.*y y x (v.*x).**2  (y.*v).**2 ((x.*y).*v) (y.*v) x.*v v.*ones(length(x),1)];
  d=normalisacion(d);
  d=[ones(length(x),1) d];
endfunction


function [d]=generarY(o,p,total)
  l=length(o(:,1));
  for i=1:l
    [ruta,pila]=dijkstra(p(i,:),total);
    if i>1
      d=[d ;direccion(ruta,o(i,:),total)];
    else
      d=[direccion(ruta,o(i,:),total)];
    endif
  endfor
endfunction



function [o,p]=generarPuntos(largo,total)
  p=round(rand(largo,2)*(total-1)+1);
  o=zeros(largo,2);
  for i=1:largo
    while prod(o(i,:)==0) || sum(prod((o(i,:)==p)'))
    # igual a 0  cuando todavia esta vacio 
    # comparamos o(i,:) con p 
    #  se saca la transpuesta del resultado  
    #  al calcular la productoria sobre las columnas 
    #  se obtiene si algun o es igual a p 
    #  luego se suma para saber si existe algun o igual a p 
      o(i,:)=round(rand(1,2)*(total-1)+1);
    endwhile
  endfor
  s=0;
  for i=1:largo
    for j=1:largo
      s=s+(prod(o(i,:)==p(j,:)));
      
    endfor
  endfor
  sum(prod((o(1,:)==p)'))
endfunction

function [X,Y]=generar(largo,total)
  [o,p]=generarPuntos(largo,total);
  [ruta,pila]=dijkstra(p(1,:),total);
  dir=direccion(ruta,o(1,:),total);
  mapa=zeros(total);
  mapa(o(1,1),o(1,2))=1;
  
  X=0;
  Y=0;
  
  
endfunction
  
##largo=250# numero de datos a genrera 

# rand da valores dese 0 a 1 
# lelvamos a de 0 a 24 y le sumamos 1 -> 
# d valores de 1 a 25 

##p=round(rand(largo,2)*(total-1)+1);
##o=round(rand(largo,2)*(total-1)+1);

# asegurarse que o !=p

##o=o+(o==p);
##o=o-2*(o>total);

##v=round(rand(largo,1)*5);
##X=generarX(o,p,v);
##Y=generarY(o,p,total);
##size(X)
##size(Y)

##for i=1:8
##  Y1=(Y==i);
##  [theta(:,i),historial]=entrenamiento(theta(:,i),X,Y1);
##  subplot(2,4,i);
##  plot(historial);
##endfor

##theta

generar(20,total)