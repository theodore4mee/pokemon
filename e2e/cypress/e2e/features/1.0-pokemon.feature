Feature: F7.0-Alerts/F7.2-alert-results

# Given that we can not control the available alerts, some tests will fail with it not having results

Background: User should be able to login and get a session
    Given the user is able to login

@e2e-tested @cypress @Priority-1 @S-253901
Scenario Outline: Alert Results-Clicking one of the dropdowns in the title bar, it should display a list of options and their values for the selected alert
    Given the user is on the Alerts Profile Page
    And has at least one alert available
    When the user selects an "<AlertState>" alert
    Then the user is redirected to the Alerts Results page
    And the title bar has the "<DropdownType>" dropdown displayed
    When the user clicks on the "<DropdownType>" dropdown
    Then a list of "<DropdownType>" with the value "<DropdownOption>" for the alert should be display

Examples: Actions dropdown options
    | DropdownType | DropdownOption    | AlertState    |
    | Actions      | Edit Alert        | Paused/Active |
    | Actions      | Start Alert       | Paused        |
    | Actions      | Pause Alert       | Active        |
    | Actions      | Link to this page | Paused/Active |

Examples: Properties dropdown Options
    | DropdownType | DropdownOption | AlertState    |
    | Properties   | Alert Type     | Paused/Active |
    | Properties   | Client         | Paused/Active |
    | Properties   | Frequency      | Paused/Active |
    | Properties   | Delivery Type  | Paused/Active |
    | Properties   | Start date     | Paused/Active |
    | Properties   | End date       | Paused/Active |

@e2e-tested @cypress @Priority-2 @S-253901
Scenario Outline: Actions and Properties dropdown does not overlap
    Given the user is on the Alerts Profile Page
    And has at least one alert available
    When the user selects the alert
    Then the user selects the "<Dropdown1>" dropdown
    And the user selects the "<Dropdown2>" dropdown
    Then the "<Dropdown2>" dropdown should be the only one open

Examples: Dropdown options
| Dropdown1  | Dropdown2  |
| Actions    | Properties |
| Properties | Actions    |

@e2e-tested @cypress @Priority-1 @S-215116
Scenario: When an alert has no results, a message should be displayed indicating no results for the alert
    Given the user is on the Alerts Profile Page
    And has at least one alert available
    And the alert has no results
    When the user selects the alert with no results
    Then the user is redirected to the Alerts Results page
    And the error message box should be displayed

@e2e-tested @cypress @Priority-3 @S-253905
Scenario Outline: Tooltip shows when mouse hovers over alert header actions on alert result
    Given the user is on the Alerts Profile Page
    And an alert with results exists
    When the user selects the alert with results
    Then the user should be redirected to the Alerts Result Page
    And the user hovers the mouse over the "<Icon>" on the "<Location>"
    Then a tooltip should be shown with "<TooltipText>" text

Examples: Tooltip on Alert Results Page at topic header
    | Icon                  | TooltipText                   | Location |
    | Checkbox              | Select all items on this page | toolbar  |
    | Folder                | Folders                       | toolbar  |
    | Email                 | Email                         | toolbar  |
    | Download              | Download                      | toolbar  |
    | Printer-Friendly View | Printer-friendly view         | toolbar  |
    | Delete                | Delete Selected               | toolbar  |
    | More                  | More Actions                  | toolbar  |

@e2e-tested @cypress @Priority-2 @S-253888
Scenario: Filter alerts by Applying a Filter, clicking the filter option checkbox and then using the Apply button
    Given the user is on the Alerts Profile Page    
    And the user has checked the "Type - Document" filter
    When the user clicks the apply button
    Then the result should be of Type "Document"

@e2e-tested @cypress @Priority-2 @S-253888
Scenario: Filter alerts by selecting the Filter, clicking on the filter label only - not using the Apply button
    Given the user is on the Alerts Profile Page    
    When the user has selects the "Type - Document" filter    
    Then the result should be of Type "Document"

@e2e-tested @cypress @Priority-1 @D-75853
Scenario Outline: User being able to filter for and open each type of alert
    Given the user is on the Alerts Profile Page
    When the user expands the Type filter 
    And the user selects the more options
    Then the user selects the "<TypeFilter>" Type Filter
    And the page is reloaded with only alerts of type "<TypeFilter>"

Examples:
| TypeFilter               |
| Document                 |
| Legislative              |
| Pending Legislative      |
| Publication              |
| Search                   |
| Shepards                 |
| Topic                    |

@e2e-tested @cypress @Priority-2 @S-253888
Scenario: Searching for an alert using a search term
    Given the user is on the Alerts Profile Page
    And the user has entered "crime" as a search term value
    When the user clicks the magnifier Icon
    Then the results should contain the search term "crime" in the alert topic

@e2e-tested @cypress @Priority-2 @S-253888
Scenario: Search using the search term and applying a filter
    Given the user is on the Alerts Profile Page
    And the user has entered "Crime" as a search term value
    And the user has checked the "Type - Document" filter
    When the user clicks the apply button
    Then the result should be of Type "Document"
    And contain the search term "Crime"

@e2e-tested @cypress @Priority-2 @S-253888
Scenario: Clear applied filter using the filter chip
    Given the user is on the Alerts Profile Page    
    When the user has selects the "Type - Document" filter    
    Then the Clear "Document" chip should be displayed
    When the user clicks the "Document" chip
    Then the "Document" filter should be removed

@e2e-tested @cypress @Priority-2 @S-253888
Scenario: Clear applied filter using the clear button
    Given the user is on the Alerts Profile Page    
    When the user has selects the "Type - Document" filter    
    Then the Clear filters button should be displayed
    When the user clicks the Clear filters button
    Then all filters should be removed

@e2e-tested @cypress @Priority-2 @S-253888
Scenario: Perform a search and clear search
    Given the user is on the Alerts Profile Page
    And the user has entered "crime" as a search term value
    When the user clicks the magnifier Icon
    Then after the results are loaded, the Clear Search button should be available
    When the user clicks the Clear Search button
    Then the Search filter should be removed

@e2e-tested @cypress @Priority-2 @D-75854
Scenario Outline: Selecting two filters simultaneously    
    Given the user is on the Alerts Profile Page    
    When the user selects the "Type - <Filter_1>" filter checkbox
    And the user also selects the "<Filter_2>" Type filter checkbox
    When the user clicks the Apply button
    Then the Clear "<Filter_1> or <Filter_2>" chip should be displayed

Examples: Filter options
| Filter_1 | Filter_2 |
| Search   | Shepards |

@e2e-tested @cypress @Priority-1 @S-2807654
Scenario Outline: User is able to edit each type of alert   
    Given the user is on the Alerts Profile Page    
    Then the user has selects the "Type - <TypeFilter>" filter
    When the user clicks the Edit Alert button
    Then the Edit Alert Modal should be shown
    And should have the "<Tabs>" tabs available

#Legislative alerts has no tabs, using title to verify modal is open
Examples:
| TypeFilter          | Tabs                              |
| Document            | Overview, Deliver, Share          |
| Legislative         | Pending Legislative Alert         |
| Pending Legislative | Pending Legislative Alert         |
| Publication         | Overview, Monitor, Deliver, Share |
| Search              | Overview, Monitor, Deliver, Share |
| Shepards            | Overview, Monitor, Deliver, Share |
| Topic               | Overview, Monitor, Deliver, Share |

@e2e-tested @cypress @Priority-3 @S-1249683 
Scenario: A print friendly view is shown in a new tab when Printer-friendly view is selected
    Given the user is on the Alerts Profile Page
    When the user clicks on the "Printer-Friendly View" button
    Then the printer friendly view should be displayed in a new tab