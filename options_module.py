from selenium.webdriver.firefox.options import Options

def create_options():
    options = Options()
    options.add_argument('--headless')  # remova se quiser visualizar
    return options
