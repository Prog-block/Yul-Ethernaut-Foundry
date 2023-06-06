# Yul-Ethernaut-Foundry
Ethernaut puzzels solved using yul, tested with foundry.

Main goal of this repo was to practice my skills in writing assembly and using foundry.
Openzeppelin's Ethernaut is a Web3/Solidity based wargame. Each level is a smart contract that needs to be 'hacked'.

# SETUP🔥
This repo interacts with the Ethernaut through the use of foundry script.

Just install [foundry](https://book.getfoundry.sh/getting-started/installation)🙂

The hack contracts are preseant in the `src` folder and are written in yul. Contracts are deployed using script which are preseant in the `script folder`.

# EXECUTION🔥
The script can be run through the command: `forge script ./script/XX_LevelName.s.sol`.
