Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

Scenario: Registering
  Given I am on the homepage
  When I follow "New Game"
  Then I should see "What's your name"

Scenario: Registering
  Given I am on the new game page
  When I follow "No need for a name"
  Then I should see "Hello Player1"

Scenario: beginning game
  Given I am on the start page
  Then I should see an HTML table with at least column: "1" and row: "A"

Scenario: hitting empty cells
  Given I am on the start page
  And I click on the button "A1"
  Then I should see HE at "A1"
