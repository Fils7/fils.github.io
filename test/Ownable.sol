    // SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0;

contract Ownable {
    address payable public owner;

    constructor() {
        tx.origin = owner;
    }

    modifier checkOwnership {
        require (owner == tx.origin);
        _;
    }

}