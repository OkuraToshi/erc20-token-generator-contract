# Token Generator

This project demonstrates a ERC20 token generator for multiple use cases varying from getting started with ERC20 to different types and features of ERC20 Token. It comes with a set of contracts with respect to thier features, a sample script that deploys that contracts named Deploy.js. This project uses the node module named openzeppelin to implement the ERC20 token and it's extensive features.

## Different ERC20 types are given below :

```shell
HelloERC20
StandardERC20
DetailedERC20
BurnableERC20
MintableERC20
PausableERC20
CommonERC20
RecoverableERC20
UnlimitedERC20
CrazyERC20
PotentialERC20
```

## HelloERC20

This is the most basic ERC20 token with a **Fixed Supply** i.e. 10K , **Fixed Decimals** i.e. **18** and Doesn't include much features like mintable burnable pausable etc.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/HelloERC20.sol).

## StandardERC20

This token contract is a simple ERC20 token conract yet an effective one as in this user can define it's own **desired supply** which is then going to fixed once minted at the time of deployment.
In this contract we have implemented a basic ERC20 token which does not inlude the extensive features of ERC20 Token standard. these features we will be covering in the upcoming templates of token contracts.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **TotalSupply** , **Type** : uint256.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/StandardERC20.sol).

## DetailedERC20

In this section, We have introduced the contract with another constructor argument with the implentation of which, we took the token smart contract template to a next level. This argument is named **Decimals**. What does it means? It basically enables user to create thier token with thier own desired number of decimals in a token type. This contract is also used as template for some upcoming token templates by importing it directly to the contract. Also, this contract does not include other features like mintalble, Burnable and pausable etc.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **TotalSupply** , **Type** : uint256.
4. **Decimals** , **Type** : uint8.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/DetailedERC20.sol).

## BurnableERC20

In this template we have used the openzeppelin extension for burnable token named **ERC20Burnable**. Which enable the user to [Burn](https://docs.openzeppelin.com/contracts/2.x/api/token/erc20#ERC20Burnable). tokens by calling the **burn** or **burnFrom** function of the contract. Also, we have implemented all the features of **DetailedERC20** to this token template.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **TotalSupply** , **Type** : uint256.
4. **Decimals** , **Type** : uint8.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/burnableERC20.sol).

## MintableERC20

In this template we have used the mint function of ERC20 to make this contract a Mintable Contract. Which enable the user to [Mint](https://ethereum.stackexchange.com/questions/98196/what-is-it-mean-by-minting-token) tokens by calling the **mint** function of the contract. Only Owner can call this fucntion. Also, we have implemented all the features of **DetailedERC20** to this token template.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **InitialSupply** , **Type** : uint256.
4. **TotalSupply** , **Type** : uint256.
5. **Decimals** , **Type** : uint8.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/MintableERC20.sol).


## PausableERC20

In this template we have used the openzeppelin extension for Pausable token named **ERC20Pausable**. Which enable the user to [Pause/Unpause](https://docs.openzeppelin.com/contracts/2.x/api/token/erc20#ERC20Pausable) token transfers by calling the **Pause** or **Unpause** function of the contract. Only Owner can call these fucntion. Also, we have implemented all the features of **BurnableERC20** to this token template.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **TotalSupply** , **Type** : uint256.
4. **Decimals** , **Type** : uint8.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/PausableERC20.sol).

## CommonERC20

CommonERC20 is a type of token template which includes the functionalities of both BurnableERC20 and MintableERC20. As the name suggest it is the most commonly used ERC20 Token type. This template does no include the features of PausableERC20.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **TotalSupply** , **Type** : uint256.
4. **Decimals** , **Type** : uint8.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/CommonERC20.sol).

## RecoverableERC20

RecoverableERC20 is a type of token template which enable the user to recover thier funds which are are sent to the contract by getting perplexed or any other means. This contract includes the functionalities of both BurnableERC20 and MintableERC20 along with the PausbaleERC20 features.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **InitialSupply** , **Type** : uint256.
4. **TotalSupply** , **Type** : uint256.
5. **Decimals** , **Type** : uint8.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/RecoverableERC20.sol).

## UnlimitedERC20

UnlimitedERC20 is a type of token template which inherits its features from **MintableERC20**, **BurnableERC20** and **Recoverable** with a **Unlimited Supply**.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **Decimals** , **Type** : uint8.
4. **InitialSupply** , **Type** : uint256.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/unlimitedERC20.sol).

## CrazyERC20

CrazyERC20 is a type of token template which inherits its features from **MintableERC20**, **BurnableERC20**, **PausableERC20** and **Recoverable** with a **Unlimited Supply**. CrazyERC20 is burnable, mintable, recoverable and pausable with unlimited supply. It's Also Ownable.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **InitialSupply** , **Type** : uint256.
4. **Decimals** , **Type** : uint8.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/CrazyERC20.sol).

## PotentialERC20

PotentialERC20 is a type of token template which inherits its features from **MintableERC20**, **BurnableERC20**, **PausableERC20** and **Recoverable** with a **Unlimited Supply**.

### Constructor Arguments

1. **name** , **Type** : string.
2. **symbol** , **Type** : string.
3. **InitialSupply** , **Type** : uint256.
4. **TotalSupply** , **Type** : uint256.
5. **Decimals** , **Type** : uint8.

Look at the [Code](https://github.com/NFTically/nftically-erc20-smart-contracts/blob/dev/contracts/PotentialERC20.sol).
