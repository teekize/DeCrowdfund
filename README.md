# DeCrowdfund

This is the smart contract for a De-Crowdfund.
It 2 smart contract code

  ## 1. Factory smart contract
  - this contains a list of all deployed campaigns contaracts
  
  ## 2. Campaign contract
  - this contains code for an instance of the smart contract
  - every campaign has an owner
  - you can contibute to a campaign
  - to withdraw any funds from the contract: 
      1. you must create a Request object with the description of what the amounts will be used for:
      2. contributors of the campaign will vote on the Request:
      3. if the Request receives more than 50% of the votes the the owner can withdraw the funds
      
    ## contains the following function signatures
    
    contribute - this function is called by a user who wants to contribute to a campaign
    
    createRequest -create a request for withdraal of cash
    
    approveRequest - contributors vote  on the request
    
    finalizeRequest - finally owner widthraws if votes > 50%
    
    
   Tests for the contracts are written using Mocha.
   
   ## Deployed Testnet link to contract [here](https://rinkeby.etherscan.io/address/0xEd951cee3475319BdE1b0DE40FFb7568Fa7B02EE)
   
   ## Frontend is under developement using:
      1. React Js
      2. NextJS
   
   ## Author 
   Elvis Teeka
