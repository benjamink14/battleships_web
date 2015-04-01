Feature: Starting the game
  In order to play battleships
  As a nostaligic player
  I want to start a new game

Scenario: Registering
  Given I am on the homepage
  When I follow "New Game"
  Then I should see "What's your name?"

Scenario: Registering
  Given I am on the new game page
  When I follow "use a default name"
  Then I should see "Hello Player1!"