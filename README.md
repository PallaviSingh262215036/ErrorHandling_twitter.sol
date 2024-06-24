# Twitter Smart Contract

This is a simple Ethereum smart contract that mimics basic Twitter functionalities. It allows users to create, like, and delete tweets. The contract is implemented using Solidity and can be deployed on the Ethereum blockchain.

## Prerequisites

- [Remix IDE](https://remix.ethereum.org/) or any other Solidity development environment
- An Ethereum wallet (e.g., MetaMask) for deploying and interacting with the contract
- Basic understanding of Solidity and smart contract development

## Getting Started

### Open in Remix IDE

1. Open the Remix IDE.
2. Create a new file and paste the contents of `Twitter.sol` from this repository.

### Deployment

#### Compile the contract

1. Select the appropriate Solidity compiler version (`>=0.6.12 <0.9.0`).
2. Click on the "Compile" button to compile the contract.

#### Deploy the contract

1. Go to the "Deploy & Run Transactions" tab.
2. Select the environment (e.g., JavaScript VM, Injected Web3).
3. Click on the "Deploy" button.

## Contract Details

### State Variables

- `MAX_Length`: The maximum length of a tweet, default is 250 characters.
- `owner`: The address of the contract owner.

### Structs

- `Tweet`: Represents a tweet with the following properties:
  - `id`: Unique identifier for the tweet.
  - `author`: Address of the tweet's author.
  - `content`: The content of the tweet.
  - `timestamp`: Timestamp when the tweet was created.
  - `likes`: Number of likes the tweet has received.

### Mappings

- `tweets`: Maps an address to an array of `Tweet` structs.

### Modifiers

- `onlyOwner`: Ensures that only the contract owner can call the function.

## Functions

### `change_Max_Length(uint16 Length)`

- Changes the maximum length of tweets.
- Only callable by the contract owner.
- **Parameters**:
  - `Length`: The new maximum length of tweets.

### `create_tweet(string memory tweet_message)`

- Creates a new tweet.
- **Parameters**:
  - `tweet_message`: The content of the tweet.
- **Requirements**:
  - The length of `tweet_message` must be less than or equal to `MAX_Length`.

### `likes(address author, uint256 id)`

- Increments the like count of a specified tweet.
- **Parameters**:
  - `author`: The address of the tweet's author.
  - `id`: The ID of the tweet.
- **Requirements**:
  - The tweet ID must be valid.

### `Unlike(address author, uint256 id)`

- Decrements the like count of a specified tweet.
- **Parameters**:
  - `author`: The address of the tweet's author.
  - `id`: The ID of the tweet.
- **Requirements**:
  - The tweet ID must be valid.
  - The tweet must have at least one like.

### `get_tweet(address owner_tweet, uint index)`

- Retrieves a specific tweet by its index.
- **Parameters**:
  - `owner_tweet`: The address of the tweet's owner.
  - `index`: The index of the tweet.
- **Returns**:
  - The tweet at the specified index.

### `get_tweets(address owner_tweet)`

- Retrieves all tweets of a specific user.
- **Parameters**:
  - `owner_tweet`: The address of the tweet's owner.
- **Returns**:
  - An array of tweets.

### `delete_tweet(uint256 id)`

- Deletes a tweet by setting its content to an empty string and its timestamp to 0.
- **Parameters**:
  - `id`: The ID of the tweet.
- **Requirements**:
  - The tweet ID must be valid.

## License

This project is licensed under the MIT License. 
