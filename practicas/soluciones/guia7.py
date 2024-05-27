import random
#Primera parte:
#Ejercicio 1:
#1.1
def pertenece (s: list[int], e: int):
    for i in s:
        if i == e: return True
    return False
def pertenece2 (s: list[int], e: int):
    return e in s
#1.2
def divide_a_todos (s: list[int], e: int):
    res: bool = True
    for i in s:
        if i % e != 0: res = False
    return res
#1.3
def suma_total (s: list[int]):
    res: int = 0
    for i in s:
        res += i
    return res
#1.4
def ordenados (s: list[int]):
    return s == sorted(s)
#1.5
def longitud_mayor_7 (s: list[str]):
    for i in s:
        if len(i) > 7: return True
    return False
#1.6
def es_polindromo (s: str):
    reverso: str = ""
    final: int = len(s) - 1
    for i in s:
        if i != s[final]: return False
        final -= 1
    return True     
#1.7
def strong_password (s: str):
    if len(s) > 8 and hay_minuscula(s) and hay_mayuscula(s) and hay_numero(s):
        return "VERDE"
    elif len(s) < 5: return "ROJA"
    else: return "AMARILLA"

def hay_minuscula(s: str):
    for i in s:
        if ord(i) >= 97 and ord(i) <= 122: return True
    return False
def hay_mayuscula(s: str):
    for i in s:
        if ord(i) >= 65 and ord(i) <= 90: return True
    return False
def hay_numero(s: str):
    for i in s:
        if ord(i) >= 48 and ord(i) <= 57: return True
    return False
#1.8
def cuenta_bancaria (opercaiones: list[tuple[(chr, int)]]):
    saldo: int = 0
    for i in opercaiones:
        if i[0] == 'I': saldo += i[1]
        else: saldo -= i[1]
    return saldo
#1.9
def vocales (palabra: str):
    v_encontradas: list[chr] = []
    vocales: list[chr] = ['a','e','i','o','u']
    for i in palabra:
        if i in vocales:
            if i not in v_encontradas: v_encontradas.append(i)
    return len(v_encontradas) >= 3
#Parte 2
#Ejercicio 2
#2.1
def ej21 (l: list[int]):
    for i in range (1, len(l), 2):
        l[i] = 0
    return l
#2.2
def ej22 (l: list[int]):
    l_out: list[int] = l
    return ej21(l_out)
#2.3
def ej23 (s: str):
    vocales: list[chr] = ['a','e','i','o','u']
    s1: str = ""
    for i in s:
        if i not in vocales: s1 += i
    return s1
#2.4    
def reemplaza_vocales (p: list[chr]):
    vocales: list[chr] = ['a','e','i','o','u']
    s1: list[chr] = []
    for i in range(0,len(p)):
        if p[i] not in vocales: s1 += p[i]
        else: s1 += '_'
    return s1
#2.5
def da_vuelta_str (s: list[chr]):
    s1: list[chr] = []
    for i in range(len(s)-1,-1,-1):
        s1 += s[i]
    return s1
#print(da_vuelta_str(['h','o','l','a']))
#2.6
def eliminar_repetidos (s: list[chr]):
    res: list[chr] = []
    for i in s:
        if i not in res: res += i
    return res
#Ejercicio 3
def aprobado (s: list[int]):
    res: int = 0
    aprobado: bool = True
    for i in s:
        if i < 4 : aprobado = False
    if aprobado == True and promedio(s) >= 7: return 1
    elif aprobado == True and promedio(s) >=4 and promedio(s) < 7: return 2
    else: return 3

def promedio (s: list[int]):
    res: int = 0
    for i in s:
        res += i
    return res/len(s)
    
#Ejercicio 4
#4.1
def estudiantes ():
    res: list[str] = []
    entrada: str = ""
    while entrada != "listo":
        entrada = input("ingrese nombre: ")
        if entrada != "listo": res.append(entrada)
    return res
#4.2
def monedero ():
    historial: list[tuple[(str, int)]] = []
    operacion: str = ""
    monto: int = 0
    while operacion != "X":
        operacion = input("indicar operacion: ")
        if operacion == "C": 
            monto = input("ingrese monto: ")
            historial.append(("C", monto))
        if operacion == "D":
            monto = input("ingrese monto: ")
            historial.append(("D", monto))
    return historial
#4.3
def siete_y_medio ():
    carta: int = 0
    acum: float = 0.0
    res: list[int] = []
    while (input("carta o plantarse: ") != "plantarse") and acum < 7.5:
        carta = random.randint(1, 12)
        while carta == 8 or carta == 9: carta = random.randint(1,12)
        if carta >= 10 and carta <= 12: acum += 0.5
        else: acum += float(carta)
        res.append(carta)
    if acum == 7.5: print("ganaste")
    else: print("perdiste")
#Ejercicio 5
#5.1
def pertenece_a_cada_uno_v1 (s: list[list[int]], elemento: int):
    res: list[bool] = []
    for i in s:
        if pertenece(i, elemento): res.append(True)
        else: res.append(False)
    return res
#print(pertenece_a_cada_uno_v1([[1,2,3,4],[2,3,4,5],[3,4,5,6]], 2))
#5.2
#5.3
def es_matriz (s: list[list[int]]):
    res: bool = True
    if len(s) > 0 and len(s[0]) > 0:
        for i in s:
            if len(i) != len(s[0]): res = False
    return res
#5.4
def filas_ordenadas (m: list[list[int]]):
    res: bool = True
    for i in m:
        if not ordenados(i): res = False
    return res

#5.5