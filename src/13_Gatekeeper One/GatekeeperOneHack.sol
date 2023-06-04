// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.18;

// // samajh nhi aya... baad mai karna
// // interface GateKeeperOne {}

// contract Hack {
//     GatekeeperOne gatekeeperOne;

//     constructor(address chal) {
//         gatekeeperOne = GatekeeperOne(chal);
//     }

//     function attack() public {
//         // uint k = uint64(_gateKey);
//         // uint32(k) != k;
//         /// 56726
//         // uint64 -> 8bytes -> 16

//         uint16 k16 = uint16(uint160(tx.origin)); // k16=0xdd96
//         //  uint64(k16)= 0x000000000000dd96= 56726
//         uint64 k64 = uint64(1 << 63) + uint64(k16); // putting 1 on very left of k so that it can get cutoff when uint 32 happens and, uint32(k) != k
//     }
// }

// contract GatekeeperOne {
//     address public entrant;

//     modifier gateOne() {
//         require(msg.sender != tx.origin);
//         _;
//     }

//     modifier gateTwo() {
//         require(gasleft() % 8191 == 0);
//         _;
//     }

//     modifier gateThree(bytes8 _gateKey) {
//         require(
//             uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)),
//             "GatekeeperOne: invalid gateThree part one"
//         );
//         require(
//             uint32(uint64(_gateKey)) != uint64(_gateKey),
//             "GatekeeperOne: invalid gateThree part two"
//         );
//         require(
//             uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)),
//             "GatekeeperOne: invalid gateThree part three"
//         );
//         _;
//     }

//     function enter(
//         bytes8 _gateKey
//     ) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
//         entrant = tx.origin;
//         return true;
//     }
// }
