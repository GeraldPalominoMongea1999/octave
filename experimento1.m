total=7;
ma=zeros(total);
p=round(rand(1,2)*(total-1))+1;
o=round(rand(1,2)*(total-1))+1;
#p=[5 9];
#o=[ 8 5 ];
#m retora las cooedenadas como el numero que corrspondria a un vector 
function r=m(puntoVector,total)
  r=puntoVector(1)+(puntoVector(2)-1)*total; 
endfunction
#enRango retorna 1 si las corrdenadas (puntoVector) estan entre [1 total]^2
function r= enRango(puntoVector, total)
  if prod([puntoVector > 0 puntoVector<=total ])
    r=1;
  else 
    r=0;  
  endif
endfunction  
# retorna el siguente moviemto segun dijtrak 
#1 2 3
#4   6
#7 8 9
#distancia
# 1.4  1  1.4
#  1       1
# 1.4  1  1.4
function [ruta]=revRut(o , p , total , ruta )
    
    alrededor=[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1   ];
    distancia=[ 1  sqrt(2) 1  sqrt(2) 1  sqrt(2) 1  sqrt(2)  ];#distancia unitaria entre  2 xuadriculas adiacentes 
    p1=p;
    for i=1:8
      if  enRango(p1+alrededor(i,:),total)
        if ruta(1,m(p1+alrededor(i,:),total))>distancia(i)+ruta(1,m(p1,total))# distancia menor
          ruta(2:3,m(p1+alrededor(i,:),total))=p1;
          ruta(1,m(alrededor(i,:)+p1,total))=distancia(i)+ruta(1,m(p1,total));
          ruta=revRut(o,p+alrededor(i,:),total,ruta);
       endif
 
     endif 
    endfor
endfunction
function [ruta]= dijkstra( o , p,total)
    #ruta 
    # 1 distnacia 
    # 2 x  A
    # 3 y  A
    ruta=zeros(3, total*total);
    ruta(1,:)=Inf;
    ruta(2,:)=0;
    ruta(3,:)=0;
    ruta(1:3,m(p,total))=[0 0 0];
    ruta=revRut(o,p,total, ruta);
    # retorna un vector que represeta el camino desde un
    # punto a otro 
endfunction
ruta=dijkstra(o,p,total);
r=ruta(1,:);
k=zeros(total);
k(:)=r(:);
imshow(k/10);
k;
k(:)=((ruta(2,:)-1)*total+ ruta(3,:))(:);
function [r]=respuesta(total, o , p , ruta)
  cont=0;
  p1=o;
  while cont<total*total && (p(1)!=ruta([2,3],m(p1,total))(1) ||p(2)!=ruta([2,3],m(p1,total))(2) )
    p1=ruta([2,3],m(p1,total));
    cont++;
  endwhile
  alrededor=[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1   ];
  i=1;
  while i<9 && ((p+alrededor(i,:))(1)!=p1(1) || (p+alrededor(i,:))(2)!=p1(2))
    i++;
  endwhile
  r=i;
  if i>8
    printf("\n-----\n \n-----\nerror\n-----\n  \n-----\n  ");
  endif
endfunction
r=respuesta(total,o,p,ruta);
r