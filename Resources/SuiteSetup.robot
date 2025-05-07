*** Settings ***
Library  chromedriver_autoinstaller

*** Keywords ***
Setup Chrome Driver
    ${_}=    Evaluate    __import__('chromedriver_autoinstaller').install()

