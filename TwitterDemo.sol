// SPDX-License-Identifier: MIT
// SPDX: Software Data Exchange MIT: Open Sourse
pragma solidity >=0.6.12 <0.9.0;
// version of compiler

contract Twitter{
 
 uint16 public  MAX_Length=250;

 struct  Tweet {
  uint256 id;
  address author;
  string content;
  uint256 timestamp;
  uint256 likes;
 }

mapping(address=>Tweet[]) internal tweets ;

address owner;
constructor(){
 owner=msg.sender;}

modifier onlyOwner() {
require(msg.sender==owner,"You are not the owner!");
_;
}

function change_Max_Length(uint16 Length) public onlyOwner{
  MAX_Length= Length;
  
}

function create_tweet(string memory tweet_message) public {

 require(bytes(tweet_message).length<=MAX_Length,"Tweet is too long bro!" ); 
 Tweet memory tweet_block= Tweet({
  id: tweets[msg.sender].length,
  author: msg.sender,
  content: tweet_message,
  timestamp: block.timestamp,
  likes:0 
 });
 
 tweets[msg.sender].push(tweet_block);

}

function likes(address author, uint256 id) external{
 require(id < tweets[author].length, "Invalid Tweet ID");
  tweets[author][id].likes++;
}

function Unlike(address author, uint256 id) external{
 require(id < tweets[author].length, "Invalid Tweet ID");
 require(tweets[author][id].likes>0,"No likes");
  tweets[author][id].likes--;
}


function get_tweet(address owner_tweet, uint index) public view returns(Tweet memory){
  return tweets[owner_tweet][index];

}
function get_tweets(address owner_tweet) public view returns(Tweet[] memory){
  return tweets[owner_tweet];

}

   function delete_tweet(uint256 id) external {
        if (id >= tweets[msg.sender].length) {
            revert("Tweet does not exist");
        }

        // Ensure the tweet id matches the given id
        assert(tweets[msg.sender][id].id == id);

        // Delete the tweet by setting the content to empty string
        tweets[msg.sender][id].content = ""; 
        tweets[msg.sender][id].timestamp = 0;
    }


}
