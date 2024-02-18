// SPDX-License-Identifier: MIT
// Indicates the license under which the contract is published.

pragma solidity ^0.8.0;
// Specifies the version of Solidity the contract is written for.

contract Will {
    // Defines the contract named "Will".
    
    address owner;
    // Declares a state variable to store the address of the contract owner.
    
    mapping(address => uint256) public inheritance;
    // Declares a mapping to store the inheritance amount for each beneficiary.

    event AssetTransferred(address indexed beneficiary, uint256 amount);
    // Declares an event to log asset transfers.

    modifier onlyOwner() {
        // Modifier to restrict access to certain functions to the contract owner only.
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        // Constructor function to initialize the contract.
        owner = msg.sender;
        // Assigns the address of the contract deployer as the owner.
    }

    function setBeneficiary(address _beneficiary, uint256 _amount) public onlyOwner {
        // Function to set beneficiaries and their inheritance amount.
        inheritance[_beneficiary] = _amount;
        // Assigns the specified inheritance amount to the beneficiary.
    }

    function withdraw() public {
        // Function for beneficiaries to withdraw their inheritance.
        require(inheritance[msg.sender] > 0, "No inheritance available for this address");
        // Ensures the beneficiary has inheritance available.
        uint256 amount = inheritance[msg.sender];
        // Retrieves the inheritance amount for the beneficiary.
        inheritance[msg.sender] = 0;
        // Resets the inheritance amount to zero to prevent double withdrawal.
        payable(msg.sender).transfer(amount);
        // Transfers the inheritance amount to the beneficiary.
        emit AssetTransferred(msg.sender, amount);
        // Emits an event to log the asset transfer.
    }

    function ownerHasDied() public onlyOwner {
        // Function to be called in the event of the owner's death.
        for (uint256 i = 0; i < msg.sender.balance; i++) {
            // Loops through the balance of the contract owner.
            if (inheritance[msg.sender] > 0) {
                // Checks if the owner has assigned inheritance to themselves.
                payable(msg.sender).transfer(inheritance[msg.sender]);
                // Transfers the inheritance amount to the owner's address.
                emit AssetTransferred(msg.sender, inheritance[msg.sender]);
                // Emits an event to log the asset transfer.
                inheritance[msg.sender] = 0;
                // Resets the inheritance amount to zero after transfer.
            }
        }
    }
}
