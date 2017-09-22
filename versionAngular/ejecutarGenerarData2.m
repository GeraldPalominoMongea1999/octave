
#calcular el theta
  theta=ones(14,8);
  aprendisaje;
  rep=5;
#  historialTotal=zeros(1,rep);
  dijkstra_2;
  contadorRep=1
  for contadorRep=1:rep
    generardata2;
    historialTotal(1,contadorRep)=mean(promedio);
    seguimento;
  endfor
  #subplot(3,3,9)
 #plot(historialTotal)
 #pruebaTheta
#prueba

  #theta=Theta;
  #p=[5 5];
  #o=p+ 3*[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1 ];
  #total=20;
  #mapa=zeros(20)
  #for contPrub=1:8
  #  x=generarx(o(contPrub,:),p,mapa,total,mediaX0,desviacion0);
  #  [r,d]=direccionAprendisaje(theta,x,o,total);
  #  o(contPrub,:)
  #  p
  #  d
  #  [ruta,pila]=dijkstra(p,total);
  #  dir=direccion(ruta,o(contPrub,:),total);
  #  dir
  #endfor
  #p=[7 7];
  #o=p+ 3*[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1 ];
  #total=20;
  #mapa=zeros(20)
  #for contPrub=1:8
  #  x=generarx(o(contPrub,:),p,mapa,total,mediaX0,desviacion0);
  #  [r,d]=direccionAprendisaje(theta,x,o,total);
  #  o(contPrub,:)
  #  p
  #  d
  #  [ruta,pila]=dijkstra(p,total);
  #  dir=direccion(ruta,o(contPrub,:),total);
  #  dir
  #endfor
  #o=[5 5];
  #p=[7 3];
  #x=generarx(o,p,mapa,total,mediaX0,desviacion0);
  #[r,d]=direccionAprendisaje(Theta,x,o,total);
  #d
  #[ruta,pila]=dijkstra(p,total);
  #dir=direccion(ruta,o,total);
  #dir
