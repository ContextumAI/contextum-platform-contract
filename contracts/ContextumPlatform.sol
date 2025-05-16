// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract ContextumPlatform is AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    mapping(bytes32 => bool) private validContextHashes;

    event ContextAdded(bytes32 indexed contextHash, address indexed addedBy);
    event ContextRemoved(bytes32 indexed contextHash, address indexed removedBy);

    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(ADMIN_ROLE, msg.sender);
    }

    function addContextHash(bytes32 contextHash) external onlyRole(ADMIN_ROLE) {
        require(!validContextHashes[contextHash], "Context already exists");
        validContextHashes[contextHash] = true;
        emit ContextAdded(contextHash, msg.sender);
    }

    function removeContextHash(bytes32 contextHash) external onlyRole(ADMIN_ROLE) {
        require(validContextHashes[contextHash], "Context does not exist");
        validContextHashes[contextHash] = false;
        emit ContextRemoved(contextHash, msg.sender);
    }

    function isContextValid(bytes32 contextHash) external view returns (bool) {
        return validContextHashes[contextHash];
    }
}
