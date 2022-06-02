Como podrás ver en este release hay 2 .st distintos, esto se debe a que primero hicimos el MarsRover.st y luego el MarsRoverConVectores.st.
En el MarsRover.st abstrajimos la idea de un sensor que sabe si el rover mira hacia el norte, sur, este u oeste y con cada uno sabiendo su 
respectiva dirección, ¿tiene sentido que forwardDirection devuelva 1@0? Consideramos que si, dado que es una forma de señalar hacia donde 
avanzar y el return del mensaje es mas bien un detalle de implementación, lo importante es que eso permite que "position" se muevaen la 
dirección correcta, como dice que hará el nombre del mensaje. A su vez, cuando empezamos a refactorizar se nos pasó por la cabeza quitar
los IFs del mensaje de comandos, pero luego de analizar y probar nos dimos cuenta de que sobremodelariamos demasiado únicamente por 4 o 5
IFs, por lo que no lo vimos coherente.
Pero al terminar este .st y ponernos a charlar con docentes de la cátedra que sugirieron que no era necesario implementar los puntos
cardinales, nos pusimos a pensar qué otra solución podíamos dar y llegamos a una solucion utilizando vectores y álgebra vectorial.
En principio el rover tiene su posicion actual y la dirección en la que apunta como un par ordenado (x@y). El movimiento se realiza 
sumando o restando la dirección a la posición, y la rotación se logra con transformaciones lineales.
Enviamos 2 .st distintos porque nos gustaría saber cuál de nuestras soluciones es superadora ya que nosotros encontramos a las dos viables.

PD: por favor tener en cuenta los nombres de los test ubicados en rovers con vectores, se nos olvidó ponerle los mismos nombres al otro.
