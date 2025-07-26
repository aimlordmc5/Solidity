// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

  contract VendingMachine {
    address public owner;

    mapping (address => uint256) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;

    }
    
    function getVendingMb() public view returns (uint256) {
        return  donutBalances[address(this)];
    }

    function restock (uint256 amount) public {
        require(msg.sender == owner, "Only the owner");
        donutBalances[address(this)] += amount;
    }

    function purchase(uint256 amount) public payable {
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
        require(msg.value >= amount * 1 ether, "You must pay at least 1 ETH per donut");
        require(donutBalances[address(this)] >= amount, "Not enough donuts in stock to complete this purchase");        
    
    }
     
    

  }
