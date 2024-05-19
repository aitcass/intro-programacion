import math
from importlib import reload
#ejercicio 1
#1.1
def imprimir_hola_mundo():
  print("Hello World!")

#1.2
def imprimir_un_verso():
  print("Strangers in the night\nTwo lonely people we were strangers in the night\nUp to the moment\nWhen we said our first hello\nLittle did we know\nstrangers in the night by Frank f* Sinatra") 

#1.3
def raizDe2():
  round(math.sqrt(2))

#1.4
def factorialDe2():
  return 2*1

#1.5
def perimetro():
  return 2*math.pi

#ejercicio 2
#2.1
def imprimir_saludo(nombre: str):
  print("Hola", nombre)

#2.2
def raiz_cuadrada_de(numero: int):
  return math.sqrt(numero)

#2.3
def farenheit_a_celsius(t: float):
  return((t-32)*5/9)

#2.4
def imprimir_dos_veces(estribillo: str):
  print(estribillo*2)

#2.5
def es_multiplo_de(n: int, m: int):
  return(n % m == 0)

#2.6
def es_par(numero: int):
  return(es_multiplo_de(numero, 2))

#2.7
def cantidad_de_pizzas(amigos: int, min_porciones: int):
  return(math.ceil(amigos*min_porciones/8))