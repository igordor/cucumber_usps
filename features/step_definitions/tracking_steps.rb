Then(/^I type "([^"]*)" to tracking search field$/) do |tracking_number|
  @browser.find_element(:id, "quick-tools-solo--input").send_keys tracking_number
  #if this step doesn't work replace line 2 with:
  # @browser.find_elements(:css, "input.input--field")[1].send_keys tracking_number
end


Then(/^I press on search arrow$/) do
  @browser.find_element(:css, "input.quick-tools--track--submit.input--search").click
end

Then(/^I should see Multiple items found message$/) do
  text = @browser.find_element(:css, "div.tracking-progress.status-duplicate").find_element(:css, "p.warning").text
  expect(text).to be == "Multiple items found."
end

Then(/^I type "([^"]*)" to global search field$/) do |tracking_number|
  @browser.find_element(:id, "global-header--search-track").send_keys tracking_number
end

Then(/^I press on Global search$/) do
  @browser.find_element(:css, "input.search--submit").click
end