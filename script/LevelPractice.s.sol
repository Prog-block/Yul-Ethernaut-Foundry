// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";

interface Instance {
}

contract LevelScript is EthernautScript {
    address level = address(0);

    Instance instance;

    function setUp() public override {
        super.setUp();

        vm.startBroadcast(key);
        vm.deal(player, 100 ether);
        instance = Instance(createLevelInstance(level, 0)); // Instance created that we see on ethernaut
        console.log("-> instance:", address(instance));
    }

    function hack() internal {}

    function run() public {
        hack();

        submitLevelInstance(payable(address(instance)), level);
        vm.stopBroadcast();
    }
}
