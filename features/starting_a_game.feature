Feature: Starting the game
  In order to play battleships
  As a nostaligic player
  I want to start a new game

Scenario: Registering
  Given I am on the homepage
  When I follow "New Game"
  Then I should see "What's your name?"

Scenario: Registering
  Given I am on the game start page
  When I don't want to give a name
  Then I get a default name