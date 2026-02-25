// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract AgentERC20 is ERC20, Ownable, ERC20Permit {
    constructor(
        string memory name,      // e.g. "My AI Token"
        string memory symbol     // e.g. "AIT"
    ) ERC20(name, symbol) ERC20Permit(name) Ownable(msg.sender) {
        // Optional: give deployer initial supply (agent can ask user for amount too)
        _mint(msg.sender, 1_000_000 * 10 ** decimals()); // 1 million tokens
    }

    // Agent-friendly mint function (only owner)
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Agent can burn if needed
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}