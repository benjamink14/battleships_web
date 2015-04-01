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

Scenario: begininga game
  Given I am on the start page
  when I press "Fire"
  Then 