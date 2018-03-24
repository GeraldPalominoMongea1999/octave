hhhh=00000;
# generar una cadena aletoria 

# genrar cadena aleatoria 
function [cadena, codigo]= cad2 (n)
   car=['C';'G';'T';'A'];
   codigo=round(unifrnd(1,4,n,1));
   cadena=car(codigo);
   #sum(m==[1:4])
   #plot(sum(m==[1:4]))
  # [cadena, codigo]=[m,m];
endfunction



# muta una cadena 
#aumentar prob caracteres aumtedos en posiciones aleatorias 
#quitar prob caracteres quitados en posiciones aleatorias 
#repetir prob caracteres repeidos  en posiciones aleatorias  

function [cadena,codigo]=mutar(cod1,aumentar,quitar,repetir)
  car=['C';'G';'T';'A'];
  codigo=[];
  cod2=[];
  for i=1:length(cod1) 
    if rand()>quitar
    cod2=[cod2;cod1(i)];
    endif
    if rand()<aumentar
      cod2=[cod2;round(3*rand()+1)];
    endif
  endfor
  for i=1:length(cod2) 
    codigo=[codigo;cod2(i)];
    if rand()<repetir
      codigo=[codigo;cod2(i)];
    endif
  endfor
  cadena=car(codigo);
endfunction
#mutacion=[0.10,0.10,0.1];
#mutacion=4*mutacion;
#[cadena1,codigo1]=mutar(codigo,mutacion(1),mutacion(2),mutacion(3));
#[cadena2,codigo2]=mutar(codigo,mutacion(1),mutacion(2),mutacion(3));

#cadena1'
#cadena2'

#subplot(3,3,1)
#mat1=cadena1==cadena2';

#imshow(mat1);


#subplot(1,3,1)
mat=cadena==cadena';
#imshow(cadena==cadena');

function [x,y]=puntos(cadena1 , cadena2,mat1) 
  x=[];
  y=[];
  
  for i=1:length(cadena1)
    for j=1:length(cadena2)
      if mat1(i,j)==1
       x=[x;i];
        y=[y;j];
    endif
   endfor
  endfor
endfunction
#[x,y]=puntos(cadena1,cadena2,mat1);
#subplot(3,3,2)
#x=x/200;

#plot(x,y,'x')
#xlabel('cadena 1')
#ylabel('cadena 2 ')

# cadena repetiida 
#cadena2=[cadena2 ; cadena2]; 
#mat2=cadena1==cadena2';
#subplot(3,3,3);
#imshow(mat2);
#[x,y]=puntos(cadena1,cadena2,mat2);
#subplot(3,3,4);
##plot(x,y,'x')
#xlabel('cadena 1')
#ylabel('cadena 2 ')
# crear una matriz con una diagonal em funcion n 
# si n =0  -> si i=j   ->1 
# si n =0  -> si i=j-1 ->1 
function [mat]=crearDiag(a,b, n) # a> b 
  if n>b || n<-a
    printf("error")
    mat=0
    return
  endif
  if (n>=0)
    mat=[zeros(a,n), eye(a,b-n)];
   else
    mat=[zeros(-n,b); eye(a+n,b)]; 
  endif
endfunction
function [m]=diagonal1(mat)
  [a,b]=size(mat);
  trans=0;
  if a<b
    trans=1;
    mat=mat';
    [a,b]=size(mat);
  endif
  
  diag=(mat.*(crearDiag(a,b,0)));
  opsiteDiag=(mat.*((crearDiag(b,a,0)(:,a:-1:1)))');
  
  m=diag+opsiteDiag;
  if trans
    m=m'
  endif  
  #a=max(size(mat))
  #b=min(size(mat))
  
endfunction 
function [m]=diagonal2(mat)
  [a,b]=size(mat);
  trans=0;
  if a<b
    trans=1;
    mat=mat';
    [a,b]=size(mat);
  endif
  
  diag1=(mat.*(crearDiag(a,b,2)));
  diag1+=(mat.*(crearDiag(a,b,0)));
  diag1+=(mat.*(crearDiag(a,b,-2)));
  #opsiteDiag=(mat.*((crearDiag(b,a,0)(:,a:-1:1)))');
  
  m=diag1;
  #a=max(size(mat))
  #b=min(size(mat))
  if trans
    m=m'
  endif
endfunction 
function [m]=diagonal3(mat)
  [a,b]=size(mat);
  trans=0;
  if a<b
    trans=1;
    mat=mat';
    [a,b]=size(mat);
  endif
  
  diag1=(mat.*(crearDiag(a,b,round(b/2))));
  diag1+=(mat.*((crearDiag(a,b,round(b/2)))(a:-1:1,:)));
  #diag1+=(mat.*(crearDiag(a,b,-2)));
  #opsiteDiag=(mat.*((crearDiag(b,a,0)(:,a:-1:1)))');
  
  m=diag1;
  #a=max(size(mat))
  #b=min(size(mat))
  if trans
    m=m'
  endif
endfunction 
function [m]=diagonal3(mat)
  [a,b]=size(mat);
  trans=0;
  if a<b
    trans=1;
    mat=mat';
    [a,b]=size(mat);
  endif
  
  diag1=(mat.*(crearDiag(a,b,round(b/2))));
  diag1+=(mat.*((crearDiag(a,b,round(b/2)))(a:-1:1,:)));
  #diag1+=(mat.*(crearDiag(a,b,-2)));
  #opsiteDiag=(mat.*((crearDiag(b,a,0)(:,a:-1:1)))');
  
  m=diag1;
  #a=max(size(mat))
  #b=min(size(mat))
  if trans
    m=m'
  endif
endfunction 
function [m]=diagonal4(mat,k)
  [a,b]=size(mat);
  trans=0;
  if a<b
    trans=1;
    mat=mat';
    [a,b]=size(mat);
  endif
  
  diag1=(mat.*(crearDiag(a,b,-k*round(b/k))));
  for i=(1-k):k
    diag1+=(mat.*(crearDiag(a,b,i*round(b/k))));
  endfor
  #diag1+=(mat.*(crearDiag(a,b,-2)));
  #opsiteDiag=(mat.*((crearDiag(b,a,0)(:,a:-1:1)))');
  
  m=diag1;
  #a=max(size(mat))
  #b=min(size(mat))
  if trans
    m=m'
  endif
endfunction 
function [m]=diagonal5(mat,k)
  [a,b]=size(mat);
  trans=0;
  if a<b
    trans=1;
    mat=mat';
    [a,b]=size(mat);
  endif
  
  diag1=(mat.*(crearDiag(a,b,0*round(b/k))));
  for i=(-k):k
    if (i!=0)
    diag1+=(mat.*(crearDiag(a,b,i*round(b/k))(a:-1:1,:)));
    endif
    #((crearDiag(a,b,round(b/2)))(a:-1:1,:))
  endfor
  #diag1+=(mat.*(crearDiag(a,b,-2)));
  #opsiteDiag=(mat.*((crearDiag(b,a,0)(:,a:-1:1)))');
  
  m=diag1;
  #a=max(size(mat))
  #b=min(size(mat))
  if trans
    m=m'
  endif
endfunction 

#subplot(3,3,5)
#mat3=diagonal(mat2)
#imshow(mat3)



function [] = main ()
  clear
  close all
  cadena1=[];
  codigo1=[];
  n=8;
  k=9;
  k1=round(sqrt(k));
  A = ['A';'C';'T';'G';'G'];
  B = ['A';'C';'T';'A';'A'] ;
  subplot(k1,k1,1)
  imshow((A==B')/2.+0.5)
  [cadena,codigo]=cad2(n);
  # 4 repeticionoes 
  cadena=[cadena;cadena;cadena;cadena];
  codigo=[codigo;codigo;codigo;codigo];
  cadena'
  subplot(k1,k1,2)
  imshow((cadena==cadena')/2.+0.5)
  subplot(k1,k1,3)
  imshow(diagonal1(cadena==cadena')/2.+0.5)
  subplot(k1,k1,4)
  imshow(diagonal2(cadena==cadena')/2.+0.5)
  subplot(k1,k1,5)
  imshow(diagonal3(cadena==cadena')/2.+0.5)
  subplot(k1,k1,6)
  imshow(diagonal4(cadena==cadena',4)/2.+0.5)
  subplot(k1,k1,7:9)
  imshow(diagonal5(cadena==cadena',4)/2.+0.5)

endfunction
main()
#theta=[200]';
#x=x./200
#x=normalisacion(x);
#x1=[ones(length(x),1)];
#function [r]=h(theta,X)
#    r=X*theta  ;
#endfunction
#theta=(0.001/n*sum((y-h(theta,x)).*x))';
#for k=1:1000
#  hold off
#  plot(x,y,'xb')
#  hold on
#  theta=0.001/n*sum((y-(theta+x)).*1)';
#  plot(x,x+theta,'r')
#  pause(0.1)
#endfor 
#plot(x(:,2),200/8*x*theta)
#[cadena1,codigo1]=cad(n,cadena1,codigo1)