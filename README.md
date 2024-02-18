# Smart Contract: Will

This smart contract implements a basic will functionality, allowing the owner to specify beneficiaries who will receive assets in the event of the owner's death.

## Overview

This Solidity smart contract facilitates the distribution of crypto assets to specified beneficiaries upon the owner's demise. It provides the following features:

- **Beneficiary Management:** The owner can set beneficiaries and assign them inheritance amounts.
- **Withdrawal:** Beneficiaries can withdraw their allocated inheritance while the owner is alive.
- **Automatic Transfer:** In the event of the owner's death, beneficiaries can claim their inheritance automatically.

## Usage

1. **Deployment:**
   - Deploy the contract to the Ethereum blockchain using tools like Remix, Truffle, or Hardhat.

2. **Setting Beneficiaries:**
   - Call the `setBeneficiary` function to specify beneficiaries and their inheritance amounts. This function is accessible only to the contract owner.

3. **Withdrawal:**
   - Beneficiaries can call the `withdraw` function to claim their allocated inheritance while the owner is alive.

4. **Handling Owner's Death:**
   - Upon the owner's death, call the `ownerHasDied` function to trigger the automatic transfer of assets to beneficiaries.

## Security Considerations

- **Access Control:** Ensure that only authorized parties can call sensitive functions like `setBeneficiary` and `ownerHasDied`.
- **Oracle Integration:** Implement a mechanism to detect the owner's death and trigger the `ownerHasDied` function accordingly.
- **Testing:** Thoroughly test the contract functionality using tools like Truffle or Hardhat to identify and mitigate potential vulnerabilities.

## Disclaimer

This smart contract is provided for educational and demonstration purposes only. It should not be used in production environments without thorough testing and security auditing. The developers and contributors to this contract are not liable for any misuse or loss of funds resulting from its use.
