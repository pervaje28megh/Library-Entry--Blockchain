// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Library {
    
    mapping (bytes32 => bool) private entryExists;
    
    event NewEntry(bytes32 indexed entryHash);
    
    function addEntry(string memory entry) public {
        bytes32 hash = keccak256(bytes(entry));
        require(!entryExists[hash], "Entry already exists");
        entryExists[hash] = true;
        emit NewEntry(hash);
    }
    
    function checkEntry(string memory entry) public view returns (bool) {
        bytes32 hash = keccak256(bytes(entry));
        return entryExists[hash];
    }
}