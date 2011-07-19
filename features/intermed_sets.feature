Feature: Fake "collection" Intermediate Set Objects 
  I want to ensure the fake fixture objects display proper members and sets

  Scenario: Top level collection set object has members of two intermediate sets
    When I am on the document page for id "hypatia:fixture_coll" 
    Then I should see a link to "the show page for hypatia:fixture_intermed1" with label "Intermediate Set 1"
    And I should see a link to "the show page for hypatia:fixture_intermed3" with label "Intermediate Set 3"
    And I should not see a link to "the show page for hypatia:fixture_intermed2"
    And I should not see a link to "the show page for hypatia:fixture_item1"
    And I should not see a link to "the show page for hypatia:fixture_item2"
    And I should not see a link to "the show page for hypatia:fixture_item3"

  Scenario: Intermed 1 set object has member intermed set 2 and no item members and is a member of coll
    When I am on the document page for id "hypatia:fixture_intermed1" 
    Then I should see a link to "the show page for hypatia:fixture_intermed2" with label "Intermediate Set 2"
#    And I should see a link to "the show page for hypatia:fixture_coll" with label "Collection"
    And I should not see a link to "the show page for hypatia:fixture_intermed1"
    And I should not see a link to "the show page for hypatia:fixture_intermed3"
    And I should not see a link to "the show page for hypatia:fixture_item1"
    And I should not see a link to "the show page for hypatia:fixture_item2"
    And I should not see a link to "the show page for hypatia:fixture_item3"

  Scenario: Intermed 2 set object has item members 1, 2 and 3 and is a member of intermed 1
    When I am on the document page for id "hypatia:fixture_intermed2" 
    Then I should see a link to "the show page for hypatia:fixture_item1" with label "item 1"
#    And I should see a link to "the show page for hypatia:fixture_intermed1" with label "Intermediate Set 1"
    And I should see a link to "the show page for hypatia:fixture_item2" with label "item 2"
    And I should see a link to "the show page for hypatia:fixture_item3" with label "item 3"
    And I should not see a link to "the show page for hypatia:fixture_coll"

  Scenario: Intermed 3 set object has item members 2 and 3 and is a member of coll
    When I am on the document page for id "hypatia:fixture_intermed3"
    Then I should see a link to "the show page for hypatia:fixture_item2" with label "item 2"
    And I should see a link to "the show page for hypatia:fixture_item3" with label "item 3"
    And I should not see a link to "the show page for hypatia:fixture_item1"
#    And I should see a link to "the show page for hypatia:fixture_coll" with label "Collection"

  Scenario: Item 1 object belongs to set intermed 2
    When I am on the document page for id "hypatia:fixture_item1"
    Then I should see a link to "the show page for hypatia:fixture_intermed2" with label "Intermediate Set 2"
    And I should not see a link to "the show page for hypatia:fixture_intermed1"
    And I should not see a link to "the show page for hypatia:fixture_intermed3"
    And I should not see a link to "the show page for hypatia:fixture_coll"

  Scenario: Item 2 object belongs to sets intermed 2 and 3
    When I am on the document page for id "hypatia:fixture_item2"
    Then I should see a link to "the show page for hypatia:fixture_intermed2" with label "Intermediate Set 2"
    And I should see a link to "the show page for hypatia:fixture_intermed3" with label "Intermediate Set 3"
    And I should not see a link to "the show page for hypatia:fixture_intermed1"
    And I should not see a link to "the show page for hypatia:fixture_coll"

  Scenario: Item 3 object belongs to sets intermed 2 and 3
    When I am on the document page for id "hypatia:fixture_item3"
    Then I should see a link to "the show page for hypatia:fixture_intermed2" with label "Intermediate Set 2"
    And I should see a link to "the show page for hypatia:fixture_intermed3" with label "Intermediate Set 3"
    And I should not see a link to "the show page for hypatia:fixture_intermed1" 
    And I should not see a link to "the show page for hypatia:fixture_coll"
