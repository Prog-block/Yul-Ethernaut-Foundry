// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
interface Privacy {}

contract PrivacyHack {
    Privacy privacy;

    constructor(address chal) {
        privacy = Privacy(chal);
    }
}
