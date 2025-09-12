# ERC20 Token Basics Learning

This repository contains sample contracts to learn how **ERC20 tokens** work and how they interact with a **staking contract**.

---

## Contracts

* **Erc20\_token.sol**:
  Basic ERC20 implementation with balances, transfers, approvals, and allowances.

* **SimpleStaking.sol**:
  Lets users stake and unstake ERC20 tokens after approval.

---

## How to Use

### 1. Deploy the ERC20 token

* Deploy `Erc20_token.sol`.
* Provide values for:

  * `initial_balance` (total supply you want to create)
  * `name` (e.g., `"MyToken"`)
  * `symbol` (e.g., `"MTK"`)
  * `decimals` (usually `18`)
* After deployment, copy the **ERC20 token address**.

---

### 2. Deploy the staking contract

* Deploy `SimpleStaking.sol`.
* Paste the **ERC20 token address** into the constructor field.

---

### 3. Approve tokens for staking

* Go to the deployed **ERC20 contract**.
* Call the `approve` function:

  * `_spender` → paste the **deployed Simplestaking contract address**.
  * `_value` → type how many tokens you want to allow for staking.
* This step gives the staking contract permission to use your tokens.

---

### 4. Stake tokens

* Go to the deployed **SimpleStaking contract**.
* Call the `stake` function:

  * `amount` → type the **same number of tokens you approved**.
* This will transfer your tokens into the staking contract.

---

### 5. Unstake tokens

* Go to the **SimpleStaking contract**.
* Call the `unstake` function:

  * `amount` → type how many tokens you want to withdraw from staking.
* Your tokens will be sent back to your wallet.
 
# 6. Confirmation of Steps

* To confirm that everything worked:

  1. Go to your deployed **ERC20 contract**.
  2. Call the `balanceOf` function.
  3. Paste the **staking contract address** as the input.
  4. If successful, it will return the same amount of tokens you staked.

* If the confirmation fails:

  * Use ChatGPT (or any AI/tool of your choice) to help retrace the steps.
  * Once it works, start exploring the logic yourself — this is how you’ll really see why the ERC20 token contract is important.

---

## Advice for Learners

* After following the setup steps, take time to **figure out each logic yourself**.
* Solidity syntax can be confusing at first — if you don’t understand something:

  * Ask ChatGPT (or any tool) to give you a **simplified sample code**, or
  * Write your **own mini example** and observe how it behaves.
* Don’t rely only on theory — **practical testing and proving concepts are far more valuable**.

---

## Key Notes

* **Order matters** → You must approve first, then stake.
* The staking contract cannot take tokens unless you explicitly approve it.
* The `staked` mapping records how much each address has staked.

---

## Next Steps

Work in progress:

* `TokenSale.sol`
* `TokenSaleFaucet.sol`
