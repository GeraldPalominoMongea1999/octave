# dijstrack vs preceptron

  ## funcionamieto 

En un mapa cuadrado dividido en secciones iguales, 
cada cuadrdado es un nodo y esta conectado a los nodos adiasentes( 8 nodos) ,
el peso para las direcciones de arriba ,abajo , izquierda y derecha es 1 , mientras que para las diagonales es 2^(1/2)
tomamos un nodo y a sus nodos adiansentes se le asigna un numero entre 1 y 8
se señala otro nodo como meta 
dijstrack dara la respuesta correcta para cada par, en este caso se guarda solo el primer movimento 

la entrada de los  perseptornes sera el seno , seno cuadrado , coseno y coseno cuadrado,
formados por un vector desde el nodo inicial y el nodo de meta y el eje x 

## ejecucion

para correr es necesario correr desde octave primero correr los archivos o que esten agregados al path:

aprendisaje.m

generaraData3.m

pruebaTheta2.m -> los valores de theta ya fueron calculados y estan en este archivo 

## Nota

las variables :
 
 o:objetivo 

 p:punto de inicio 
 
 Los otros programas fueron usados para calcular este theta 
 
