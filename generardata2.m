hooo=0;
h1=0;
total=18;
largo=round(total/2);

##p objetivo
##o inicio

#forma 
# theta= [ 1 2 3 4 5]' vertical 
# x(i)=  [ 1 2 3 4 4]  horisontal 
# X = [x(1); x(2); x(3); .... ]  x(i) sobre x(i+1)
# resultado Y  sale en vertical 


# retorna el siguente moviemto segun dijtrak 
# 6 5 4
# 7   3
# 8 1 2


# version 1 
#[a,b]=o-p
#x[i]=[1 a**2 b**2 a*b a b v1 v2 v3 v4 v5 v6 v7 v8 ]
#      1 2    3    4   5 6 7   8  9 10 11 12 13 14 

# version 2 

#x[i]=[1 abs(a) abs(b) a b  abs(a).*b abs(b).*a  a.*b abs(a.*b)  v1 v2 v3 v4 v5 v6 v7 v8 ]
#      1  2      3     4 5  6          7      8  9    10         11 12 13 14 15 16 17 18 


# v =[v1 v2 ... v8]
# V =[v[1]; v[2];v[3]]

function r=enMapa(total,o)
  if prod(o<=total) && prod(o>0)
    r=1;
  else  
    r=0;  
  endif
endfunction
 
function v=crearV(mapa,o,total)
  alrededor=[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1 ];
  puntosV=o+alrededor;
  o;
  v=[];
  for i=1:8
    if enMapa(total,puntosV(i,:))
      v=[v  mapa(puntosV(i,1),puntosV(i,2))];
    else
      v=[v max(max(mapa))];
    endif
  endfor
  v;
  #printf("hooolo")
  #pause()
endfunction
#mapa=round(rand(total)*7)
#v=crearV(mapa,[1,1],total)
#pause();
function x=generarx(o,p,mapa,total,mediaX0,desviacion)
  a=(o-p)(:,1);
  b=(o-p)(:,2);
  V=crearV(mapa,o,total);
  # version 1 
  #x=[abs(a) abs(b) a b  abs(a).*b abs(b).*a  a.*b abs(a.*b)  V*0 ];
  x=[a**2 b**2 a*b a b   V*0 ];
  x=(x.-mediaX0)./desviacion;
  x=[1 x];
    
endfunction

function [o,p]=generarPuntos1(total,largo)
  p=round(rand(largo,2)*(total-1)+1);
  o=zeros(largo,2);
  mapaReg=zeros(total);
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


  #mapaReg(o(:,1),o(:,2))=1/2;
  #mapaReg(p(:,1),p(:,2))=1;
  #imshow(mapaReg);
  #s=0;
  #for i=1:largo
  #  for j=1:largo
  #    s=s+(prod(o(i,:)==p(j,:)));
  #  endfor
  #endfor
  #sum(prod((o(1,:)==p)'));
endfunction
function [o,p]=generarPuntos(total,largo)
  o=[
     # esquinas 
     1 , total;
     total,1;
     total, total;
     1 ,1 ;
     # cenctro
     largo largo;
     # entemdio
     largo total;
     total largo;
     largo 1;
     1 largo;
     # cruz 
     largo/2 largo;
     largo largo/2;
     3*largo/2 largo;
     largo 3*largo/2;
     ];
  o=round(o);
     # 4 +1 + 4+4 =13
     
  p=[];
  ##cont=0;
  for k=1:13
    #mapa=zeros(total);
    for i=1:total
      for j=1:total
        if prod(o(k,:)==[i,j])!=1 &&  ( (norm(o(k,:)-[i,j])<1.5) || ((norm(o(k,:)-[i,j])>total/2) && norm(o(k,:)-[i,j])<total/2 +1.5)  ||((norm(o(k,:)-[i,j])>total) && norm(o(k,:)-[i,j])<total +1.5) ||((norm(o(k,:)-[i,j])>total*sqrt(2)-3) && norm(o(k,:)-[i,j])<total*sqrt(2))  )
          p=[p;[i,j]];
          #mapa(i,j)++;
        #else
        # cont++; 
        endif  
      endfor
    endfor
    #imshow(mapa);
    #printf("muestra 2");
    #pause();
  endfor
  
     
endfunction

    
    #total=18;
    #largo=9;
    #mapa=zeros(total);
    #[o,p]=generarPuntos(total,largo);
    #printf("muestra 3");
    #pause();
    #mapa(o(:,1),o(:,2))=1;
    #imshow(mapa);
    #printf("muesta");
    #pause();
    #mapa=zeros(total);
    
    #mapa(p(:,1),p(:,2))++;
    #imshow(mapa);
    #printf("muesta");
    #pause();

function [r,d]=direccionAprendisaje(theta,X,o,total)
  dirmax=h(theta(:,1),X);
  alrededor=[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1 ];
  r=o+alrededor(1,:);
  d=1;
  for i=2:8
    dir=h(theta(:,i),X);
    if (dir >dirmax|| enMapa(total,r)==0 )&& enMapa(total,alrededor(i,:)+o)
      dirmax=dir;
      r=alrededor(i,:)+o;
      d=i;
    endif
    
  endfor
   
  # 6 5 4
  # 7   3
  # 8 1 2
  
  endfunction

function [X,Y] = generar (total,largo,theta,mediaX0,desviacion)
  [o,p]=generarPuntos(total,largo);
  mapa=zeros(total);
  ubi=o(1,:);
  X=[];
  Y=[];
  for i=1:length(o)
    ubi=o(i,:);
    for j=1:largo
      cont=1;
      mapa=zeros(total);
      [ruta,pila]=dijkstra(p(j,:),total);
      while prod(ubi!=p(j,:)) && cont<total
        x=generarx(ubi,p(j,:),mapa,total,mediaX0,desviacion);
        X=[X;x];
        y=direccion(ruta,ubi,total);
        Y=[Y;y];
        [ubi,d]=direccionAprendisaje(theta,x,ubi,total);
        cont++;
        mapa(ubi(1),ubi(2))++;
      endwhile
    endfor
  endfor
  #V=round(rand(largo,8)*10);
  #X=generarX(o,p,V)
endfunction

# primera media 
mediaX0=[92.1910   59.2493   52.7188    7.7082    6.5332    3.6790    3.6790    3.6790    3.6790    3.6790    3.6790    3.6790    3.6790];
#primera desviacion
desviacion0=[56.22245   52.71876   47.33218    5.73249    4.07569    2.53705    2.53705    2.53705    2.53705    2.53705    2.53705    2.53705    2.53705];



#version 2
#primera media 
#mediaX0=[12.14560    7.86905   11.78846    6.42582   83.02839   90.04670   85.68956   92.91300    0.00000    0.00000    0.00000    0.00000    0.00000    0.00000    0.00000    0.00000];
# desviacion 2 
#desviacion0=[3.32695    3.82383    4.42993    5.93896   62.55941   51.94103   58.85814   46.61515   1           1           1          1          1           1           1       1];


#theta=ones(17,8)

[X,Y]=generar(total,largo,theta, mediaX0,desviacion0);
#X normalisado
#[ones(size(X)(1),1) normalisacion(X(:,2:14))]
# a la hora de normalisar usar estos valores la primera vez 
#printf("esta en pause ");
#pause();

size(X);
size(Y);

promedio=zeros(1,8);
for i=1:8
  Y1=(Y==i);
  [theta(:,i),historial]=entrenamiento(theta(:,i),X,Y1);
  promedio(i)=historial(length(historial)-1);
  #subplot(3,3,i);
  #plot(historial);
endfor