require File.join(File.dirname(__FILE__), *%w[helper])
require "usuario"


Story "user registration",
%(As a new user
I want to register in the system
So that I can use it), :type => RailsStory do

  Scenario "registration" do
    Given "a user with name", "rodrigo" do |name|
      @user = Usuario.new(:nome => name, :senha => name)
    end
    And "email", "rodrigo@teste.com" do |email|
      @user.email = email
    end
    When "I choose to save" do
      @user.save
    end
    Then "the record should not be new" do
      @user.new_record?.should == false
    end
  end

#  Scenario "New User" do
#	  GivenScenario "registration" # isto faria com que todos os passos do cenario anterior fossem executados neste
#  end

end

