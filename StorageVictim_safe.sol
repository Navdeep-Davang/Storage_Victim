// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

/**
 * @title StorageVictim
 * @dev A contract to store user data with proper access control and security measures.
 */
contract StorageVictim {
    address private owner;

    struct Storage {
        address user;
        uint amount;
    }

    mapping(address => Storage) private storages;

    /**
     * @dev Contract constructor.
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Store user data.
     * @param _amount The amount to be stored.
     */
    function store(uint _amount) public {
        require(msg.sender != address(0), "Invalid address");
        require(_amount > 0, "Invalid amount");

        Storage storage str = storages[msg.sender];
        str.user = msg.sender;
        str.amount = _amount;
    }

    /**
     * @dev Get stored user data.
     * @param _address The address of the user.
     * @return The user's address and stored amount.
     */
    function getStore(address _address) public view returns (address, uint) {
        require(_address != address(0), "Invalid address");
        Storage storage str = storages[_address];
        return (str.user, str.amount);
    }

    /**
     * @dev Get the owner's address.
     * @return The owner's address.
     */
    function getOwner() public view returns (address) {
        return owner;
    }
}
