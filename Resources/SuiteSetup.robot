*** Settings ***
Library  chromedriver_autoinstaller

Suite Setup       Setup Chrome Driver

*** Keywords ***
Setup Chrome Driver
    ${_}=    Evaluate    __import__('chromedriver_autoinstaller').install()
