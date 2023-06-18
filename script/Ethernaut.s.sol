// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "lib/forge-std/src/Script.sol";
import {Vm} from "lib/forge-std/src/Vm.sol";

interface Level {
    function createInstance(address _player) external payable returns (address);

    function validateInstance(
        address payable _instance,
        address _player
    ) external returns (bool);
}

interface Ethernaut {
    event LevelInstanceCreatedLog(
        address indexed player,
        address indexed instance,
        address indexed level
    );
    event LevelCompletedLog(
        address indexed player,
        address indexed instance,
        address indexed level
    );

    function createLevelInstance(Level _level) external payable;

    function submitLevelInstance(address payable _instance) external;
}

contract EthernautScript is Script {
    Ethernaut ethernaut;
    uint256 key;
    address player;

    function setUp() public virtual {
        ethernaut = Ethernaut(0xD2e5e0102E55a5234379DD796b8c641cd5996Efd);
        key = vm.envUint("PRIVATE_KEY");
        player = vm.addr(key);

        vm.label(address(ethernaut), "Ethernaut");
        vm.label(player, "Player");
    }

    function createLevelInstance(
        address _level,
        uint256 value
    ) public returns (address payable) {


        vm.label(_level, "Level");
        ethernaut.createLevelInstance{value: value}(Level(_level));
        address payable instance;

        
        for (uint256 i = 0; i < entries.length; i++) {
            if (
                entries[i].topics[0] ==
                keccak256("LevelInstanceCreatedLog(address,address,address)")
            ) {
                instance = payable(
                    address(uint160(uint256(entries[i].topics[2])))
                );
                break;
            }
        }

        require(instance != address(0) && instance != player);
        return instance;
    }

    function submitLevelInstance(
        address payable _instance,
        address _level
    ) public {
        ethernaut.submitLevelInstance(_instance);
    }
}
