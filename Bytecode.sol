pragma solidity >=0.4.25 <0.6.0;
contract HelloBlockchain {
 //Set of States
    enum StateType { Request, Respond}

    //List of properties
    StateType public  State;
    address public  EC;
    address public  Voter;

    string public RequestMessage;
    string public ResponseMessage;
    // constructor function
    constructor(string memory message) public
    {
        EC = msg.sender;
        RequestMessage = message;
        State = StateType.Request;
    }
    // call this function to send a request
    function SendRequest(string memory requestMessage) public
    {
        if (EC != msg.sender)
        {
            revert();
        }

        RequestMessage = requestMessage;
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