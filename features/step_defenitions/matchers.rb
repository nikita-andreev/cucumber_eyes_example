Then /window should match a baseline/ do
  raise StandardError, 'Eyes are not set!' unless $eyes
  @target = Applitools::Selenium::Target.window
  step %(perform eyes test)
end

Then /entire page should match a baseline/ do
  raise StandardError, 'Eyes are not set!' unless $eyes
  @target = Applitools::Selenium::Target.window.fully
  step %(perform eyes test)
end

Then /perform eyes test/ do
  raise StandardError, "Eyes are not set!" unless $eyes
  raise StandardError, "Target is not set!" unless @target
  $eyes.check('', @target)
end

Then /I visit "([^"]*)"/ do |url|
  page.visit(url)
end

Then /^I fill in "([^"]*)" field with "([^"]*)"$/ do |field, value|
  page.fill_in(field, with: value)
end

Then /^I fill in by id "([^"]*)" field with "([^"]*)"$/ do |field, value|
  fill_in(id: field, with: value)
end


