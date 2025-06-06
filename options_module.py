from selenium.webdriver.firefox.options import Options

def create_options():
    options = Options()
    options.add_argument('--headless')  # ou remova se quiser ver o navegador
    return options
