
from selenium import    webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import    ChromeDriverManager 
from SeleniumLibrary import SeleniumLibrary
from SeleniumLibrary.base import    keyword

class CustomDriver(SeleniumLibrary):
    
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
    @keyword
    def open_custom_chrome_driver(self,url):
        option = Options()
        option.add_argument("--start-maximized")
        service = ChromeService(ChromeDriverManager().install())
        driver  = webdriver.Chrome(service=service,options=option)
        self.register_driver(driver, "CustomChrome")
        self.go_to(url)