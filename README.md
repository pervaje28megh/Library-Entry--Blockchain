# Library-Entry--Blockchain
The code you provided is a simple Solidity smart contract written for the Ethereum blockchain. Let's go through the code and understand its functionality.

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Library {
```

The contract is named "Library" and is specified to follow the GPLv3 license. It is written using Solidity version 0.8.0.

```solidity
    mapping (bytes32 => bool) private entryExists;
```

The contract declares a private mapping called `entryExists`. It maps a bytes32 hash value to a boolean indicating whether an entry exists or not.

```solidity
    event NewEntry(bytes32 indexed entryHash);
```

The contract defines an event called "NewEntry", which is emitted when a new entry is added. It includes the indexed parameter `entryHash`, which is of type bytes32.

```solidity
    function addEntry(string memory entry) public {
        bytes32 hash = keccak256(bytes(entry));
        require(!entryExists[hash], "Entry already exists");
        entryExists[hash] = true;
        emit NewEntry(hash);
    }
```

The `addEntry` function takes a string parameter called `entry` and adds it as a new entry to the library. First, it calculates the keccak256 hash of the `entry` string using `keccak256(bytes(entry))`. It then checks if an entry with the calculated hash already exists in the `entryExists` mapping. If it does, the function reverts with the error message "Entry already exists." If the entry doesn't exist, the function sets the corresponding mapping value to `true` and emits the "NewEntry" event with the calculated hash.

```solidity
    function checkEntry(string memory entry) public view returns (bool) {
        bytes32 hash = keccak256(bytes(entry));
        return entryExists[hash];
    }
}
```

The `checkEntry` function takes a string parameter called `entry` and returns a boolean indicating whether the entry exists in the library. It calculates the hash of the `entry` string and retrieves the corresponding boolean value from the `entryExists` mapping.

Overall, this contract provides a simple library-like functionality for storing and checking the existence of entries based on their hashed values.
