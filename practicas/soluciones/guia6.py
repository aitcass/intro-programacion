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

#ejercicio 3
#3.1
def alguno_es_0(n1: int, n2: int):
  return(n1 == 0 or n2 == 0)

#3.2
def ambos_son_0(n1: int, n2: int):
  return(n1 == 0 and n2 == 0)

#3.3
def es_nombre_largo():
  nombre = input('nombre: ')
  long = len(nombre)
  return(long >= 3 and long <= 8)

#3.4
def es_bisiesto(a: str):
  return(a % 400 == 0 or (a % 4 == 0 and a % 100 != 0))

#ejercicio 4
#4.1
def peso_pino(altura: float):
  if altura > 3:
   return 900 + (altura - 3) * 200
  else:
    return altura * 300

#4.2
def es_peso_util(peso: float):
  return peso >= 400 and peso <= 1000

#4.3
def sirve_pino(altura: float):
  return es_peso_util(peso_pino(altura))

#ejercicio 5
#5.1
def item51(numero: int):
  if es_par(numero): return numero * 2
  else: return numero

#5.2
def item52(numero: int):
  if es_par(numero): return numero
  else: return numero + 1

#5.3
def item53(numero: int):
  if numero % 3 == 0: return numero * 2
  elif numero % 9 == 0: return numero * 3
  else: return numero

#5.4
def item54(nombre: str):
  long = len(nombre)
  if long >= 5: return "Tu nombre tiene muchas letras"
  else: return "Tu nombre tiene menos de 5 letras"

#5.5
def item55(numero: float):
  if numero <= 5: return "Menor a 5"
  elif numero >= 10 and numero <= 20: return "Entre 10 y 20"
  elif numero >= 20: return "Mayor a 20"

#5.6
def item56(sexo: chr, edad: int):
  if sexo == 'F' and edad >= 18 and edad <= 60:
    return "te toca trabajar"
  if sexo == 'M' and edad >= 18 and edad <= 65:
    return "te toca trabajar"
  else:
    "Anda de vacaciones"

#ejercicio 6
#6.1
def item61 ():
  i: int = 1
  while i <= 10:
    print(i)
    i += 1

#6.2
def item62 ():
  i: int = 10
  while i <= 40:
    if i % 2 == 0: print(i)
    i += 1

#6.3
def item63 ():
  i: int = 0
  while i < 10:
    print("eco")
    i += 1

#6.4
def item64 (n: int):
  while n >= 1:
    print(n)
    n -= 1
  print("Despegue!")

#6.5
def item65 (partida: int, llegada: int):
  while partida != llegada:
    partida -= 1
    print("Viajó un año al pasado, estamos en el año: ", partida)

#6.6
def item66 (partida: int, llegada: int):
  while partida > llegada:
    partida -= 20
    print("Viajó 20 años al pasado, estamos en el año: ", partida)
item66(2024, (-384))