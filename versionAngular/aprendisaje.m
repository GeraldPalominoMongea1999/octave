
h=0;
k=0;
#forma 
# theta= [ 1 2 3 4 5]' vertical 
# x(i)=  [ 1 2 3 4 4]  horisontal 
# X = [x(1); x(2); x(3); .... ]  x(i) sobre x(i+1)
# resultado r sale en vertical 

function [r]=normalisacion(X)
  media=mean(X);
  desviacion=std(X);
  r=(X-media)./desviacion;
  
endfunction
function [r]= g(z)
  r=1./(1.+e.^(-z));
endfunction
function [r]=h(theta,X)
      r=g(X*theta);
endfunction
## log ==ln 
function [r]=cost(theta,X,y)
    r=(-y).*log(h(theta,X)).-(1.-y).*log(1.-h(theta,X));
endfunction
function [r]=j(theta,X,y)
  m=length(y);
  r=1/m*sum(cost(theta,X,y));
endfunction
# derivada de j respecto de theta_j
function [r]=dj(theta,X,y,j)
  m=length(y);
  r=1/m*sum((h(theta,X)-y).*X(:,j));
endfunction
function [theta,historial]=entrenamiento(theta,X,y,iteraciones,alpha)
  n=length(theta);
  #alpha=0.1;
  temp=theta*0;
  historial=[];
  for k=1:iteraciones
   temp(1:n)=theta(1:n)-(alpha*dj(theta,X,y,1:n))';
   theta=temp;
   historial=[historial ;j(theta,X,y)];
   #if (k>iteraciones/4) && ((historial(k-1)-historial(k))<(0.02*historial(k)))
   #  alpha=alpha*2;
   #endif  
  endfor
endfunction
#--------------------
#pueba de funciones 

#h([1:5]',([1:5; 2:6 ; 4:8;11:15 ]-7)/15);
#plot(h([1:5]',([1:5; 2:6 ; 4:8;11:15 ]-7)/15));
#theta=[1:10]'/10;
#X=rand(20,10)*200
#X=normalisacion(X)
#pause();
#h(theta,X)
#y=rand(20,1)

#----------------------


#(1.-y).*log(1.-h(theta,X))
#(-y).*log(h(theta,X)).-(1.-y).*log(1.-h(theta,X))

#--------------------
#pueba de funciones 

#j(theta,X,y)
#theta
#[theta,historial]=entrenamiento(theta,X,y)
#j(theta,X,y)

#plot(historial)

#----------------------