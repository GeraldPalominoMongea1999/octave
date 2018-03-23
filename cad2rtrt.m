cadena1=[]
codigo1=[]
n=20
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
[cadena,codigo]=cad2(n);


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
mutacion=[0.10,0.10,0.1];
mutacion=4*mutacion;
[cadena1,codigo1]=mutar(codigo,mutacion(1),mutacion(2),mutacion(3));
[cadena2,codigo2]=mutar(codigo,mutacion(1),mutacion(2),mutacion(3));

cadena1'
cadena2'

subplot(3,3,1)
mat1=cadena1==cadena2';

imshow(mat1);


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
[x,y]=puntos(cadena1,cadena2,mat1);
subplot(3,3,2)
#x=x/200;

plot(x,y,'x')
xlabel('cadena 1')
ylabel('cadena 2 ')

# cadena repetiida 
cadena2=[cadena2 ; cadena2]; 
mat2=cadena1==cadena2';
subplot(3,3,3);
imshow(mat2);
[x,y]=puntos(cadena1,cadena2,mat2);
subplot(3,3,4);
plot(x,y,'x')
xlabel('cadena 1')
ylabel('cadena 2 ')

function [m]=diagonal(mat)
  [a,b]=size(mat)
  a=max(size(mat))
  b=min(size(mat))
  
endfunction 
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