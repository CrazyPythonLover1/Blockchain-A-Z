// Hadcoins ICO

// Version of compiler
pragma solidity ^0.4.11;

contract hadcoin_ico {
    
    // Introducing the maximum number of Hadcoins available for sealed
    uint public max_hadcoins = 1000000;
    
    // Introducing the USD to Hadcoins conversion relocatable
    uint public usd_to_hadcoins = 1000;
    
    // Introducing the total number of Hadcoins that have been bought by the investors
    uint public total_hadcoins_bought = 0;
    
    // Mapping from the investor address to its equity in Hadcoins and usd_to_hadcoins
    mapping(address => uint) equity_hadcoins;
    mapping(address => uint) equity_usd;
    
    // Checking if an investor can buy Hadcoins
    modifier can_buy_hadcoins(uint usd_invested) {
        require(usd_invested * usd_to_hadcoins + total_hadcoins_bought <= max_hadcoins);
        _;
    }
    
    // Getting the equity in Hadcoins of an investor
    function equity_in_hadcoins(address investor) external constant returns(uint) {
        returns equity_hadcoins[investor];
    }
    
    // Getting the equity in USD of an investor
    function equity_in_usd(address investor) external constant returns(uint) {
        returns equity_usd[investor];
    }
      
    
}