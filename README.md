# 2020-pig-big-personalities-big-pig

Analysis of the big five personalities test with pig. [José Pacheco, Cristian Sanchez, Tomás Vallejos. Group 09]

## Overview

State what is the main goal of the project. State what sorts of question(s) you want to answer or what sort of system you want to build. (Questions may be non-technical -- e.g., is there a global correlation between coffee consumption and research output -- so long as they require data analysis or other technical solutions.)

Obtener y analizar información acerca de la calidad de las preguntas realizadas en un cuestionario online, además de las tendencias y comportamientos de los encuestados además de notar conductas anómalas durante la realización del test.

Nos centraremos especialmente en responder las siguientes preguntas:
- ¿Cuánta gente se queda afk realizando el cuestionario?
- ¿Cuál es la pregunta en la que la mayor cantidad de gente está de acuerdo?
- ¿Cuál fue la mínima y máxima resolución en la que se contestó la encuesta?

                        
  


## Data

Describe the raw dataset that you considered for your project. Where did it come from? Why was it chosen? What information does it contain? What format was it in? What size was it? How many lines/records? Provide links.

En psicología el modelo Big Five es una clasificación de rasgos de personalidad que analiza su composición en cinco dimensiones lo más ampliamente posible, a partir de estas se puede saber si una persona tiene un comportamiento conservador o más liberal, asi como también la estabilidad emocional de la misma.

Las dimensiones antes descritas son las siguientes:
 - Apertura a la experiencia: Este rasgo se encuentra mayormente desarrollado en aquellas personas con una imaginación activa y disfrutan de probar nuevas experiencias. Su contraparte es el ser conservador, reservado y resistente al cambio, el cual prefiere las cosas sencillas y conocidas.
 
 - Conciencia: Los seres más consientes poseen control sobre si mismos, lo que les permite ser organizados para planificar y ejecutar tareas. Su contraparte el ser informal, es descuidado en este ámbito y se asocia principalmente con la impuntualidad e informalidad.
 
 - Extraversión: La extraversión se asocia principalmente a aquellas personas que buscan constate compañía de otras, además se caracterizan por buscar constantemente sensaciones nuevas, tener una alta tendencia a hablar y ser muy asertivos. Su contraparte son seres introspectivos, poco dependientes del contacto social y con tendencia a preferir sensaciones conocidas y habituales.
 - Amabilidad: Este rasgo representa las interacciones interpersonales, en su polo positivo representa la generosidad, franqueza y el altruismo. En cambio, su polo negativo representa la competitividad, la arrogancia y el escepticismo.
 - Neuroticismo: Cuando característica cuando se encuentra muy desarrollada se presenta inestabilidad emocional, exceso de preocupación y ansiedad, las personas con esta característica tienen mayor tendencia al negativismo.
 Por otra parte, también encontramos personas positivistas con puntuaciones bajas, emocionalmente estables y muy confiadas.

### Contenido:
- 10 respuestas en escala Likert (1-5) por categoría Big Five + el tiempo demorado en responder
hora de inicio, ancho de ventana, alto de ventana, tiempo que se demoró en responder, país, latitud y longitud.
- Fuente:
https://www.kaggle.com/tunguz/big-five-personality-test
- Formato:
 TSV
- Tamaño:
1.015.342 respuestas del cuestionario online de Open Psychometrics

## Methods

Detail the methods used during the project. Provide an overview of the techniques/technologies used, why you used them and how you used them. Refer to the source-code delivered with the project. Describe any problems you encountered.

Para trabajar se utiliza la tecnología Apache Pig, ya que permite procesar fácilmente una gran cantidad de datos. Para poder trabajar con los datos, estos se subieron a Hadoop Distributed File System.

Cada una de las preguntas se resolvió de manera independiente del resto. 
- Resolución: Para obtener las resoluciones mínimas y máximas en la que se resolvió el test, se consideraron las columnas en las que se especifica el largo y ancho de la pantalla (Filtrando aquellas que se encontrasen en 0), posteriormente se genera una nueva columna con la multiplicación de estas, para proseguir a buscar el mínimo y máximo de esta nueva columna.

- N° AFK:
Para calcular el número de personas afk, se crea una tabla con el 'tiempo total' que se demoró cada persona en contestar el test mediante la suma del tiempo en la pantalla de inicio, el tiempo real que se demoró en contestar y el tiempo que estuvo en la pantalla final. A partir del tiempo total, se calcula el promedio y la desviación estándar de este, posterior a esto filtramos los valores de 'tiempo total' que eran mayores a el promedio más dos desviaciones estándar, de esta manera obtenemos aquellos resultados demasiado grandes, y realizamos un conteo de estos.

- Porcentaje de Concordancia con una pregunta:
Por último, para saber la pregunta en la que más personas están de acuerdo, se calculó la cantidad de respuestas y se agregó este valor en una tabla aparte, luego en la tabla original se filtró las respuestas de la pregunta para obtener solo aquellas con valores 4 o 5, posterior a esto se contó la cantidad de respuestas filtradas y esto se dividió en el total para obtener el porcentaje de concordancia con la pregunta, este mismo proceso luego se repite para cada una de las preguntas, y finalmente sacar el máximo de estas para saber cuál fue la pregunta con la que las personas estuvieron más de acuerdo.


## Results

Detail the results of the project. Different projects will have different types of results; e.g., run-times or result sizes, evaluation of the methods you're comparing, the interface of the system you've built, and/or some of the results of the data analysis you conducted.

De los resultados se puede finalmente observar el comportamiento de los encuestados, en que pregunta existe un aspecto común al estar de acuerdo  y finalmente de que tipo de dispositivos se responde esta encuesta.
### Tipo de Dispositivo
- Tamaño Mínimo: 2560 x 1440 = 3686400.0
- Tamaño Máximo: 320 x   401 = 128320.0

#### Tamaño Real del mínimo de pantalla
![](https://github.com/CArielSanchez/2020-pig-big-personalities-big-pig/blob/master/pantalla.PNG)
### Personas AFK
  - N° Personas AFK: 107
  - Tiempo Máximo: 11 días
  - Tiempo Mínimo: 1 hora
  
  #### Comparando AFK con la totalidad de la muestra 
  ![](https://github.com/CArielSanchez/2020-pig-big-personalities-big-pig/blob/master/afk-graph.PNG)
### Pregunta con la que se está más de acuerdo
  - Pregunta: I start conversations
  - Código: EXT5
  - Concordancia: 48.49%

## Conclusión

Luego de este análisis podemos concluir que el cuestionario fue respondido con interés por la mayoría de las personas, ya que al ser 50 preguntas se espera que muchos de los encuestados no completen el test inmediata y constantemente, sin embargo solo un 0.01% de los encuestados presento este tipo de conductas, los que podrían ser eliminados para un estudio más profundo de las mismas respuestas del test.

Además podemos ver una clara tendencia hacia una de las preguntas del área de extroversión, en donde la mayoría de las personas se encuentra de acuerdo, sin embargo de este análisis no se puede obtener una respuesta más profunda, lo que lleva a cuestionarse si este rasgo es una imposición social o una característica común de nuestra especie.

Finalmente podemos concordar en que el uso de Pig fue esencial para poder procesar y trabajar con un poco más de un millón de filas de datos, además de poder manejar grandes volúmenes de datos Pig ofrece una sintaxis bastante intuitiva y amigable para el usuario, además de contar con una documentación ordenada y ejemplificada.
Finalmente aunque Pig puede procesar grandes volúmenes de datos se debe tener especial cuidado al realizar consultas consecutivas, y unirlas posteriormente como es el caso de 'la pregunta con la que se está más de acuerdo', donde una única optimización en la manera en que se ve la tabla inicial podría permitir el análisis consecutivo de todas las preguntas sin tener que repetir código y gastar un tiempo excesivo en el cálculo de todos los valores por separado, permitiendo además que esta query sea de fácil actualización.
