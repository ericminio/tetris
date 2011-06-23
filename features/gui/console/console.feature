Feature: text representation of a tetris game

  Scenario: empty hole representation
    Given a hole with 2 lines and 1 columns
    When the hole is empty
    Then I see it as
    """

    * *
    * *
    ***
    
    """

    Given a hole with 7 lines and 5 columns
    When the hole is empty
    Then I see it as
    """

    *     *
    *     *
    *     *
    *     *
    *     *
    *     *
    *     *
    *******
    
    """

   Scenario: brick representation
     Given a hole with 7 lines and 5 columns
     When there is a brick at line 6 and column 2
     Then I see it as
     """

    *     *
    * +   *
    *     *
    *     *
    *     *
    *     *
    *     *
    *******

    """
