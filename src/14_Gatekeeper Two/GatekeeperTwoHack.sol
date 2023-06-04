// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.18;

// interface GatekeeperTwo {
//     function enter(bytes8) external returns (bool);
// }

// contract Hack {
//     constructor(GatekeeperTwo gateKeeperTwo) {
//         // type(uint64).max= 2^64 - 1 or 1111...1111 --> 64 times
//         // ^ is for XOR operator, A-B = A(bar)B + B(bar)A
//         uint64 x = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
//         //  uint64 key = uint64(_gateKey);
//         //     x ^ key == type(uint64).max;
//         // Bitwise xor
//         // a     = 1010
//         // b     = 0110
//         // a ^ b = 1100

//         // a ^ a ^ b = b

//         // a     = 1010
//         // a     = 1010
//         // a ^ a = 0000
//         // x^key = max -> x^x^key=x^max -> key = x^max
//         uint64 k = x ^ type(uint64).max;
//         bytes8 key = bytes8(k);
//         require(gateKeeperTwo.enter(key), "call failed");
//     }
// }
