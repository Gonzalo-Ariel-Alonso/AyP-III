### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

-Si varios metodos pueden cumplen pequenas funciones estas pueden agruparse para una mayor facilidad a su acseso

### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

-Al colocar el sublclassResponsability estamos obligando a las sublclases a definir (a su propia manera) a este mensaje.

### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

-La idea de POO es que los objetos se comuniquen, no que se "pisoteen". Romper el encapsulamiento significa que cualquier otro objeto ajeno
puede acceder o incluso modificar otros objetos que no deberia.
