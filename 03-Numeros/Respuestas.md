### Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

El primer llamado aporta la mitad de la información necesaria, que es la clase del objeto al que se le envía el primer mensaje; luego el segundo llamado aporta el resto de la información que es la clase de el otro objeto (el cual fue colaborador externo en el primer llamado) y el método que resuelve la operación esperada por el usuario en el primer llamado. 


### Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

La lógica de cómo instanciar un objeto debe estar dentro del protocolo de la clase, por una cuestión de encapsulamiento; no es necesario saber cómo se inicializa o se crea una instancia para la persona que quiera instanciar la clase. 
La creacion del objeto desde diversos lugares no debería generar ningún conflicto ya que el mensaje de instanciación es enviado a la clase y desde ahí se manejan criterios diversos (en este caso podría ser desde dónde se instancia), nunca se pasa directamente a instanciar.


### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Los estuvimos clasificando por el tipo de funcionalidad que tienen, "inicializar", "comparar", "testear", etc.

### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Es un tema de correcto diseño, si se considera que todas las subclases deben responder un mismo mensaje (aunque sea de distinta forma) por cómo es la superclase, como se espera que se comporte esa superclase; entonces el mensaje debe estar definido ahí con subclassResponsibility, dado que se espera que todas las subclases respondan ese mensaje.
Por ejemplo se espera que cualquier tipo de número sepa sumarse a otro, pero no todos los tipos de números se suman de igual manera por ende tenemos un mensaje "+" implementado en número que cambia su método en cada subclase de este, la fracción no suma de igual manera que el entero u otro número.

### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

El encapsulamiento permite la separación de una clase en dos partes, su implementación y su interfaz. La interfaz es "pública" porque otros objetos pueden enviar mensajes, un usuario puede interactuar, etc. Y la implementación es "privada", es nuestra lógica, nuestros métodos, nuestros diseños que no aportan a la funcionalidad del objeto y no deberían ser accedidos por fuera de nuestra implementación, de los llamados que hacemos como programadores. 
Entonces la rotura de este encapsulamiento permitiría que otros objetos o usuarios utilicen mensajes o métodos que no deberían y que afectan de manera directa el funcionamiento del objeto. Esta falta de control en el acceso evita que podamos asegurar su funcionamiento como fue especificado ya que se tendría acceso a cosas que, por ejemplo, pueden estar utilizadas para interactuar con un cierto set de parámetros (del cual el objeto o usuario foráneo desconoce su formato o uso) y si se les envía otro pueden darse malfuncionamientos.

