// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./Erc20.sol"; 

contract SimpleStaking {
    Erc20_token public token; 
    mapping(address => uint256) public staked; 

    /// @param _token Address of the deployed ERC20 token contract
    constructor(address _token) {  
        token = Erc20_token(_token); 
    } 

    /// @notice Stake `amount` of tokens
    function stake(uint256 amount) external {  
        token.transferFrom(msg.sender, address(this), amount); 
        staked[msg.sender] += amount; 
    }
    
    /// @notice Unstake `amount` of tokens
    function unstake(uint256 amount) external {
        require(staked[msg.sender] >= amount, "Not enough staked");
        staked[msg.sender] -= amount;
        token.transfer(msg.sender, amount);
    }
}
