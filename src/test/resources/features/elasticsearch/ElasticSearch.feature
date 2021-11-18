@regression @elasticsearch
Feature: Elastic search queries

  Background: Home page
    Given user opens Embase application
    And Quick search page is opened

   @C488585
  Scenario Outline: Run queries on Elastic Search
    Given user opens Results page
    And user enters query <queries> and performs a search
    Then the result set is not empty
    Examples:
      | queries                                                                                                                                                                                                                                                                                                                                                                                               |
      | dinutuximab OR ch14.18 OR unituxin OR 'chimeric monoclonal antibody 14.18' OR '7sqy4zud30' OR '1363687-32-4' OR 'hu14.18' OR 'humanized antibody 14.18' OR treprostinil OR remodulin OR tyvaso OR orenitram OR 'rum6k67esg' OR 'h1fkg90039' OR '830354-48-8' OR '289480-64-4' OR '81846-19-7' OR '830354-48' OR 'ralinepag' OR 'apd811' OR '1187856-49-0' OR 'treprostinilo ferrer efg' OR 'treprost' |
      |('brain hemorrhage' OR "intracerebral haemorrhage" OR “cerebral hemorrhage” OR ((cerebral OR brain OR intracerebral) AND (hemorrhage OR bleeding))) AND (“computed tomography” OR 'x-ray computed tomography' OR (computed AND tomography)) AND (expansion OR outcome)                                                                                                                                 |