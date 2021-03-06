## Scenario: User adds a new message to the system ##

Given(/^I am already logged in$/) do
  @user = FactoryGirl.create(:user)
  @user.save

  visit 'login'

  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.email
  click_button 'Login'
end

And(/^I am at the messages page$/) do
  visit '/messages'
end

When(/^I click the button "([^"]*)"$/) do |button|
  click_link button
end

Then(/^I should be at the news message page$/) do
  expect(current_path).to eq('/messages/new')
end

When(/^I fill the title with "([^"]*)"$/) do |title|
  fill_in "Title", with: title
end

And(/^I fill the text with "([^"]*)"$/) do |text|
  fill_in "Text", with: text
end

And(/^I click create button$/) do
  click_button 'Create'
end

Then(/^I should be at the messages page$/) do
  expect(current_path).to eq('/messages')
end

And(/^I should see a notice with "([^"]*)"$/) do |notice|
  page.should have_css("p", :text => notice)
end




## Scenario: User deletes a message ##
And(/^I have a message entitled "([^"]*)"$/) do |title|
  @message = FactoryGirl.create(:message, title: title)
  @message.save
end

When(/^I press the "([^"]*)" Button$/) do |arg|
  click_link "Delete"
end

Then(/^The message entitled "([^"]*)" must be destroyed$/) do |title|
  page.should_not have_css("td", :text => title)
end
