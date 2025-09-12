// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./Erc20.sol";  // Your ERC20 token contract

contract TokenFaucet {
    Erc20_token public token;

    /// @param _token Address of the deployed ERC20 token
    constructor(address _token) {
        token = Erc20_token(_token);
    }

    /// @notice Gives the caller 100 tokens from the faucet
    function drip() external {
        // Make sure the faucet has enough tokens
        require(token.balanceOf(address(this)) >= 100, "Faucet empty");

        // Transfer 100 tokens to the caller
        token.transfer(msg.sender, 100);
    }
}
