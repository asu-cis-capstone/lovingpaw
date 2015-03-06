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

browser.close

