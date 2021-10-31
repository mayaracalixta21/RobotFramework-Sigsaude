
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