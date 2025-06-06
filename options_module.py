from selenium.webdriver.chrome.options import Options

def create_options():
    options = Options()
    options.add_argument('--headless=new')  # novo modo headless
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--window-size=1920,1080')  # importante para renderizar menus
    return options
