---
title: "Los mismos de siempre"
date: 2019-09-10
author: "Matias Andina"
tags: ["R","learning"]
output:
  html_document:
    code_folding: hide
---


Hace rato que vengo viendo ciertas tendencias de gente que hace algo de análisis de datos con la actualidad Argentina. Por ejemplo, [Daniel Schteingart](https://twitter.com/danyscht) comúnmente publica este tipo de análisis en diversos medios. Esto me llevó a buscar datos abiertos disponibles para jugar un rato.  

En general, a mí me interesa más debatir sobre la implementación de políticas y pienso que el Poder Legislativo merece mayor atención. Siento que sobrestimamos (para bien y para mal) el poder de un Ejecutivo que es, al final del día, mucho menos determinante que aquellos que escriben las leyes según las cuales se rige el Estado. Exigimos representantes que nos representen. 

# Senadores

[Wikipedia](https://es.wikipedia.org/wiki/Senado_de_la_Naci%C3%B3n_Argentina) dice: "El Senado es el órgano federal por excelencia del país, donde cada senador representa los intereses de su provincia.". Basta con leer la introducción del artículo para recordarse a uno mismo por qué es tan importante tener un Senado que funcione. Entre otras tareas sin mundanas, aparentemente el Senado tiene la potestad de "autorizar al presidente de la Nación para que declare el estado de sitio" y de asegurar una correcta distribución de los recursos federales. Quizás cuesta entender por qué los requisitos para ser Senador son tan bajos[^requisitos-senador].

<center>

![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Logo_del_Senado_de_Argentina.svg/368px-Logo_del_Senado_de_Argentina.svg.png)
</center>


Pues bien, entonces comencemos por el Senado, que tiene, además, la base de datos más completa. Pero, antes, un pequeño repaso sobre cómo se eligen los representantes y la duración de sus mandatos. 

> Elecciones. La cámara de Senadores se renueva por tercios cada dos años. Los senadores son electos directamente por el pueblo. Los mandatos de los senadores son por seis años y pueden ser reelegidos en sus funciones indefinidamente.









Las bases de datos utilizadas en este artículo son de acceso público. La base de datos de Senadores puede encontrarse en www.senado.gov.ar y www.congreso.gob.ar.

## Senadores por período

Empecemos mirando cómo evolucionaron las bancas a lo largo de nuestra historia. Vemos un comienzo con algo de recambio, seguido de un período con bajo recambio. A partir de 1930, empezamos a ver los vaivenes de un país pendular que recae en dictaduras con disolución del Poder Legislativo. Las últimas dos dictaduras están marcadas en rojo, seguidas de un alto recambio en el número de bancas (asignación de nuevos Senadores cuando se restituye el Poder Legislativo). El otro pico que llama la atención es el 2001, máximo evento de recambio en nuestra historia. Hoy por hoy, podría decirse que gozamos de unas dos décadas de estabilidad en las instituciones, en donde vemos un recambio de entre 20 y 30 bancas regularmente.  

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/evolucion-bancas-1.png" width="672" />


## ¿Cuánto dura un período?
 
La longitud de los mandatos ha cambiado a lo largo de la historia. Además, existieron períodos en los cuales intentar ser senador no parecía una carrera a largo término (cortesía de la inestabilidad de las instituciones argentinas durante gran parte del siglo XX). 

Un gran número de senadores no cumplen su mandato completo, ya sea por muerte, renuncia (a veces para ocupar otro cargo) o por destitución. Afortunadamente, en las últimas décadas, la tendencia parece estabilizarse hacia la longitud de mandato designada en la ley. 




<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/unnamed-chunk-1-1.png" width="672" />

  


## ¿Quién quiere repetir?

La permanencia de un senador -- o de cualquier otro político -- en el cargo es un tema de debate interesante. En primer lugar, uno esperaría que cualquier trabajador con experienca y conocimiento sobre su área sea más eficiente y productivo. En criollo, si me tengo que operar de apendicitis mañana, prefiero un médico que haya realizado 1350 cirugías de apéndice que uno que haya realizado 12[^nihablar]. Luego, si trasladamos este razonamiento a nuestras instituciones deberíamos querer que el Senado esté compuesto de políticos con muchos años de experiencia en la cámara alta. 

El problema radica en identificar cuáles son los puestos que se parecen al del médico haciendo la misma cirugía y aquellos que no. Tomemos el ejemplo de los burócratas del Estado de carrera, los estadístas, los responsables de mantenimiento de infraestructura. Esta es la gente que hace funcionar el aparato, sin ellos, no hay implementación, no hay político que pueda hacer nada. Una cosa podría que identificarlos es que todos ellos deberían ser apolíticos y, como tales, deberían poder cumplir su labor siendo independientes del gobierno de turno[^apoliticos]. Los investigadores del CONICET y los maestros también son buenos ejemplos de este tipo de empleados de Estado[^aun-asi].   

En cambio, el rol de los integrantes del Poder Legislativo está contaminado por el hecho de que, entre otras cosas: 

1) Legislan su propio salario. 
2) Tienen la postestad de regular actividades económicas de manera conveniente.
3) Tienen re-elección indefinida.

Por supuesto, podemos sumar el cúmulo de *beneficios legales* (como canjear viáticos por dinero en efectivo y discresionalidad de presupuesto) y aquellos *no legales* (en criollo, corrupción). Pero éste no es el lugar para analizar eso, focalicemos en los períodos. Los datos mandan, así que veamos qué es lo que dicen. Históricamente, la gran mayoría de senadores no repite su cargo.

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/repetidores-barplot-1.png" width="672" />

### Repetidores por su nombre

Este fenómeno puede explicarse por múltiples causas. Antes de cualquier análsis, veamos quiénes son los *repetidores*. 

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/repetidores-1.png" width="672" />

Acá vemos por primera vez algunos nombres que suenan más a calle o a localidad que a lo que hicieron. Pero también vemos algunos nombres bastante familiares y actuales. Recordemos que 4 o 5 mandatos son, según la duración de mandato actual, entre 24 y 30 años en el mismo puesto! 

###  Máximos reemplazantes
  
Una curiosidad ingenua me llevó a preguntarme cuáles son los máximos reemplaznates. Me pregunte si, quizás, existía una caja con senadores de repuesto que pudieran cumplir los roles una vez que la figurita política de turno lograba conseguir los votos. 
En otras palabras: ¿Es posible que exista un grupo de senadores *comodín*? Los datos presentan una triste realidad, una en la que la historia del Poder Legislativo Argentino está contaminada por sucesivas *disoluciones*. Llamémosles por su nombre, Golpes de Estado. Aún así, hay algunos senadores que han tomado la posta como suplente en reiteradas ocasiones.


<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Reemplazante </th>
   <th style="text-align:right;"> Número de casos </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> DISOLUCION DEL P. LEGISLATIVO, </td>
   <td style="text-align:right;"> 269 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ES SENADOR SUPLENTE, </td>
   <td style="text-align:right;"> 18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VACANTE HASTA DISOLUC.P.L., </td>
   <td style="text-align:right;"> 15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VACANTE HASTA FIN DEL PERIODO, </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> JUAREZ, CARLOS ARTURO </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MAYANS, JOSÉ MIGUEL ÁNGEL </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MORALES, GERARDO RUBÉN </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ROMERO, JUAN CARLOS </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VERNA, CARLOS ALBERTO </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
</tbody>
</table>
  

## Dias en el poder legislativo

Quiero hacer énfasis en la cantidad de días en el poder que implica repetir mandatos. Por eso, ordené a los senadores según el número de días que estuvieron (o aún están). Esta herramienta es simplemente para facilitar la visualización de los casos más extremos.
  
<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/dias-poder-1.png" width="672" />

Sólo dos ejemplos, el resto de tarea:

[Vidal](https://es.wikipedia.org/wiki/Juan_Ram%C3%B3n_Vidal) fue gobernador de la provincia de Corrientes (dos veces), diputado, senador por 32 años (literalmente hasta su muerte, a los 80 años).
[Mendoza](https://es.wikipedia.org/wiki/Eriberto_Mendoza) fue legislador provincial, diputado, gobernador de San Luis y luego senador por 27 años.

Independientemente de lo grandiosas o nefastas de sus contribuciones y el servicio a su País, queda claro que la carrera política les permitió perpetuarse de formas que no sólo imposibles en la mayoría de otros gremios, sino que son mucho más peligrosas para la Nación.  

Una cosa que resulta interesante es que pareciera que existen dos tipos de senadoes. Existe un quiebre entre aquellos que se quedan 1 o 2 mandatos y los demás, que se perpetúan en el cargo al mejor estilo Julio Grondona (`#TodoPasa`). 


<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/ajuste-piece-wise-1.png" width="672" />
  

Es interesante que en ningún momento busqué los 10 años como punto de quiebre, este valor surgió de hacer una simple regresión partida. Podemos ver que los casos más extremos se desvían bastante de la regresión (sugiriendo un incremento aún más fuerte que uno lineal), pero me pareció una forma de simplificar el asunto: más de dos mandatos y estás para quedarte, no por un rato, para quedarte a vivir.   
  
  
## Esto es nuevo  

A pesar que los ejemplos con el récord de días tienen más de un siglo, la realidad es que, desde el retorno a la democracia, el cierto grado de estabilidad institucional ha permitido que estas prácticas se exacerben.  

En el siguiente gráfico muestra los períodos de los 60 legisladores con mayor cantidad de días en el poder. Vale recalcar que dos mandatos de 9 años te colocan muy arriba en el el ránking, mientras que necesitarías 3 mandatos completos con la nueva longitud de 6 años para llegar a la misma cantidad. Es fácil ver que, entre 1850 y 1930, existieron períodos con ciertos senadores ocupando las bancas de manera prolongada. Sin embargo, estamos hablando de un período político en donde ni siquiera se había legislado la [Ley Saenz Peña](https://es.wikipedia.org/wiki/Ley_S%C3%A1enz_Pe%C3%B1a) o recién se había implementado. Ver tanto abuso no es sorprendente si el proceso es fundamentalmente anti-democrático y los períodos son tan largos.

Desde el último retorno a la democracia, un número importante de senadores se han perpetuado de manera impresionante, incluso integrando más de un partido político (ver también [el color de la camiseta](#color)). 

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/unnamed-chunk-2-1.png" width="672" />








## El color de la camiseta {#color}

Tradicionalmente, la UCR y el partido Justicialista son los grupos más convocantes. El siguiente gráfico muestra la evolución de las bancas para cada partido.

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/unnamed-chunk-4-1.png" width="672" />


Además de demostrar lealtad a su partido, los senadores son representantes según su provincia. Uno esperaría que tengan fuerte arraigo y sean portavoces de las necesidades particulares de aquellos a los que representan. Esto, en gran medida, se ve reflejado en que la mayoría de senadores únicamente se presenta por una provincia. Sin embargo, hay senadores fueron electos en más de una provincia:

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Senador </th>
   <th style="text-align:right;"> Número de provincias </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> ECHAGÜE,  PASCUAL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ELIAS,  ANGEL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FERNÁNDEZ DE KIRCHNER, CRISTINA E. </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FERRE,  PEDRO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IGARZABAL,  RAFAEL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IRIGOYEN,  BERNARDO DE </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LEGUIZAMÓN, MARÍA LAURA </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LEIVA,  MANUEL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SAGUIER,  FERNANDO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
</tbody>
</table>

Un hecho más interesante es el cambio de partido. No me queda claro si esto habla de la inestabilidad en el tiempo de los partidos o de que algunos senadores se orientan con la corriente (por ponerlo de manera políticamente correcta).

Los siguientes senadores ejercieron cargo representando a más de un partido:

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Senador </th>
   <th style="text-align:right;"> Número de partidos </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> ALPEROVICH, JOSÉ JORGE </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BASUALDO, ROBERTO GUSTAVO </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BLAS, INÉS IMELDA </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRAVO, LEOPOLDO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRITOS, ORALDO NORVEL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CARO,  JOSE ARMANDO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CASTILLO, OSCAR ANÍBAL </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CASTRO, MARÍA ELISA </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CLOSS, MAURICE FABIÁN </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> COLAZO, MARIO JORGE </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ELÍAS DE PEREZ, SILVIA BEATRIZ </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ESCUDERO, SONIA MARGARITA </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FELLNER, LILIANA BEATRIZ </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FERIS, GABRIEL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FERNÁNDEZ DE KIRCHNER, CRISTINA E. </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FERNÁNDEZ, NICOLÁS ALEJANDRO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FUENTES, MARCELO JORGE </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GIACOPPO, SILVIA DEL ROSARIO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GIUSTINIANI, RUBÉN HÉCTOR </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GONZÁLEZ, MARÍA TERESA MARGARITA </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GUASTAVINO, PEDRO GUILLERMO ÁNGEL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GUINLE, MARCELO ALEJANDRO HORACIO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> JENEFES, GUILLERMO RAÚL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LATORRE, ROXANA ITATÍ </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LEGUIZAMÓN, MARÍA LAURA </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MARINO, JUAN CARLOS </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MARTIARENA, JOSE H. </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MAYANS, JOSÉ MIGUEL ÁNGEL </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MAZA, ADA MERCEDES </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MENEM, CARLOS SAÚL </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MORALES, GERARDO RUBÉN </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MURGUIA, EDGARDO P. </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NEGRE DE ALONSO, LILIANA TERESITA </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PETCOFF NAIDENOFF, LUIS CARLOS </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PICHETTO, MIGUEL ÁNGEL </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> REUTEMANN, CARLOS ALBERTO </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RODRÍGUEZ SAÁ, ADOLFO </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ROMERO, JUAN CARLOS </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SAADI, VICENTE LEONIDAS </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SANZ, ERNESTO RICARDO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SNOPEK, CARLOS </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TEISAIRE,  ALBERTO </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VIUDES, ISABEL JOSEFA </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
</tbody>
</table>

## Y luego, 2001


### Explosión de partidos
  
> Si esto no les gusta, hagan un partido político, ganen las elecciones y después hagan lo que quieran
> -- CFK, 2012





Desde el comienzo de los tiempos, el número total de partidos registrados que lograron obtener una banca en el Senado es de 109 partidos.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Etapa </th>
   <th style="text-align:right;"> Número de partidos </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> pre-2001 </td>
   <td style="text-align:right;"> 47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> post-2001 </td>
   <td style="text-align:right;"> 70 </td>
  </tr>
</tbody>
</table>

  
  
#### Ajuste por alianzas

Aún cuando ajustamos por las múltiples alianzas (los justicialistas, la UCR y las distintas formas de Kirchnerismo y PRO). Las diferencias entre antes y después del 2001 son impresionantes.


<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Etapa </th>
   <th style="text-align:right;"> Número de partidos </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> post-2001 </td>
   <td style="text-align:right;"> 48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pre-2001 </td>
   <td style="text-align:right;"> 41 </td>
  </tr>
</tbody>
</table>

Esta era también ve la desaparición de los partidos tradicionales y la aparición de otros[^simplificar].





<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/unnamed-chunk-8-1.png" width="672" />
  
  

## Partidos por su nombre

Por pura diversión, imaginemos que queremos crear un partido político en argentina. Pero no queremos un partido cualquiera, queremos un partido que logre poner bancas en el senado. Si nos olvidamos de la política y las promesas de campaña, ¿cuáles son las palabras que deberían aparecer en el nombre para lograr nuestro cometido? 

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/tidy-text-process-1.png" width="672" />

![](/img/senadores_wordcloud.png)

## La red de partidos

El siguiente gráfico muestra cómo están conectados los senadores con los distintos partidos. Es interesante ver la corriente ideológica del justicialismo, desde el Peronismo hasta el Frente para la Victoria. También es bastante claro el bunker de la UCR.

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/unnamed-chunk-9-1.png" width="672" />




# Diputados 

<center>
![](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/C%C3%A1mara_de_diputados_de_Argentina.svg/300px-C%C3%A1mara_de_diputados_de_Argentina.svg.png)
</center>

La base de diputados comienza en 2007-12-10. Por esto no realice análisis como el de los senadores.

Algunas cosas que esta base sí tiene son datos de género.

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Género </th>
   <th style="text-align:right;"> Número de diputados </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> F </td>
   <td style="text-align:right;"> 433 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M </td>
   <td style="text-align:right;"> 734 </td>
  </tr>
</tbody>
</table>


Si bien la ley exige presencia de mujeres en las listas, aún estamos lejos de alcanzar un 50% de representación femenina.  

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/unnamed-chunk-11-1.png" width="672" />


Un dato interesante es la fuerte presencia de partidos mayoritarios, y una cámara llena de minorías, con partidos que sólo consiguieron un representante.

<img src="/post/2019-09-10-los-mismos-de-siempre/index_files/figure-html/unnamed-chunk-12-1.png" width="672" />



## Código
  
Para aquellos que estén interesados en reproducir este análisis, dejo el código utilizado. 



```r
knitr::opts_chunk$set(comment=NA, message = FALSE, warning = FALSE)
knitr::opts_chunk$set(echo = FALSE)

my_caption = "Fuente: www.congreso.gob.ar"
my_twitter = "Matias Andina (@NeuroMLA)"

library(tidyverse)
library(readxl)
library(httr)
library(lubridate)
library(cowplot)
library(knitr)
library(kableExtra)
library(tidytext)
library(wordcloud)

diputados_file <- "diputados.csv"

if(file.exists(diputados_file)){
  diputados <- read.csv(diputados_file, stringsAsFactors = FALSE)
} else {
  diputados <- readr::read_csv('https://datos.hcdn.gob.ar/dataset/a80e0fa7-d73a-4ed1-9dec-80465e368951/resource/169de2eb-465f-4007-a4c2-39a5ba4c0df3/download/diputados1.8.csv')

}
  
senadores_file <- "senadores.csv"

if(file.exists(senadores_file)){
  senadores <- read.csv(senadores_file, stringsAsFactors = FALSE)
} else {
url_senado <- "https://www.senado.gov.ar/micrositios/DatosAbiertos/ExportarListadoSenadoresHistorico/Excel"
GET(url_senado, write_disk(tf <- tempfile(fileext = ".xls")))
senadores <- readxl::read_excel(tf, 1L) %>%
  janitor::clean_names()
unlink(tf)
  
}


# remover al senador llamado ","

senadores <- filter(senadores, senador != ",")

senadores %>%
  group_by(inicio_periodo_legal) %>%
  count() %>%
  ggplot(aes(ymd(inicio_periodo_legal), y=n))+
  geom_rect(data=NULL,
            xmin=ymd("1976-03-24"),
            xmax=ymd("1983-12-10"),
            ymin=0, ymax=Inf,
            fill='red', color=NA, alpha=0.005)+
  geom_rect(data=NULL,
            xmin=ymd("1966-06-28"),
            xmax=ymd("1973-05-25"),
            ymin=0, ymax=Inf,
            fill="red", color=NA, alpha=0.005)+
  geom_segment(aes(x=ymd(inicio_periodo_legal),
                   xend=ymd(inicio_periodo_legal),
                   y=0, yend=n))+
  geom_point(aes(size=n))+
  theme_bw()+
  guides(size=guide_legend(title="Bancas"))+
#  scale_x_date(breaks = "25 years",date_labels = "%Y")+
  theme(panel.grid.major.x = element_blank(),
        legend.justification = c(0, 1),
        legend.position = c(0, 1),
        legend.box.margin=margin(c(10,10,10,10)),
        legend.direction = "horizontal",
        legend.background = element_rect(fill="white",
                                         color="black",
                                         size=0.2,
                                         linetype="solid"))+
  xlab("") + ylab("Bancas Renovadas")+
  labs(title = "Evolución de bancas en el Senado Argentino",
       subtitle = "Matias Andina (@NeuroMLA)",
       caption= "Fuente: www.congreso.gob.ar")+
  NULL



senadores %>%
  mutate(duracion = ymd(cese_periodo_real) - ymd(inicio_periodo_real),
         year = year(inicio_periodo_real)) %>%
   mutate(cese_periodo_real = ifelse(cese_periodo_real=="Sin Datos",
                                    as.character(today()),
                                    cese_periodo_real)) %>% 
  group_by(year) %>%
#  summarise(media = mean(duracion),
#            minimo = min(duracion),
#            maximo = max(duracion)) %>%
  ggplot(aes(year, duracion))+
  geom_hline(yintercept = c(6, 9) * 365, lty=2)+
  geom_point(color="black", alpha=0.2)+
  geom_smooth(color="darkorange")+
  xlab("") + ylab("Duración (días)")+
  labs(title="Duración del mandato",
       subtitle = paste0("Cada punto es la duracion de un mandato.\nLa linea de tendencia muestra un ajuste no lineal. Las líneas punteadas muestran 6 y 9 años.\n",
                         my_twitter),
       caption = my_caption
       )

count_by_sen <- senadores %>%
  group_by(senador) %>%
  count() %>% 
  arrange(desc(n)) %>%
  ungroup() %>%
  mutate(rank = c(1:length(unique(senadores$senador))))


summ_repite <-   count_by_sen %>%
  mutate(repite = ifelse(n > 1, "Repite", "No Repite")) %>%
  count(repite) %>%
  mutate(total=sum(n), percent=round(n/total*100,2))


  count_by_sen %>%
  mutate(repite = ifelse(n > 1, "Repite", "No Repite")) %>%
  ggplot(aes(repite, fill=repite)) + 
  geom_bar() +
  geom_text(data=summ_repite, aes(repite, y = 50,
                                  label= paste0(n, " (", percent, "%)")),
            fontface="bold", color="white")+
  theme_bw() +
  xlab("") + ylab("Número de senadores")+
  theme(legend.position = "none")+
  scale_fill_manual(values = c("gray30", "orange"))+
  labs(title="Reincidencia Legislativa",
       subtitle = paste0("Aproximadamente un 20% de los legisladores cumplieron más de un mandato.\n",my_twitter),
       caption=my_caption)


p <- count_by_sen %>%
     dplyr::filter(n > 1) %>%
     ggplot(aes(rank, n))+
     geom_point(aes(color=factor(n)))+
     ylim(0, 6)+
     scale_y_continuous(breaks = 1:5)+
     scale_color_manual(values = c("black", "black", "orange", "red"))+
     theme(legend.position = "none")+
     ylab("Número de períodos")+
     xlab("Senadores según número de orden.\nRanking descendente")+
  labs(title="Repetidores por su numbre",
       subtitle = paste0("Senadores con más de un período, ordenados según el numero de períodos.\n", my_twitter),
       caption = my_caption)

  inset <- dplyr::filter(count_by_sen, n >= 4) %>%
           mutate(col = n>4) %>%
    ggplot(aes(1, -rank, color=col)) + 
    geom_text(aes(label=senador),
              size=3) + 
    theme_void()+
    theme(legend.position = "none")+
    scale_color_manual(values = c("orange", "red"))

  plot_grid(p, inset, align="h", rel_widths = c(2,1))

  senadores %>%
    count(reemplazo) %>%
    arrange(desc(n)) %>%
    head(n=10) %>%
    knitr::kable(col.names = c("Reemplazante", "Número de casos")) %>%
    kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"),
                  full_width = FALSE)


# Calcular el numero de dias en el poder
dias_poder <-  senadores %>%
   mutate(cese_periodo_real = ifelse(cese_periodo_real=="Sin Datos",
                                    as.character(today()),
                                    cese_periodo_real)) %>%
  mutate_at(.vars = vars(cese_periodo_real,
                      inicio_periodo_real),
              .funs =  list(ymd)) %>%
    # Calcular diferencia de dias
    mutate(dias = cese_periodo_real - inicio_periodo_real) %>%
    # group_by(senador, provincia) %>%
    group_by(senador) %>%
    # sumar dias por senador
    summarise(desde = min(inicio_periodo_real),
              hasta = max(cese_periodo_real),
              total_dias = ymd(hasta) - ymd(desde),
              total_mandato = as.numeric(sum(dias))) %>%
    filter(senador != ",") %>%
    arrange(desc(total_mandato))

# Hacer el ranking plot
part_plot <- dias_poder %>%
  ggplot(aes(as.numeric(fct_reorder(senador, total_mandato)), y=total_mandato)) +
  geom_point(color="gray70")+
  theme_bw()+
#  xlim(c(0, nrow(senadores))+
  theme(axis.text.x =element_blank(),
        axis.ticks.x = element_blank(),
        legend.position = "none",
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank())+
  labs(x="Senadores según número de orden.\nRanking ascendente",
       y="Días de Mandato",
       title="Ranking de Senadores",
       subtitle=my_twitter,
       caption= my_caption) 

reg <- dias_poder %>%
  arrange(total_mandato) %>%
  mutate(orden = 1:length(senador)) %>% 
  select(total_mandato, orden)

# Con los nombres
part_plot +
  ggrepel::geom_label_repel(data=head(dias_poder, 5),
                            aes(x=tail(reg$orden, 5),
                                label=senador),
                            xlim = c(NA, nrow(senadores) - 400),
                            force=10,
                            segment.color = "black")




# Pareciera una funcion partida
piece_wise <- segmented::segmented(lm(total_mandato ~ orden, data=reg))
coef_piece <- coefficients(piece_wise)
break_point <- piece_wise$psi[,2]
new_zero <- predict(piece_wise, newdata = data.frame(orden = break_point))
new <- data.frame(orden = c(break_point, break_point + 1),
           total_mandato = c(new_zero, predict(piece_wise, data.frame(orden = break_point + 1))))

new_lm <- lm(data= new, total_mandato ~ orden)

# Plot con el ajuste
part_plot +
  # Add the line using the fortified fit data, plotting the x vs. the fitted values
  # ggplot() +
  # geom_line(data = fortify(piece_wise), aes(x = orden, y = .fitted))+
  geom_vline(xintercept = break_point, lty=3)+
  geom_abline(intercept = coef_piece[1],
              slope = coef_piece[2],
              col=RColorBrewer::brewer.pal(3, "Set1")[1],
              lwd=0.8)+
  geom_abline(intercept = coefficients(new_lm)[1],
              slope = coefficients(new_lm)[2],
              col=RColorBrewer::brewer.pal(3, "Set1")[2],
              lwd=0.8)+
  geom_hline(yintercept = seq(0, 365 * 40, 365*10), lty=2, color="gray50")+
  annotate("text", x=100, y=365*10 + 500, label="10 años")+
  annotate("text", x=break_point - 100, y = 13000,
           label="punto de \nquiebre") 


# crear una lista de los senadores para grafica segun los tiempos
top_sen <- dias_poder %>%
  top_n(total_mandato, n = 60) %>%
  pull(senador)


segment_plot_df <- filter(senadores, senador %in%  top_sen) %>%
  left_join(dplyr::select(dias_poder, senador, total_mandato), by="senador") %>%
mutate(cese_periodo_real = ifelse(cese_periodo_real=="Sin Datos",
                                  as.character(today()),
                                  cese_periodo_real)) 
  
ggplot(segment_plot_df,
       aes(x=fct_reorder(senador, total_mandato),
           y=ymd(cese_periodo_real),
           color=partido_politico))+
  geom_segment(aes(xend=senador,
                   y=ymd(inicio_periodo_real),
                   yend=ymd(cese_periodo_real)),
               lwd=2)+
  coord_flip()+
#  facet_wrap(~provincia, scales="free_y")+
  theme(axis.text.y=element_blank(),
        axis.ticks.y = element_blank(),
        legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill="gray30"))+
#  geom_rect(data=NULL,
#            ymin=ymd("1976-03-24"),
#            ymax=ymd("1983-12-10"),
#            xmin=0, xmax=Inf,
#            fill='red', color=NA, alpha=0.005)+
#  geom_rect(data=NULL,
#            ymin=ymd("1966-06-28"),
#            ymax=ymd("1973-05-25"),
#            xmin=0, xmax=Inf,
#            fill="red", color=NA, alpha=0.005)
  geom_hline(yintercept = ymd("1983-12-10"), lty=2,
             color="gray90")+
  scale_color_viridis_d(option = "B", direction = 1)+
  xlab("Senador") + ylab("")+
  labs(title = glue::glue("Top ",
                          length(unique(segment_plot_df$senador)),
                          " senadores según longitud de mandato."),
       subtitle= paste0("Color indica partido político. La línea punteada indica el último retorno a la democracia (1983).\n", my_twitter),
       caption= my_caption)


repetidores <- count_by_sen %>% filter(n>1) %>% pull(senador)

repetidores_ordenado <- senadores %>%
  mutate(year = year(inicio_periodo_real)) %>% 
  arrange(year) %>%
  dplyr::select(senador, year, partido_politico) %>%
  mutate(nuevo = ifelse(senador %in% repetidores, "Repite", "Nuevo"))

# This is the first time each senator was elected, even they repeted later
first_time <- purrr::map(repetidores,
                         function(senador) min(which(str_detect(string=repetidores_ordenado$senador,
                                                                pattern = senador)))) %>%
  unlist()

# Now go back to replace that in the data frame
repetidores_ordenado[first_time, "nuevo"] <- "Nuevo"


repetidores_plot <- repetidores_ordenado %>%
  group_by(year) %>%
  count(nuevo) %>%
  ungroup()%>% #mind the ungroup! complete does not work otherwise
  complete(year, nuevo, fill = list(n = 0)) %>%
  group_by(year) %>%
  mutate(total=sum(n), percent=n/total * 100 %>% round(., 2))

p1 <- ggplot(filter(repetidores_plot, year %in% seq(1929, 1963, 2)),
       aes(year, percent, color=nuevo)) +
  geom_area(aes(fill=nuevo)) + theme(legend.position="none")


p2 <- ggplot(filter(repetidores_plot, year %in% seq(1981, 2017, 2)),
       aes(year, percent, color=nuevo)) +
  geom_area(aes(fill=nuevo)) + theme(legend.position="none")

p3 <- ggplot(filter(repetidores_plot, year %in% seq(1929, 1963, 2)),
       aes(year, n, color=nuevo)) +
  geom_area(aes(fill=nuevo)) + theme(legend.position="none")

p4 <- ggplot(filter(repetidores_plot, year %in% seq(1981, 2017, 2)),
       aes(year, n, color=nuevo)) +
  geom_area(aes(fill=nuevo)) + theme(legend.position="none")


cowplot::plot_grid(p1, p2, p3, p4, nrow = 2, ncol =2)


# Evolucion de partidos tradicionales

justicia_ucr <- senadores %>%
  filter(str_detect(partido_politico,
                    "JUSTICIALISTA|UNIÓN CÍVICA RADICAL|
                    U. C. R"))
  
justicia_ucr <- justicia_ucr %>%
  # Todas las facciones de la UCR van juntas
  mutate(partido_politico = ifelse(str_detect(partido_politico, "^U."),
                                   "UNIÓN CÍVICA RADICAL", partido_politico),
         # todos los "justicialistas juntos"
         partido_politico = ifelse(str_detect(partido_politico, "JUSTICIA"),
                                   "JUSTICIALISTA", partido_politico),         
         year = year(inicio_periodo_legal)) %>%
  group_by(year) %>%
  count(partido_politico) %>%
  mutate(total_year = sum(n), 
         proportion = n/total_year)

  
  ggplot(justicia_ucr,
         aes(year, n, fill=partido_politico))+
  geom_area(alpha=0.8) +
#  geom_point()+
  facet_wrap(~partido_politico)+
#  guides(fill=guide_legend(nrow=2,byrow=TRUE))+
  scale_fill_brewer(palette = "Set1")+
#  geom_text(data=filter(justicia_ucr, year %in% c(1983, 2001)),
#            aes(year, n+5, label=n))
  theme_bw()+
  xlab("") + ylab("Número de Bancas")+  
  theme(legend.position = "none")+
  labs(title = "Partidos Tradicionales",
       subtitle = paste0("Partidos que se identifican como Justicialistas por su nombre fueron agrupados.\nPartidos que se identifican con la UCR por su nombre fueron agrupados.\n", my_twitter),
       caption= my_caption)+
  NULL

# Estos senadores fueron senadores por mas de una provincia

group_by(senadores, senador) %>%
  count(provincia) %>%
  distinct(senador, provincia) %>%
  count(senador) %>%
  filter(n > 1) %>%
  knitr::kable(col.names = c("Senador", "Número de provincias")) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"),
                  full_width = FALSE)

group_by(senadores, senador) %>%
  count(partido_politico) %>%
  distinct(senador, partido_politico) %>%
  count(senador) %>%
  filter(n > 1) %>%
  knitr::kable(col.names = c("Senador", "Número de partidos")) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"),
                  full_width = FALSE)

total_partidos <- senadores %>%
  summarise(partidos = length(unique(partido_politico))) %>%
  pull(partidos)


senadores %>%
  mutate(
    year = year(inicio_periodo_legal),
    etapa = ifelse(year > 2001, "post-2001", "pre-2001")) %>%
  group_by(etapa) %>%
  summarise(partidos_unicos = length(unique(partido_politico)))%>%
  arrange(partidos_unicos) %>%
  knitr::kable(col.names = c("Etapa", "Número de partidos")) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"),
                  full_width = FALSE)
  
senadores %>%
  # TODO JUSTICIALISTA
  mutate(partido_politico = ifelse(str_detect(partido_politico, "JUSTICIALISTA"),
                                   "JUSTICIALISTA", partido_politico))%>%
  # Todo FPV
  mutate(partido_politico = ifelse(str_detect(partido_politico, "FRENTE PARA LA VICTORIA"),
                                   "FRENTE PARA LA VICTORIA", partido_politico))%>%
  # TODO PRO
  mutate(partido_politico = ifelse(str_detect(partido_politico, "UNIÓN PRO|CAMBIEMOS"),
                                   "PRO -- CAMBIEMOS", partido_politico))%>%
  # Todas las facciones de la UCR van juntas
  mutate(partido_politico = ifelse(str_detect(partido_politico, "^U."),
                                   "UNIÓN CÍVICA RADICAL", partido_politico)) %>%
  mutate(
    year = year(inicio_periodo_legal),
    etapa = ifelse(year > 2001, "post-2001", "pre-2001")) %>%
  group_by(etapa) %>%
  summarise(partidos_unicos = length(unique(partido_politico)))%>%
  knitr::kable(col.names = c("Etapa", "Número de partidos")) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"),
                  full_width = FALSE)

  post_2001 <- senadores %>%
    mutate(year = year(inicio_periodo_legal)) %>%
    filter(year > 2001) %>%
    # TODO JUSTICIALISTA
    mutate(partido_politico = ifelse(str_detect(partido_politico, "JUSTICIALISTA"),
                                     "JUSTICIALISTA", partido_politico))%>%
    # Todo FPV
    mutate(partido_politico = ifelse(str_detect(partido_politico, "FRENTE PARA LA VICTORIA"),
                                     "FRENTE PARA LA VICTORIA", partido_politico))%>%
    # TODO PRO
    mutate(partido_politico = ifelse(str_detect(partido_politico, "UNIÓN PRO|CAMBIEMOS"),
                                     "PRO -- CAMBIEMOS", partido_politico))%>%
    group_by(year) %>%
    count(partido_politico) %>%
    mutate(total_year = sum(n), 
           proportion = n/total_year)
  ggplot(filter(post_2001, n>3) %>% mutate(partido_politico = factor(partido_politico, levels = c("JUSTICIALISTA", "UNIÓN CÍVICA RADICAL", "FRENTE PARA LA VICTORIA", "PRO -- CAMBIEMOS"))),
         aes(year, n, fill=partido_politico, color=partido_politico))+
    geom_area(alpha=0.8) +
    geom_point()+
    facet_wrap(~partido_politico)+
    #  guides(fill=guide_legend(nrow=2,byrow=TRUE))+
    scale_fill_brewer(palette = "Set1")+
    scale_color_brewer(palette = "Set1")+
    #  geom_text(data=filter(justicia_ucr, year %in% c(1983, 2001)),
    #            aes(year, n+5, label=n))
    theme_bw()+
    xlab("") + ylab("Número de Bancas")+  
    theme(legend.position = "none")+
    labs(title = "Post 2001",
         subtitle = paste0("Partidos politicos agrupados en categorías según uso de terminos en el nombre oficial.\n", my_twitter),
         caption= my_caption)  +
  NULL


partidos <- senadores %>%
  mutate(partido_politico = str_replace(partido_politico, "U. C. R.", "UCR")) %>%
  filter(partido_politico != "SIN ESPECIFICAR") %>%
  pull(partido_politico)  
partidos <- unlist(str_split(partidos, ' '))

# common words
custom_stop_words <- bind_rows(stop_words,
                               tibble(word = tm::stopwords("spanish"),
                                      lexicon = "custom"))

# tokenize
tokens <- data.frame(word = partidos, stringsAsFactors = FALSE) %>% 
  unnest_tokens(word, word) %>% 
  anti_join(custom_stop_words) %>%
  dplyr::count(word, sort = TRUE) %>% 
  ungroup()

# define a nice color palette
pal <- brewer.pal(8,"Dark2")

# Check for wordcloud

wordcloud_file <- "senadores_wordcloud.png"

if(!file.exists(wordcloud_file)){
# plot the 50 most common words
devtools::source_url("https://raw.githubusercontent.com/matiasandina/stepfinder/master/R/open_graphic_window.R")
open_graphic_window()
tokens %>% 
  with(wordcloud(word, n,
                 random.order = FALSE,
                 max.words = 50, colors=pal))

  savePlot(filename = "senadores_wordcloud.png",
           type = c("png"),
           device = dev.cur())
  
}


repetidores <- senadores %>% count(senador) %>% filter(n > 1) %>% pull(senador)

library(ggraph)
library(tidygraph)

graph <- senadores  %>% filter(senador %in% repetidores) %>%
  filter(partido_politico != "SIN ESPECIFICAR") %>%
  # Todas las facciones de la UCR van juntas
  mutate(partido_politico = ifelse(str_detect(partido_politico, "^U."),
                                   "UNIÓN CÍVICA RADICAL", partido_politico))%>%

    # TODO JUSTICIALISTA
    mutate(partido_politico = ifelse(str_detect(partido_politico, "JUSTICIALISTA"),
                                     "JUSTICIALISTA", partido_politico))%>%
    # Todo FPV
    mutate(partido_politico = ifelse(str_detect(partido_politico, "FRENTE PARA LA VICTORIA"),
                                     "FRENTE PARA LA VICTORIA", partido_politico))%>%
    # TODO PRO
    mutate(partido_politico = ifelse(str_detect(partido_politico, "UNIÓN PRO|CAMBIEMOS"),
                                     "PRO -- CAMBIEMOS", partido_politico))%>%
  dplyr::select(senador, partido_politico) %>%
  as_tbl_graph() %>%
mutate(Popularity = centrality_degree(mode = 'in'))

graph <- graph %>%
  activate(nodes) %>% # use dplyr on nodes
  mutate(my_color = 
           ifelse(name %in% repetidores, "black", "partido"),
         partido_grande = ifelse(Popularity > 3 & my_color == "partido", name, "Otro (incluye senadores)")
  ) 

set.seed(123)
ggraph(graph, layout = 'auto') + 
    geom_edge_fan(aes(alpha = stat(index)), show.legend = FALSE) + 
    geom_node_point(aes(size = Popularity * 10, color=partido_grande)) + 
  scale_color_viridis_d(option = "A")+
  theme(legend.position = "bottom")+
#  guides(color=guide_legend(nrow=3, byrow=TRUE), size=FALSE)
  guides(color=guide_legend(title = "", nrow = 4, ncol=4), size=FALSE)+
  theme(panel.background = element_rect(fill="gray30"),
        panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.text = element_blank(), axis.title = element_blank(), axis.ticks = element_blank(),
        legend.background = element_rect(fill="gray30", size=.5),
        legend.key = element_rect(fill = "gray30", color=NA),
        legend.text = element_text(color = "white"),
        legend.title = element_text(color = "white"))
#    facet_edges(~year) + 
#    theme_graph(foreground = 'steelblue', fg_text_colour = 'white')


diputados %>%
  group_by(diputado_genero) %>%
  count() %>%
  knitr::kable(col.names = c("Género", "Número de diputados")) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"),
                  full_width = FALSE)


genero <- diputados %>%
  mutate(year = year(mandato_inicio))%>%
  group_by(year) %>%
  count(diputado_genero) %>%
  mutate(total = sum(n), ratio = n/total)

p1 <-  ggplot(genero, aes(year, n, color=diputado_genero))+
  geom_line()+
  geom_point(size=2)+
  scale_x_continuous(breaks=2007:2020)+
  theme_bw()+
  theme(legend.position="none")+
  scale_color_manual(values=c("#0096D6", "gray25"))+
  xlab("") + ylab("Número de bancas")+
  labs(title = "Paridad de género en la Cámara de Diputados",
       subtitle = my_twitter)

p2 <-  ggplot(genero,
              aes(year, ratio, fill=fct_rev(diputado_genero)))+
  #geom_line()+
  scale_x_continuous(breaks=2006:2017)+
  #geom_bar(stat="identity")+
  geom_area(color="black")+
  #geom_point(size=2)+
  theme_bw()+
  theme(legend.position="bottom")+
  labs(fill="Género")+
  geom_hline(yintercept = 0.5, lty=2, color="gray90")+
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  ylab("Bancas (%)") + xlab("")+
  labs(caption = "Fuente: datos.hcdn.gob.ar")+
  scale_fill_manual(values=c("gray25", "#0096D6")) # "#FFEF00"))


plot_grid(p1,p2, nrow=2, align = "v")
  
  
dip_partidos <- diputados %>%
  mutate(diputado_bloque = ifelse(str_detect(diputado_bloque, "PRO"), "PRO -- UNIÓN PRO", diputado_bloque))%>%
  group_by(diputado_bloque) %>%
  count() %>%
  arrange(desc(n)) %>%
  ungroup()%>%
  mutate(orden = 1:length(diputado_bloque))
  
  ggplot(dip_partidos,
         aes(rev(orden), n)) +
  geom_point(aes(color= n >1)) +
#  theme(axis.text.y = element_blank(),
#        axis.ticks.y = element_blank(),
#        panel.grid.major.y = element_blank(),
#        panel.grid.minor.y = element_blank())+
  xlab("Número de orden.\nPartidos según bancas. Ranking ascendente.")+
  ylab("Número de bancas")+  
  labs(title = "Desigualdad en la Cámara de Diputados.",
       subtitle = my_twitter,
       caption =  "Fuente: datos.hcdn.gob.ar")+
  expand_limits(x = c(0, nrow(dip_partidos) + 2))+
  ggrepel::geom_label_repel(data=head(dip_partidos, 3),
                            aes(x=rev(tail(dip_partidos, 3)$orden), 
                               y= n, label=diputado_bloque),
                            ylim = c(50, 300),
                            direction = "both",
                            force=1,
                           # angle=45,
                            segment.color = "black")+
    theme_bw()+
    theme(legend.position = "none")+
    annotate("text", x=20, xmin = 10, y=30, label="Partidos con un diputado")+
    scale_color_manual(values=c("#FFEF00", "black"))
```

  
  
[^nihablar]: Ni hablar de una coronaria a corazón abierto, no?
[^apoliticos]: Cuando digo *apolíticos* no me refiero a sus conviciones personales e inclinaciones políticas. Al menos en mi mente, el funcionamiento interno de ciertas dependencias del Estado debe ser autónomo. Un dato es un dato (sea la masa de un átomo o el desempleo), un docente o un estadísta del INDEC no deberían estar afectados en su labor por el partido de turno.
[^requisitos-senador]: Desde Wikipedia a su pantalla: "Los requisitos para ser elegidos senador son: tener la edad de treinta años, haber sido seis años ciudadano de la Nación, y ser natural de la provincia que lo elija, o con dos años de residencia inmediata en ella."
[^aun-asi]: Incluso en estas circunstancias, no considero que los investigadores o los maestros deban estar haciendo siempre la misma tarea. Al contrario, sendos gremios deberían funcionar con una estructura que permita aprovechar la experiencia para el mejor funcionamiento en vez de promover una jerarquía absurda por la jerarquía misma. Una científica jóven quizás esté mejor capacitada para hacer experimentos con sus propias manos. Un maestro jóven para interactuar con alumnos sin que haya un salto generacional muy pronunciado. Aquellos que tengan mayor experiencia, quizás pueda impulsar cambios estructurales para mejorar aspectos que no estén funcionando.   
[^simplificar]: Para simplificar, elegí partidos que lograron obtener más de 3 bancas.
