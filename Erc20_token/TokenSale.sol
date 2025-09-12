// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./Erc20.sol";

contract TokenSale {
    Erc20_token public token;
    uint256 public rate = 1000; // 1 ETH = 1000 tokens

    /// @param _token Address of the deployed ERC20 token
    constructor(address _token) {
        token = Erc20_token(_token);
    }

    /// @notice Buy tokens by sending ETH
    function buyTokens() external payable {
        uint256 amount = msg.value * rate;

        // Ensure the sale contract has enough tokens
        require(token.balanceOf(address(this)) >= amount, "Not enough tokens in contract");

        // Transfer tokens to the buyer
        token.transfer(msg.sender, amount);
    }
}
