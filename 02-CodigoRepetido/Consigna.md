# Código Repetido

Este ejercicio tiene por objetivo que saquen el código repetido que encuentren en el modelo y en los tests. Por ej. entre el test01 y test02.

Los tests provistos ya funcionan, simplemente hay que sacar el código repetido y los tests deben seguir funcionando.

Se pueden modificar las clases provistas, sólo para eliminar código repetido. No se puede modificar lo que verifican los tests. O sea, sólo se puede hacer un cambio de diseño de tal manera que siga testeando lo mismo, que la funcionalidad sea la misma, pero que no haya código repetido.

Aclaración: Para hacer este ejercicio más sencillo se modela a un Customer utilizando un String en vez de una clase Customer. No es el objetivo del ejercicio que ustedes corrijan esta decisión, ni las consecuencias que trae consigo (por ej. que no se pueda agregar al CustomerBook dos Customers diferentes con el mismo nombre).


# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon? 

Creamos un cronómetro. Consideramos que debía abstraerse el hecho de tomar tiempos a una entidad que se encargue de dicha función.


## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Principalmente objetos y clases. El primero se puede manejar desde el Denotative Object Browser y el segundo desde el Class Browser. Asimismo, el uso del paradigma de mensajes permite abstraer la comunicacion
entre los entes creados, pudiendo lograr relaciones mas complejas entre los mismos. Las clases nos permiten crear instancias de objetos similares sin necesidad de recurrir a la creación de objetos individuales repetidos, pudiendo así ahorrar código e implementación de mensajes y métodos.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Naur sugiere que programar debe ser considerado como construcción de teoría. Partiendo de este concepto, la abstracción es justamente la creación de nuestra propia teoría como programadores, fruto del hilo de pensamiento llevado a cabo para sortear los problemas presentados en esta consigna en particular. Cada abstracción, por ejemplo el cronómetro, es una teoría que nosotros formamos para modelar el hecho de tener que medir tiempo desde un instante hasta otro. Si bien podrían haber otras maneras de hacerlo, nuestra teoría indica que ese era el mejor camino y lo tomamos, y solo los que programamos el cronómetro sabemos por qué lo hicimos y como eso nos solucionó algo, e incluso como podría ser usado a futuro.

