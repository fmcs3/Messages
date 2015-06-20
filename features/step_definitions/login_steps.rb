# Singup #
Given(/^The email "([^"]*)" is not used by an user$/) do |email|
  User.find_by_email(email).should == nil
end

And(/^I am at the singup Page$/) do
  visit 'singup'
end

When(/^I fill first_name with "([^"]*)"$/) do |first_name|
  fill_in "First Name", :with => first_name
end

And(/^I fill last_name with "([^"]*)"$/) do |last_name|
  fill_in "Last Name", :with => last_name
end

And(/^I fill email with "([^"]*)"$/) do |email|
  fill_in "Email", :with => email
end

And(/^I fill password with "([^"]*)"$/) do |password|
  fill_in "Password", :with => password
end

And(/^I click create user button$/) do
  click_button "Create"
end

Then(/^I should be at root page$/) do
  expect(current_path).to eq('/')
end


# Login #
Given(/^I have an user with email "([^"]*)" is registred on the system$/) do |email|
  @user = FactoryGirl.create(:user, email: email)
end

And(/^I am at the Login Page$/) do
  visit 'login'
end

When(/^I fill email field with "([^"]*)"$/) do |email|
  fill_in 'Email', :with => email
end

And(/^I fill the password field with "([^"]*)"$/) do |password|
  fill_in 'Password', :with => password
end

And(/^I click the Button "Login"$/) do
  click_button 'Login'
end

Then(/^I should be logged in with email "([^"]*)"$/) do |email|
  expect(current_path).to eq('/messages')
end