#PARTE 1 ARCHiVOS
#funciones permitidas: open, close, read, readline, readlines, write.
#ejercicio 1
#1.1
def contar_lineas (nombre_archivo:str) -> int:
    n_lineas:int = 0
    with open(nombre_archivo, "r") as f:
        n_lineas = len(f.readlines())
    return n_lineas
#1.2
def existe_palabra (nombre_archivo: str, palabra: str):
    f = open(nombre_archivo, "r")
    word = ""
    for line in f.readlines():
        for letter in line:
            if letter != " " and letter != "\n": word += letter
            elif word == palabra:
                f.close()
                return True
            else:
                word = ""
    f.close()
    return False

#1.3
def cantidad_apariciones(nombre_archivo: str, palabra: str) -> int:
    f = open(nombre_archivo, "r")
    word: str = ""
    cont: int = 0
    if not existe_palabra(nombre_archivo, palabra): return False
    else:
        for line in f.readlines():
            for letter in line:
                if letter != " " and letter != "\n": word += letter
                elif word == palabra:
                    cont += 1
                else:
                    word = ""
    f.close()
    return cont

#Ejercicio 2
def clonar_sin_comentarios(nombre_archivo: str):
    f1 = open(nombre_archivo, "r")
    f2 = open("cloned.txt","w")
    for line in f1.readlines():
        if line[0] != '#': f2.write(line)
    f1.close()
    f2.close()

#Ejercicio 3
def invertir_lineas (nombre_archivo: str):
    f1 = open(nombre_archivo, "r")
    reverso = open("reverso.txt","w")
    lines_f1: list[str] = f1.readlines()

    reverso.write(lines_f1[len(lines_f1)-1])
    reverso.write("\n")
    for l in range(len(lines_f1)-2, -1, -1):
        reverso.write(lines_f1[l])
    f1.close()
    reverso.close()

#ejercicio 4
def agregar_frase_al_final(nombre_archivo: str, frase: str):
    f = open(nombre_archivo, "a")
    f.write("\n")
    f.write(frase)
    f.close

#ejercicio 5
def agregar_frase_al_principio(nombre_archivo: str, frase: str):
    with open(nombre_archivo, "r") as f:
        data_original = f.read()
    with open(nombre_archivo, "w") as f:
        f.write(frase + "\n")
        f.write(data_original)

#ejercicio_6
#no estoy seguro de entender consigna
# def  listar_palabras_de_archivo(nombre_archivo : str) -> list:
#     palabras_legibles: list[str] = []
#     with open(nombre_archivo, "r") as f:
#         temp_palabra: str = ""
#         for lines in f.readlines():
#             for caracter in lines:
#                 if len(temp_palabra) >= 5: 
#                     palabras_legibles.append(temp_palabra)
#                     temp_palabra = ""
#                 elif (caracter.isalpha() == True) or (caracter.isalnum() == True) or (caracter == "_") or (caracter == " "):
#                     temp_palabra += caracter
#     palabras_legibles.append(temp_palabra)
#     return palabras_legibles

#ejercicio 7
def to_list(linea_csv):
    lista: list[str] = []
    temp: str = ""
    for i in linea_csv:
        if i != ',' and i != '\n': temp += i
        else: 
            lista.append(temp)
            temp = ""
    if temp != "": lista.append(temp)
    return lista

        
def promedio_estudiante(nombre_archivo: str, lu: str) -> float:
    notas: float = 0.0
    cont: int = 0
    with open(nombre_archivo) as fnotas:
        for linea in fnotas:
            list_linea = to_list(linea)
            if lu == list_linea[0]:
                notas += float(list_linea[3])
                cont += 1
    return notas/cont

def calcular_promedio_por_estudiante(nombre_archivo_notas: str, nombre_archivo_promedios:str):
    lus: list[str] = []
    with open(nombre_archivo_notas) as fnotas:
        for line in fnotas:
            linea = to_list(line)
            if linea[0] not in lus: lus.append(linea[0])
    with open(nombre_archivo_promedios, "w") as fpromedios:
        for i in lus:
            fpromedios.write(i + "," + str(promedio_estudiante(nombre_archivo_notas, i))  + '\n')          

#PARTE 2 PILAS
from queue import LifoQueue as Pila
import random
#ejercicio 8       
def generar_nros_al_azar (cantidad: int, desde: int, hasta: int) -> list[int]:
    p = Pila()
    len = 0
    while len != cantidad:
        numero: int = random.randint(desde, hasta)
        print(numero)
        p.put(numero)
        len += 1
    return(p)

#ejercicio 9
def cantidad_elementos(p: Pila) -> int:
    l_recuperar = []
    len: int = 0
    while not p.empty():
        l_recuperar.append(p.get())
        len += 1
    for i in l_recuperar: p.put(i)
    return len

#ejercicio 10
def buscar_el_maximo(p: Pila) -> int:
    l_recuperar: list[int] = []
    max: int = 0
    e: int = 0
    while not p.empty():
        e = p.get()
        l_recuperar.append(e)
        if e > max: max = e 
    for i in l_recuperar: p.put(i)
    return max

#ejercicio 11
def esta_bien_balanceada(s: str) -> bool:
    cont: int = 0
    for i in s:
        if i == '(': cont = cont + 1
        if i == ')': cont = cont - 1
    return cont == 0

#ejercicio 12
def to_list2(linea_csv, sep: str):
    lista: list[str] = []
    temp: str = ""
    for i in linea_csv:
        if i != sep and i != '\n': temp += i
        else: 
            lista.append(temp)
            temp = ""
    if temp != "": lista.append(temp)
    return lista

def evaluar_expreion(s: str) -> float:
    operandos: Pila = Pila()
    operadores: list[chr] = ['+','-','*','/']
    l = to_list2(s, " ")
    for i in l:
        if i in operadores: 
            e1 = float(operandos.get(i))
            e2 = float(operandos.get(i))
            if i == '+': operandos.put(e2+e1)
            if i == '-': operandos.put(e2-e1)
            if i == '*': operandos.put(e2*e1)
            if i == '/': operandos.put(e2/e1)
        else: operandos.put(i)
    return operandos.get()

#PARTE 3 COLAS
from queue import Queue as Cola
#ejercicio 13
def generar_numeros_al_azar (cantidad: int, desde: int, hasta: int) -> Cola:
    c = Cola()
    for i in range(cantidad):
        c.put(random.randit(desde, hasta))
    return Cola

#ejercicio 14
def cantidad_elementos(c: Cola) -> int:
    longitud: int = 0
    backup:list = []
    while not c.empty():
        backup.append(c.get())
        longitud += 1
    for i in range(len(backup)-1, -1, -1):
        c.put(backup[i])
    return longitud

#ejercicio 15
def busca_el_maximo(c: Cola) -> int:
    longitud: int = 0
    backup:list = []
    maximo = 0
    while not c.empty():
        e = c.get()
        backup.append(e)
        if e > maximo: maximo = e
        longitud += 1
    for i in range(len(backup)-1, -1, -1):
        c.put(backup[i])
    return maximo

#ejercicio 16
#a
def armar_secuencia_de_bingo() -> Cola:
    c = Cola()
    salieron: list[int] = []
    for i in range(100): 
        e = random.randint(0,99)
        while e in salieron:
            e = random.randint(0,99)
        salieron.append(e)
        c.put(e)
    return c

#b
def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    rondas: int = 0
    cont: 0 = 0
    while cont != 12:
        e: int = bolillero.get()
        if e in carton: 
            cont += 1
        rondas += 1
    return rondas

#ejercicio 17
def n_pacientes_urgentes(c: Cola[(int,str,str)]) -> int:
    cont: int  = 0
    restaurar_cola: list = []
    while not c.empty():
        e = c.get
        restaurar_cola.append(e)
        if e[1] in range(1,4): cont += 1
    for i in restaurar_cola:
        c.put(i)
    return cont

#ejercicio 18


#probar
def toCola(lista):
    c = Cola()
    for i in lista:
        c.put(i)
    return c

def toList(c: Cola):
    l = []
    while not c.empty():
        l.append(c.get())
    return l

def repetidos(lista: list):
    salidos: list[int] = []
    repetidos: list[int] = []
    for i in lista:
        if i in salidos: repetidos.append(i)
        salidos.append(i)
    return repetidos
