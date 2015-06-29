def create_visitor
  @visitor ||= {email: "aobinkvh@gmail.com", password: "123456789", password_confirmation: "123456789" }
end

def find_user
  @user ||= User.where(email: @visitor[:email]).first
end

def delete_user
  create_visitor
  @user ||= User.where(email: @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  create_visitor
  visit "/users/sign_up" 
  fill_in "user_email", with: @visitor[:email]
  fill_in "user_password", with: @visitor[:password]
  fill_in "user_password_confirmation", with: @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  create_visitor
  visit "/users/sign_in"
  fill_in "user_email", with: @visitor[:email]
  fill_in "user_password", with: @visitor[:password]
  click_button "Log in"
end

def create_unconfirm_user
  create_visitor
  delete_user
  sign_up
  visit "/users/sign_out"
end


Given(/^I am not loged in$/) do
  visit "/users/sign_up"
end

When(/^I sign up with valid data$/) do
  sign_up
end

Then(/^I should visit homepage$/) do
  visit "/"
end

When(/^I signup with mismatch password and password confirmation$/) do
  create_visitor
  @visitor = @visitor.merge(password_confirmation: "test123456")
  sign_up
end

Then(/^I should be see a mismatch password "(.*?)"$/) do |content|
  page.should have_content content
end

When(/^I login with valid email and password$/) do
  sign_in
end

Then(/^I visit to home page$/) do
  visit "/"
end

When(/^I login with invalid email$/) do
  create_visitor
  @visitor = @visitor.merge(email: "test01@gmail.com")
  sign_in
end

Then(/^I should be see a error message "(.*?)"$/) do |content|
  page.should have_content content
end

When(/^I login with invalid password$/) do
  create_visitor
  @visitor = @visitor.merge(password: "test123456")
  sign_in
end

Then(/^I should be see an error message "(.*?)"$/) do |message|
  page.should have_content message
end
