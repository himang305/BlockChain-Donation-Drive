// SPDX-License-Identifier: ????

pragma solidity ^0.8.0;

contract DonationDrive {
    event Deposit(uint amount);
    event Withdraw(uint amount);
    address payable public owner;    

    constructor() {
        owner = payable(msg.sender);        // owner of contract
    }

    receive() external payable {         // Collect Ether
        emit Deposit(msg.value);
    }     

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        emit Withdraw(address(this).balance);
        payable(msg.sender).transfer(_amount);   // OR selfdestruct(payable(msg.sender))
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}


