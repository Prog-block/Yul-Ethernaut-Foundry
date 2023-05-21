// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/fallback/FallbackHack.sol";
import "lib/forge-std/src/Vm.sol";

contract FallbackHackTest is Test {

    FallbackHack _fallback;

    function setUp() public {
        _fallback = new FallbackHack();
        
    }

    function testGetCount() public {}
}
