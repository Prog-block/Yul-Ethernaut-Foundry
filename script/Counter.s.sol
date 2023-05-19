// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Counter} from "src/Counter.sol";
// ***** ^ this should be the exact name of the contract
contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new Counter(10);
                vm.stopBroadcast();
    }
}
