pragma solidity >=0.4.25 <0.6.0;
contract HelloBlockchain {
 //Set of States
    enum StateType { Request, Respond}

    //List of properties
    StateType public  State;
    address public  EC;
    address public  Voter;

    string public Requestvote;
    string public ResponseMessage;
    // constructor function
    constructor(string memory message) public
    {
        EC = msg.sender;
        Requestvote = message;
        State = StateType.Request;
    }
    // call this function to send a request
    function SendRequest(string memory Requestvote) public
    {
        if (EC != msg.sender)
        {
            revert();
        }

        Requestvote = Requestvote;
        State = StateType.Request;
    }

    // call this function to send a response
    function SendResponse(string memory responseMessage) public
    {
        Voter = msg.sender;

        ResponseMessage = responseMessage;
        State = StateType.Respond;
    }
}