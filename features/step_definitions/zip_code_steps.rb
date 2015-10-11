Given(/^I open browser and navigate to "([^"]*)"$/) do |url|
  @browser = Selenium::WebDriver.for :firefox
  @browser.manage.timeouts.implicit_wait = 10
  @browser.manage.timeouts.page_load = 10
  @browser.navigate.to url
end

When(/^I navigate to USPS Look UP Zip Code page$/) do
  @browser.find_element(:css, "a.quick-tools--link.quick-tools--zip").click
end

Then(/^I type "([^"]*)" to street address$/) do |address|
  @browser.find_element(:id, "tAddress").send_keys address
end

Then(/^I type "([^"]*)" to city field$/) do |city|
  @browser.find_element(:id, "tCity").send_keys city
end

Then(/^I select "([^"]*)" from states dropdown list$/) do |state|
  @browser.find_element(:css, "span.select-current-text").click
  state_list = @browser.find_element(:css, "ul.select-ul").find_elements(:tag_name, "a")

  # state_list.each do |element|
  #   if element.text == state
  #     element.click
  #     break
  #   end
  # end
  state_list.find{|element|element.text == state}.click
end

Then(/^I click Find Zip code button$/) do
  @browser.find_element(:id, "lookupZipFindBtn").click
end

Then(/^I see results on Look up a zip code page$/) do
  cell_result = @browser.find_element(:id, "result-list").find_elements(:tag_name, "li")
  expect(cell_result.size).to be > 0

  cell_result.each do |element|
    expect(element.find_element(:css, "span.zip").text).to be_truthy
  end
end


