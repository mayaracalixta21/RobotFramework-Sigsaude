
lista = []

def campos_vazios(campo):
    if str(campo) == "":
        return 'true'        
    else:        
        return 'false'

def adicionar_lista(item):
    lista.append(item)

def limpar_lista():
    lista = []

def recuperar_lista():
    return lista
    limpar_lista()


def retirar_zero_esquerda(campo):
    x = campo.lstrip('0')
    return x

aux = '04'
a = retirar_zero_esquerda(aux)
print(a)