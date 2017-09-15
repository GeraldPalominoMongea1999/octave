# 2 1 8
# 3   7
# 4 5 6

#o inicio 
#p objetivo 

# [a,b]=p-o
# x1i= 1 a b 
# X1=[x11; x12; ....]
total=80;

# contara con 2 niveles 
#theta1=ones(5,4);
dijkstra_2;
aprendisaje;

function X1= generarX1(o,p,media,desviacion)
  media=[-0.089018   0.499853  -0.257583   0.500147];
  desviacion=[0.70188   0.37006   0.65910   0.37006];
  a=(o-p)(:,1);
  b=(o-p)(:,2);
  n=sqrt(a.**2 + b.**2);
  n=n+(n==0);
  s=a./n;
  c=b./n;
  X1=[s s.**2 c c.**2];
  #X1=((X1.-media)./desviacion);
  X1=[ones(size(X1)(1), 1) X1];
endfunction
function [X1 , Y1]= generarPuntos1(total)
   #p=round(rand(n,2)*(total-1)+1);
   #o=round(rand(n,2)*(total-1)+1);
   largo=round(total/2); 
    o1=[
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
  o1=round(o1);
     # 4 +1 + 4+4 =13
     
  p=[];
  o=[];
  Y1=[];
  ##cont=0;
  for k=1:13
    #mapa=zeros(total);
    [ruta,pila]=dijkstra(o1(k,:),total);
    for i=1:total
      for j=1:total
        if prod(o1(k,:)==[i,j])!=1 &&  ( (norm(o1(k,:)-[i,j])<1.5) || ((norm(o1(k,:)-[i,j])>total/2) && norm(o1(k,:)-[i,j])<total/2 +1.5)  ||((norm(o1(k,:)-[i,j])>total) && norm(o1(k,:)-[i,j])<total +1.5) ||((norm(o1(k,:)-[i,j])>total*sqrt(2)-3) && norm(o1(k,:)-[i,j])<total*sqrt(2))  )
          p=[p;[i,j]];
          o=[o;o1(k,:)];
          Y1=[Y1; direccion(ruta,[i,j],total)];
          #mapa(i,j)++;
        #else
        # cont++; 
        endif  
      endfor
    endfor
   endfor
   #mapa=zeros(10);
   #mapa(o(:,1),o(:,2))=1;
   #subplot(2,1,1);
   #imshow(mapa)
   #mapa=zeros(10);
   #mapa(p(:,1),p(:,2))=1;
   #subplot(2,1,2);
   #imshow(mapa)
   
   #media=[-1.2415  -1.2415];
   media=[-0.089018  -0.257583];
   
   #desviacion=[48.455   48.455];
   desviacion=[ -0.089018  -0.257583];
   X1=generarX1(o,p,media,desviacion);
endfunction
function [X1 , Y1]= generarPuntos(total)
   alrededor=[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1   ];
   #media=[-1.2415  -1.2415];
   media=[-0.089018  -0.257583];
   
   #desviacion=[48.455   48.455];
   desviacion=[ 0.70188   0.65910];
   medio=round(total/2);
   mapa=zeros(total);
   o0=[
       [medio medio];
       [medio medio]+ round(alrededor*medio/2); 
       ];
   
   p1=[];
   p=[];
   Y1=[];
   X1=[];
   for i=1:length(o0)
     # genrar las respectivas ruta 
     [ruta,pila]=dijkstra(o0(i,:),total);
     v=o0(i,:)+ alrededor*(round((medio)/2));
     v=v+(v==0)+2*(v==-1)-(v>total);
     p1=[ p1;
          o0(i,:)+ alrededor;
          v
        ];
        for j=1:length(p1)
          if !prod(o0(i,:)==p1(j,:))
          X1=[X1; generarX1(o0(i,:),p1(j,:),media,desviacion)];
          Y1=[Y1;direccion(ruta,p1(j,:),total)];
          endif
        endfor
   endfor
    #subplot(1,1,1)
    #mapa;
    #imshow(mapa);
   #X1=generarX1(o1,p,media,desviacion);
endfunction

#[X1 ,Y1]=generarPuntos(100);
#printf("bandera ");
#pause();


function Y=respuestaNodo(Y1,nodo)
  #si es 1 
  # 1 2 3 4 ---- 1
  # 5 6 7 8 ---- 0
  # si es 2 
  # 3 4 5 6 ---- 1
  # 7 8 1 2 -----0
  # si es 3 
  # 2 3 4 5 -----1
  # 6 7 8 1 -----0
  #si es 4 
  # 4 5 6 7 -----1
  # 8 1 2 3 -----0
  Y=((nodo==1)*(sum((Y1==[1 2 3 4])')'  ) )+ ((nodo==2)*(sum((Y1==[3 4 5 6])')'  ) )+  ((nodo==3)*(sum((Y1==[2 3 4 5])')'  ) )+  ((nodo==4)*(sum((Y1==[4 5 6 7])')'  ) ) ;

 
  
endfunction  



#[X1,Y1]=generarPuntos(total);
#printf("espera");
#pause();
promedio=zeros(1,8);
for i=1:4
  Y=respuestaNodo(Y1,i);
  [theta1(:,i),historial]=entrenamiento(theta1(:,i),X1,Y,4000,1);
  promedio(i)=historial(length(historial)-1);
  subplot(2,2,i);
  plot(historial);
endfor

# la respuesta depende del nodo 






#p=[2,2];
#o=[1 1; 1 2 ;1 3; 2 1; 2 3; 3 1; 3 2; 3 3];


#mapa=zeros(total);
#[ruta,pila]=dijkstra(p,total);
#for i=1:8
#  dir = direccion (ruta, o(i,:) ,total)
#endfor


