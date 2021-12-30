pragma solidity ^0.4.17;

contract CampaignFactory{
    address[] private createdCampaigns;

    function createCampaign(uint minimumAmount,string memory name) public{
        address newCampaign=new Campaign(minimumAmount, msg.sender, name);
        createdCampaigns.push(newCampaign);
    }

    function getDeployedCampaigns() public view returns(address[]){
        return createdCampaigns;
    }
}

contract Campaign{
    struct Request{

        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCounts;
        mapping(address => bool) addressVoted;
    
    }

    Request[] public requests;
    string public campaignName;
    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    uint public approversCount;

    modifier restricted(){
        require(msg.sender == manager);
            _;
    }

    function Campaign(uint minimum,address campaignOwner, string memory _campaignName) public{
        manager=campaignOwner;
        minimumContribution=minimum;
        campaignName=_campaignName;
    }

    function contribute() public payable{
        require(msg.value >minimumContribution);
       approvers[msg.sender]=true;
       approversCount ++;
    }

    function createRequest(string description, uint value, address recipient) public restricted{
        Request memory newRequest= Request({
            description:description,
            value:value,
            recipient:recipient,
            complete:false,
            approvalCounts:0
        });

        requests.push(newRequest);
    }

    function approveRequest(uint index) public{
        Request storage request=requests[index];

        require(approvers[msg.sender]);
        require(!request.addressVoted[msg.sender]);

        request.addressVoted[msg.sender]=true;
        request.approvalCounts++;
    }

    function finalizeRequest(uint index) public restricted{
        
        Request storage request=requests[index];
        require(request.approvalCounts > (approversCount /2));
        require(!request.complete);

        request.recipient.transfer(request.value);

        request.complete= true;
    }

}
