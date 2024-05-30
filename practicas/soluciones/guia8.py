#PARTE 1 ARCHiVOS
#funciones permitidas: open, close, read, readline, readlines, write.
#ejercicio 1
def contar_lineas (nombre_archivo:str) -> int:
    n_lineas:int = 0
    with open(nombre_archivo, "r") as f:
        n_lineas = len(f.readlines())
    return n_lineas
print(contar_lineas("pruebas.txt"))