# Respuestas a las preguntas dadas
### ¿les quedó código repetido? ¿dónde? 
No. Pero si no hubieramos tomado la decisión de poner a Ornella como hija de Oriana, tendríamos el mismo código para la reproducción de ambas avispas.

### ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)?
Creemos que no faltó ninguna representación y por lo tanto no hay código repetido.

## Responsabilidad de dejar un huevo consumiendo otro insecto
### ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? ¿por qué?
Nos quedó como responsabilidad de cada avispa al momento de indicarle que se reproduzca, chequea si hay comida suficiente para hacerlo. Lo hicimos porque creemos que en un recorte de la realidad, cada insecto se reproduce y se alimenta por su cuenta, tomando responsabilidad de dichas acciones. 

### ¿por qué tendría sentido que fuera de la otra forma?
Porque el habitat podría entenderse como un lugar con gente a cargo de mantener alimentadas a las avispas para su reproducción. Entonces el habitat (y su gente) sería el responsable de alimentar las avispas.

### ¿con cuál nos quedamos?
Con la que decidimos usar nosotros, la responsabilidad es de cada insecto por ser entidades modeladas como independientes y autosuficientes. Si usasemos la otra forma, solo habría un habitat como objeto que no delegaría responsabilidades a otras entidades.

### Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código?
Con prototipado, ya que dada la consigna y el dominio del problema es más sencillo utilizar esta técnica. El hecho de modelar 4 avispas específicas y 2 iguales, dió pie al uso de objetos hijos.

### Sobre la implementación ¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban?
El guardado de huevos se hizo utilizando colaboradores internos en el habitat. Creemos que fue suficiente con modelar las cantidades de cada huevo con su distinta firma genética. No usamos colecciones ni diccionarios en ninguna parte del código.

### Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?
Respaldando lo contestado en la respuesta anterior, el uso de colaboradores internos para manejar cantidades de huevos por firma genética resultó la solución más sencilla y minimal, no consideramos que hayan otras maneras más directas de encarar el problema y pasar los tests.

