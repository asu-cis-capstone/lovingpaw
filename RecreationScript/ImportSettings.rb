puts "Enter your Shopify Store Name:"
store = gets
puts "Enter your Shopify Email"
email = gets
puts "Enter your Shopify Password"
password = gets
require "selenium-webdriver"
browser = Selenium::WebDriver.for :chrome
browser.get "https://www.shopify.com/login"
browser["HaveMultipleDomains"].click
browser["LoginSubdomain"].send_keys store 
browser["LoginEmail"].send_keys email
browser["LoginPassword"].send_keys password
browser["ShopifyLoginForm"].find_element(name: "button").click
puts "Press Enter when the page has finished loading"
gets
browser.find_element(link_text: "Pages").click
sleep(1)
browser.find_element(link_text: "About Us").click
sleep(1)
browser["page-content_parent"].find_element(class: "rtetools-buttons").find_element(class: "tooltip-right-align").click
#browser.switch_to.frame "page-content_ifr"
sleep(1)
browser["page-content"].clear
file = File.open("ImportSettings/AboutUs.txt")
#Txt file with html page layout of AboutUs
pageContent = file.read
browser["page-content"].send_keys(pageContent) 
#browser.switch_to.default_content



