Feature: Add a new contract

	As a platform user (of any level)
	So that I can create an new contract for approval
	I want to add a new contract entry to the database

Background:
	Given db is set up
	Given an example user exists
	Given I am logged in as a level 1 user

Scenario: Fail to create a contract
	Given I am on the new contract page
	And I press "Create Contract"
	Then I should see "Point of contact is required"

Scenario: Sucessfully create a contract
	Given I am on the new contract page
	When I fill in "Title" with "TestContract"
	And I select "Contract" from the "Contract Type" select box
	And I fill in "Number" with "23"
	And I fill in the vendor field with vendor value "new"
	And I fill in the "contract_new_vendor_name" field with "Test Vendor"
	And I select "Example User" from the point of contact dropdown
	And I select "Program 1" from the program dropdown
	And I select "Entity 1" from the entity dropdown
	And I select "Upon Completion" from the end trigger dropdown
	And I fill in the "contract_starts_at" field with "2023-03-30"
	And I fill in "contract[amount_dollar]" with "100"
	And I select "day" from the "Amount duration" select box
	And I fill in "contract[initial_term_amount]" with "100"
	And I select "day" from the "Initial term duration" select box
	And I press "Create Contract"
	Then I should see "Contract was successfully created."

Scenario: Create a contract with an inactive point of contract who has a redirect user.
	Given an example inactive user with a redirect user exists 
	And I am on the new contract page
	When I fill in "Title" with "TestContract"
	And I select "Contract" from the "Contract Type" select box
	And I fill in "Number" with "23"
	And I fill in the vendor field with vendor value "new"
	And I fill in the "contract_new_vendor_name" field with "Test Vendor"
	And I select "Inactive User" from the point of contact dropdown
	And I select "Program 1" from the program dropdown
	And I select "Entity 1" from the entity dropdown
	And I select "Upon Completion" from the end trigger dropdown
	And I fill in the "contract_starts_at" field with "2023-03-30"
	And I fill in "contract[amount_dollar]" with "100"
	And I select "day" from the "Amount duration" select box
	And I fill in "contract[initial_term_amount]" with "100"
	And I select "day" from the "Initial term duration" select box
	And I press "Create Contract"
	Then I should see "Inactive User is not active"

Scenario: Create a contract with an inactive point of contract who does not have a redirect user.
	Given an example inactive user with a redirect user exists
	And I am on the new contract page
	When I fill in "Title" with "TestContract"
	And I select "Contract" from the "Contract Type" select box
	And I fill in "Number" with "23"
	And I fill in the vendor field with vendor value "new"
	And I fill in the "contract_new_vendor_name" field with "Test Vendor"
	And I select "Inactive User" from the point of contact dropdown
	And I select "Program 1" from the program dropdown
	And I select "Entity 1" from the entity dropdown
	And I select "Upon Completion" from the end trigger dropdown
	And I fill in the "contract_starts_at" field with "2023-03-30"
	And I fill in "contract[amount_dollar]" with "100"
	And I select "day" from the "Amount duration" select box
	And I fill in "contract[initial_term_amount]" with "100"
	And I select "day" from the "Initial term duration" select box
	And I press "Create Contract"
	Then I should see "Inactive User is not active"
	