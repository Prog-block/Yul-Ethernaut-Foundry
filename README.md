# Yul-Ethernaut-Foundry
Ethernaut puzzels solved using yul, tested with foundry.

Main goal of this repo was to practice my skills in writing assembly and using foundry. Openzeppelin's Ethernaut is a Web3/Solidity based wargame. Each level is a smart contract that needs to be 'hacked'.
This repo interacts with the levels through the use of foundry script.
The hack contracts are preseant in the `src` folder and are written in yul. Contracts are deployed using script which are preseant in the `script folder`.

The script can be run through the command: `forge script ./script/XX_LevelName.s.sol`.
