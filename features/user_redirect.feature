Feature: Add a new contract

	As a platform user (of any level)
	So that I can replace leaving users
	I want to be able to redirect users

Background:
	Given db is set up
	Given an example user exists
	Given I am logged in as a level 1 user

Scenario: Try to redirect without disabling
	Given I am on the users page
	When I show user 1
	And I try to redirect this user
	And I select "Example User" from the "user[redirect_user_id]" select box
	And I press "commit"
	Then I should see "User is active and cannot be redirected"

Scenario: Deactivate a user
	Given I am on the users page
	When I show user 1
	And I try to deactivate this user
	And I follow "Deactivate"
	Then I should see "User was successfully updated."

Scenario: Deactivate and redirect a user
	Given I am on the users page
	When I show user 1
	And I try to deactivate this user
	And I follow "Deactivate"
	And I try to redirect this user
	And I select "Example User" from the "user[redirect_user_id]" select box
	And I press "commit"
	Then I should see "User was successfully redirected"

Scenario: Redirect a user to themselves
	Given I am on the users page
	When I show user 6
	And I try to deactivate this user
	And I follow "Deactivate"
	And I try to redirect this user
	And I select "Example User" from the "user[redirect_user_id]" select box
	And I press "commit"
	Then I should see "User cannot be redirected to themselves."
