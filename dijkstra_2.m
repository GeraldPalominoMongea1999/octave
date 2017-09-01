
r=0;
r=0;
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
# insertar en la pila 
function [pila,t] = agregarPila(pila,t,p)
  if t<length(pila)
    if prod(pila(t+1,:)==[0 0])#si esta lleno 
      t++;
      pila(t,:)=p;
    else
      printf("\n-----\n \n-----\nerror pila llena 1\n-----\n  \n-----\n  ");
      t
      pila'
      pause();
    endif
    else
      t=1;
      if prod(pila(t,:)==[0 0])
        pila(t,:)=p;
      else
        printf("\n-----\n \n-----\nerror pila llena 2\n-----\n  \n-----\n  ");
        t
        pila'
        pause();
      endif
  endif
endfunction
#quitar de la pila 
function [pila,inicio] = quitarPila(pila, inicio )
  if inicio<length(pila)
      if prod(pila(inicio,:)!=[0 0])
        pila(inicio,:)=[0 0];
        inicio++;
      else
        printf("pila vacia");
        inicio
        pila'
        pause();
      endif
    else
      if prod(pila(inicio,:)!=[0 0])
        pila(inicio,:)=[0 0];
        inicio=1;
      else
        printf("pila vacia");
        inicio
        pila'
        pause();
      endif
  endif
endfunction

# retorna el siguente moviemto segun dijtrak 
# 6 5 4
# 7   3
# 8 1 2
#distancia
# 1.4  1  1.4
#  1       1
# 1.4  1  1.4
function [ruta,pila]= dijkstra(  p,total)
    #ruta 
    # 1 distnacia 
    # 2 x  A
    # 3 y  A
    # 4 visto
    ruta=zeros(3, total*total);
    ruta(1,:)=Inf;
    ruta(2,:)=0;
    ruta(3,:)=0;
    ruta(1:4,m(p,total))=[0 0 0 1];
    pila=zeros(total^2,2);
    pila(1,:)=p;
    t=1;# numero de elemetos de la pila 
    alrededor=[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1   ];
    distancia=[ 1  sqrt(2) 1  sqrt(2) 1  sqrt(2) 1  sqrt(2)  ];#distancia unitaria entre  2 xuadriculas adiacentes 
    p1=p;
    inicio=0;
    entrar=1;# para que el bucle entre la primera vez 
    while inicio!=t || entrar# si t e inicio son igules la pila esta vacia 
      if entrar==1
      entrar=0;# una vez que entra ya no nesitamos esta variable 
      inicio=1;
      endif
      p1=pila(inicio,:);
      [pila ,inicio]=quitarPila(pila,inicio);
      for i=1:8
        rodeo=p1+alrededor(i,:);
        if enRango(rodeo,total)#esta en rango
          if ruta(1,m(rodeo,total))>distancia(i)+ruta(1,m(p1,total))# distancia menor
            [pila,t]=agregarPila(pila,t,rodeo);
            ruta(2:3,m(rodeo,total))=p1;#renovamos el ancestro
            ruta(1,m(rodeo,total))=distancia(i)+ruta(1,m(p1,total));#modificamos la distancia  el ancestro
          endif
        endif
      endfor
    endwhile
    # retorna un vector que represeta el camino desde un
    # punto a otro 
endfunction
# retorna la decicion correcta para una corrdenada dada (variable : o )
# requiere haber ejecuado dijkstra  y guardado ruta 
function dir = direccion (ruta, o ,total)
  alrededor=[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1   ];
  dir=0;
  for i=1:8
    if prod((alrededor(i,:)+o)(:)==(ruta(2:3,m(o,total)))(:))
      dir=i;
      i=9;
    endif
  endfor
  if dir==0
    printf("error no se enconctro la direecion");
    o
    ruta(2:3,m(o,total))
    pause();
  endif
endfunction
#[ruta,pila]=dijkstra([5,5],15)
#direccion(ruta,[10,7],15)