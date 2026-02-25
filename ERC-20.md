# ERC-20 Contract Usage Guide

This guide provides detailed instructions on how to use the ERC-20 contract included in this boilerplate. The contract is designed to be modular, extensible, and easy to integrate into various Ethereum-based applications.

## Features

- **Standard ERC-20 Implementation**: Fully compliant with the ERC-20 standard.
- **Customizable Parameters**: Easily set token name, symbol, and initial supply.
- **Extensibility**: Add custom functionality such as minting, burning, or access control.
- **Comprehensive Test Suite**: Validate contract behavior with pre-configured tests.

## Getting Started

1. **Deploy the Contract**:
   Use the provided deployment script to deploy the ERC-20 contract to your desired Ethereum network:
   ```bash
   forge script script/Deploy.s.sol:DeployScript --rpc-url <your_rpc_url> --private-key <your_private_key>
   ```

2. **Interact with the Contract**:
   Use standard ERC-20 functions to interact with the deployed contract:
   - `transfer`: Transfer tokens to another address.
   - `approve`: Approve an address to spend tokens on your behalf.
   - `transferFrom`: Transfer tokens on behalf of another address.

3. **Extend the Contract**:
   Inherit from the base ERC-20 contract to add custom functionality. For example:
   ```solidity
   contract MyToken is ERC20 {
       constructor() ERC20("MyToken", "MTK") {
           _mint(msg.sender, 1000000 * 10 ** decimals());
       }
   }
   ```

4. **Test the Contract**:
   Run the pre-configured test suite to ensure the contract behaves as expected:
   ```bash
   forge test
   ```

## Examples

### Deploying a Token

```solidity
// Example deployment script
contract DeployToken {
    function deploy() public {
        ERC20 token = new ERC20("ExampleToken", "EXT", 1000000);
    }
}
```

### Interacting with a Token

```solidity
// Example interaction
ERC20 token = ERC20(tokenAddress);
token.transfer(recipient, amount);
```

## Additional Resources

- [OpenZeppelin ERC-20 Documentation](https://docs.openzeppelin.com/contracts/4.x/erc20)
- [Foundry Documentation](https://book.getfoundry.sh/)

For further assistance, feel free to open an issue or contribute to the repository.