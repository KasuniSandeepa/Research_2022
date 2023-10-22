from selenium import webdriver
import time

def get_juice_price():
    # Get the website using the Chrome webbdriver
    browser = webdriver.Chrome()
    browser.get('https://glomark.lk/fontana-pineapple-juice-100%2525-natural-1l/p/6802')

    # Print out the result
    price = browser.find_element('id', 'product-promotion-price')
    print("Price: " + price.text)
    # # # Close the browser
    # time.sleep(3)
    # browser.close()
    return price.text

def get_chutney_price():
    # Get the website using the Chrome webbdriver
    browser = webdriver.Chrome()
    browser.get('https://glomark.lk/master-spice-pineapple-chutney-350g/p/48735')

    # Print out the result
    price = browser.find_element('id', 'product-promotion-price')
    print("Price: " + price.text)
    # # # Close the browser
    # time.sleep(3)
    # browser.close()
    return price.text

def get_jam_price():
    # Get the website using the Chrome webbdriver
    browser = webdriver.Chrome()
    browser.get('https://glomark.lk/kist-pineapple-jam-300g/p/10889')

    # Print out the result
    price = browser.find_element('id', 'product-promotion-price')
    print("Price: " + price.text)
    # # # Close the browser
    # time.sleep(3)
    # browser.close()
    return price.text

def get_chunk_price():
    # Get the website using the Chrome webbdriver
    browser = webdriver.Chrome()
    browser.get('https://glomark.lk/freshbitz-frozen-pineapple-chunks-500g/p/101407')

    # Print out the result
    price = browser.find_element('id', 'product-promotion-price')
    print("Price: " + price.text)
    # # # Close the browser
    # time.sleep(3)
    # browser.close()
    return price.text

def get_suause_price():
    # Get the website using the Chrome webbdriver
    browser = webdriver.Chrome()
    browser.get('https://glomark.lk/janrich-sweet-chilli-pineapple-sauce-260ml/p/69458')

    # Print out the result
    price = browser.find_element('id', 'product-promotion-price')
    print("Price: " + price.text)
    # # # Close the browser
    # time.sleep(3)
    # browser.close()
    return price.text

def get_sticks_price():
    # Get the website using the Chrome webbdriver
    browser = webdriver.Chrome()
    browser.get('https://glomark.lk/lia-incense-sticks-pineapple-24-sticks/p/105837')

    # Print out the result
    price = browser.find_element('id', 'product-promotion-price')
    print("Price: " + price.text)
    # # # Close the browser
    # time.sleep(3)
    # browser.close()
    return price.text

def get_chunks_syrup_price():
    # Get the website using the Chrome webbdriver
    browser = webdriver.Chrome()
    browser.get('https://glomark.lk/ayam-brand-pineapple-chunks-in-syrup-425g/p/93569')

    # Print out the result
    price = browser.find_element('id', 'product-promotion-price')
    print("Price: " + price.text)
    # # # Close the browser
    # time.sleep(3)
    # browser.close()
    return price.text