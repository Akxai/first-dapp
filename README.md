# StackUp Smart Contract

This smart contract, implemented in Solidity, enables the creation and management of quests and campaigns within the StackUp platform. It allows users to join quests, submit quest completion, and receive rewards. Additionally, administrators can review submissions, edit quests, delete quests, create campaigns, and manage campaign details.

## Functionalities

### Create Quest

Allows the administrator to create a new quest.

**Inputs:**

- `title`: Title of the quest (string)
- `reward`: Reward for completing the quest (uint8)
- `numberOfRewards`: Number of available rewards for the quest (uint256)
- `startTime`: Start time of the quest (uint256){timestamp}
- `endTime`: End time of the quest (uint256){timestamp}

**Example:**

```solidity
createQuest("Using Tailwind CSS", 10, 5, 1685007000, 1685093400); 
```

This example creates a quest titled "Using Tailwind CSS" with a reward of 10 and five available rewards. The quest starts on May 25, 2023 (1685007000) and ends on May 31, 2023 (1685093400).

### Edit Quest

Allows the administrator to edit an existing quest.

**Inputs:**

- `questId`: ID of the quest to be edited (uint256)
- `title`: Updated title of the quest (string)
- `reward`: Updated reward for completing the quest (uint8)
- `numberOfRewards`: Updated number of available rewards for the quest (uint256)
- `startTime`: Updated start time of the quest (uint256){timestamp}
- `endTime`: Updated end time of the quest (uint256){timestamp}

**Example:**

```
editQuest(1, "Using Tailwind Classes", 20, 3, 1684932452, 1685537252);
```

This example edits the quest with ID 1, changing the title to "Using Tailwind Classes" , the reward to 20, the number of available rewards to 3, the start time to May 24, 2023 (1684932452), and the end time to May 31, 2023 (1685537252).

### Delete Quest

Allows the administrator to delete an existing quest.

**Inputs:**

- `questId`: ID of the quest to be deleted (uint256)

**Example:**

```
deleteQuest(1);
```
This example deletes the quest with ID 1 from the system.

### Join Quest

Allows a user to join a quest.

**Inputs:**

- `questId`: ID of the quest to join (uint256)

**Example:**

```
joinQuest(1);
```

This example allows the user to join the quest with ID 1.

### Submit Quest

Allows a user to submit completion of a quest.

**Inputs:**

- `questId`: ID of the quest to submit (uint256)

**Example:**

```
submitQuest(1);
```

This example allows the user to submit completion of the quest with ID 1.

### Review Quest Submission

Allows the administrator to review and approve/reject a quest submission.

**Inputs:**

- `questId`: ID of the quest to review (uint256)
- `player`: Address of the player who submitted the quest (address)
- `approved`: Boolean value indicating whether the submission is approved or rejected

**Example:**

```
reviewQuestSubmission(1, 0xAbC123..., true);
```

This example approves the submission of the player at address 0xAbC123... for the quest with ID 1.

### Create Campaign

Allows the administrator to create a new campaign.

**Inputs:**

- `title`: Title of the campaign (string)
- `reward`: Reward for completing the campaign (uint8)
- `numberOfRewards`: Number of available rewards for the campaign (uint256)
- `startTime`: Start time of the campaign (uint256){timestamp}
- `endTime`: End time of the campaign (uint256){timestamp}

**Example:**

```
createCampaign("Tailwind Challenge", 50, 10, 1685007000, 1687685400);
```

This example creates a campaign titled "Tailwind Challenge" with a reward of 50 and ten available rewards. The campaign starts on May 25, 2023 (1685007000) and ends on June 25, 2023 (1687685400).

### Edit Campaign

Allows the administrator to edit an existing campaign.

**Inputs:**

- `campaignId`: ID of the campaign to be edited (uint256)
- `title`: Updated title of the campaign (string)
- `reward`: Updated reward for completing the campaign (uint8)
- `numberOfRewards`: Updated number of available rewards for the campaign (uint256)
- `startTime`: Updated start time of the campaign (uint256){timestamp}
- `endTime`: Updated end time of the campaign (uint256){timestamp}

**Example:**

```
editCampaign(1, "Tailwind Breakthrough", 75, 5, 1685007000, 1687685400);
```

This example edits the campaign with ID 1, changing the title to "Tailwind Breakthrough", the reward to 75, the number of available rewards to 5, the start time to May 25, 2023 (1685007000), and the end time to June 25, 2023 (1687685400).

### Delete Campaign

Allows the administrator to delete an existing campaign.

**Inputs:**

campaignId: ID of the campaign to be deleted (uint256)

**Example:**

```
deleteCampaign(1);
```

This example deletes the campaign with ID 1 from the system.

### Join Campaign

Allows a user to join a campaign.

**Inputs:**

campaignId: ID of the campaign to join (uint256)

**Example:**

```
joinCampaign(1);
```

This example allows the user to join the campaign with ID 1.

### Submit Campaign

Allows a user to submit completion of a campaign.

**Inputs:**

campaignId: ID of the campaign to submit (uint256)

**Example:**

```
submitCampaign(1);
```

This example allows the user to submit completion of the campaign with ID 1.

### Review Campaign Submission

Allows the administrator to review and approve/reject a campaign submission.

**Inputs:**

- `campaignId`: ID of the campaign to review (uint256)
- `player`: Address of the player who submitted the campaign (address)
- `approved`: Boolean value indicating whether the submission is approved or rejected

**Example:**

```
reviewCampaignSubmission(1, 0xAbC123..., true);
```

This example approves the submission of the player at address 0xAbC123... for the campaign with ID 1.
























