## Preguntas

1. ¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)

2. ¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)

3. ¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?


1) Negar estaHerido es lo mismo que noEstaHerido , en mi opinion la unica justificacion para tener implementado ambos mensajes es si se planea en algun futuro agregar niveles de que tan herido o que tan "sano" se esta.

2)Si los combatientes se implementan por separado (es decir no se aplica polimorfismo ni herencia) es importante testear a cada uno para su correcto funcionamiento, aunque resulta MUY poco eficiente.

