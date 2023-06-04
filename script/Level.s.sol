// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// It is the template file for each level

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";

interface Instance {
    function owner() external view returns (address); // owner of the instance of the challange created
}

contract LevelScript is EthernautScript {
    // Update those values:
    // string network = "local"; // local / goerli
    address level = address(0); // level address

    Instance instance;

    // no need to modify setUp()
    function setUp() public override {
        super.setUp();

        // vm.createSelectFork(network);
        vm.startBroadcast(key);
        vm.deal(player, 100 ether);
        instance = Instance(createLevelInstance(level, 0));
        console.log("-> instance:", address(instance));
    }

    function hack() internal {}

    // function yulVersion() internal {}

    function run() public {
        hack();
        // baseVersion();
        // yulVersion();

        // submitLevelInstance(payable(address(instance)), level);
        // vm.stopBroadcast();
    }
}
