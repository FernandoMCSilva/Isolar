from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary

def create_options():
    binary = FirefoxBinary("/usr/bin/firefox")
    options = Options()
    options.binary = binary
    # options.add_argument('--headless')  # Comente se quiser com GUI 
    return options
