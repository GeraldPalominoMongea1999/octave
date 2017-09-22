subplot(1,1,1);
total=100;
mapa=zeros(total);
p=round([ total/3  total/2+30]);
o=round([total,total]/2);
cont=0


theta1=[
          8.17972   -0.26860   -0.92956   -1.05880;
          7.65194  -17.44675   -2.10858  -56.60537;
         -2.29895   -5.45934    0.90669   -0.80902;
         28.90003   14.79983   56.44666   -2.25441;
         11.47867    6.19074   -0.83625    0.75022;];
theta2=[  
          -2.41357  -4.12230  -4.83535  -8.37535  -5.01894  -4.32163  -3.03635   2.23399;
           4.74314   1.13055   0.58152   3.69303  -5.50292  -3.04448  -2.65841  -4.96151;
          -2.34294  -4.25561   4.30667   0.58201   1.65627   5.94842  -5.61545  -2.21838;
          -4.77863   4.79537   1.92838   1.96469   5.27030  -4.88007  -2.16444  -1.96972;
          -3.00362  -2.84799  -5.40604   3.92714   0.39355   0.62420   6.25386  -5.73213;];




function [r,d]=direccionAprendisaje(theta,X,o,total)
  dirmax=h(theta(:,1),X);
  alrededor=[1 0 ; 1 1 ; 0 1 ;  -1 1 ; -1 0 ; -1 -1 ; 0 -1 ; 1 -1 ];
  r=o+alrededor(1,:);
  d=1;
  for i=2:8
    dir=h(theta(:,i),X);
    if (dir <dirmax|| enRango(r,total)==0 )&& enRango(alrededor(i,:)+o,total)
      dirmax=dir;
      r=alrededor(i,:)+o;
      d=i;
    endif
    
  endfor
endfunction

while !prod(p==o) && cont<2000 
  mapa(o(1),o(2))++;
  x1=generarX1(o,p,0,0);
  [r,d]=direccionAprendisaje(theta2,[1  h(theta1,x1)],o,total);
  o=r;
  mapa(p(1),p(2))=0.5;
  imshow(mapa/max(max(mapa)));
  
  
  pause(0.1)
  cont++;
  if prod(p==o)
    printf("se encontro el punto ")
    #pause();
  endif  
endwhile






p;
o;
r;
mapa;