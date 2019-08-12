pragma solidity >=0.4.25 <0.6.0;
contract Election {
	struct party{
		string name;
		uint votecount;
	}
	struct voter{
		bool voted;
		uint voteindex;
		uint weight;
	}
	event ElectionResults(string neme, uint votecount);
	address public owner;
	string public _name;
	mapping(address => voter) public voters;
	party[] public partys;
	uint public	auctionEnd;
	function Election(string _name,uint durationMinutes,string partyname1,string partyname2)
	{
		owner = msg.sender;
		name = _name;
		auctionEnd = now + (durationMinutes * 1 minutes);

		partys.push((party(partyname1,0)));
		partys.push((party(partyname1,0)));
	}
	function authorise(address voter)
	{
		require(msg.sender == owner);
		require(!voters[voter].voted);
		voters[voter].weight = 1;
	}
	function vote(uint voteindex)
	{
		require(now < auctionEnd);
		require(!voters[msg.sender].voted);
		voters[msg.sender].voted = true;
		voters[msg.sender].voteindex = voteindex;
		partys[voteindex].votecount += voters[msg.sender].weight;
	}	
	function end()
	{
		require(msg.sender == owner);
		require(now >= auctionEnd);
		for (uint i=0; i < partys.length;i++)
		{
			ElectionResults(partys[i].name;partys.votecount);
		}
	}

	}