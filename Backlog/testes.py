import requests

def buscar_dados():
    request = requests.get("https://swapi.dev/people/1/?format=json")


if __name__ == '__main__':
    buscar_dados()
