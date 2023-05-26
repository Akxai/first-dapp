// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackUp {
  enum PlayerQuestStatus {
    NOT_JOINED,
    JOINED,
    SUBMITTED
  }

  enum QuestStatus {
    PENDING,
    APPROVED,
    REJECTED
  }

  struct Quest {
    uint256 questId;
    uint256 numberOfPlayers;
    string title;
    uint8 reward;
    uint256 numberOfRewards;
    uint256 startTime;
    uint256 endTime;
    QuestStatus status;
  }

  struct Campaign {
    uint256 campaignId;
    string title;
    uint256[] questIds;
  }

  address public admin;
  uint256 public nextQuestId;
  uint256 public nextCampaignId;
  mapping(uint256 => Quest) public quests;
  mapping(address => mapping(uint256 => PlayerQuestStatus)) public playerQuestStatuses;
  mapping(uint256 => Campaign) public campaigns;

  modifier onlyAdmin() {
    require(msg.sender == admin, "Only the admin can perform this action");
    _;
  }

  modifier questExists(uint256 questId) {
    require(quests[questId].questId != 0, "Quest does not exist");
    _;
  }

  modifier campaignExists(uint256 campaignId) {
    require(campaigns[campaignId].campaignId != 0, "Campaign does not exist");
    _;
  }

  constructor() {
    admin = msg.sender;
  }

  // create Quest function

  function createQuest(
    string calldata title_,
    uint8 reward_,
    uint256 numberOfRewards_,
    uint256 startTime_,
    uint256 endTime_
  ) external onlyAdmin {
    uint256 questId = nextQuestId;
    quests[questId] = Quest(
      questId,
      0,
      title_,
      reward_,
      numberOfRewards_,
      startTime_,
      endTime_,
      QuestStatus.PENDING
    );
    nextQuestId++;
  }

  // edit Quest function

  function editQuest(
    uint256 questId,
    string calldata title_,
    uint8 reward_,
    uint256 numberOfRewards_,
    uint256 startTime_,
    uint256 endTime_
  ) external onlyAdmin questExists(questId) {
    Quest storage quest = quests[questId];
    quest.title = title_;
    quest.reward = reward_;
    quest.numberOfRewards = numberOfRewards_;
    quest.startTime = startTime_;
    quest.endTime = endTime_;
  }

  // delete Quest function

  function deleteQuest(uint256 questId) external onlyAdmin questExists(questId) {
    delete quests[questId];
  }

  // join Quest function

  function joinQuest(uint256 questId) external questExists(questId) {
    require(
      playerQuestStatuses[msg.sender][questId] == PlayerQuestStatus.NOT_JOINED,
      "Player has already joined/submitted this quest"
    );

    Quest storage quest = quests[questId];
    require(block.timestamp >= quest.startTime, "Quest has not started yet");
    require(block.timestamp <= quest.endTime, "Quest has already ended");

    playerQuestStatuses[msg.sender][questId] = PlayerQuestStatus.JOINED;
    quest.numberOfPlayers++;
  }

  // submit Quest function

  function submitQuest(uint256 questId) external questExists(questId) {
    require(
      playerQuestStatuses[msg.sender][questId] == PlayerQuestStatus.JOINED,
      "Player must first join the quest"
    );

    playerQuestStatuses[msg.sender][questId] = PlayerQuestStatus.SUBMITTED;
  }

  // review submission function

  function reviewQuestSubmission(
    uint256 questId,
    address player,
    bool approved
  ) external onlyAdmin questExists(questId) {
    require(
      playerQuestStatuses[player][questId] == PlayerQuestStatus.SUBMITTED,
      "Player has not submitted this quest"
    );

    if (approved) {
      quests[questId].status = QuestStatus.APPROVED;
      // Perform the desired reward logic here
    } else {
      quests[questId].status = QuestStatus.REJECTED;
    }
  }

  // create campaign function

  function createCampaign(string calldata title_, uint256[] calldata questIds_)
    external
    onlyAdmin
  {
    uint256 campaignId = nextCampaignId;
    campaigns[campaignId] = Campaign(campaignId, title_, questIds_);
    nextCampaignId++;
  }

  // edit campaign function

  function editCampaign(
    uint256 campaignId,
    string calldata title_,
    uint256[] calldata questIds_
  ) external onlyAdmin campaignExists(campaignId) {
    Campaign storage campaign = campaigns[campaignId];
    campaign.title = title_;
    campaign.questIds = questIds_;
  }

  // delete campaign function

  function deleteCampaign(uint256 campaignId)
    external
    onlyAdmin
    campaignExists(campaignId)
  {
    delete campaigns[campaignId];
  }
}
