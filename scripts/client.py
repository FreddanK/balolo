from urllib.request import urlopen


if __name__ == "__main__":
    with urlopen("http://localhost:8080/") as response:
        print(response.read().decode())
