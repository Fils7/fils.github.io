    // SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0;

import "./Ownable.sol";

contract ParkingSpot is Ownable {

    address public _spotId;

    modifier checkCost(uint _value) {
        require (msg.value >= _value, "Not enought ether");
    }


    enum lotStatus { VACANT, FULL }
    lotStatus public currentStatus;

    event Occupy (address _occupant, uint _value);

    constructor() {
        super;
        currentStatus = lotStatus.VACANT;
    }

    function checkVacancy (uint _spotId) public view {
        
    }

    function park() payable external checkCost (2 ether) {
        require (currentStatus = lotStatus.VACANT, "Cureently Full.")
        currentStatus = lotStatus.FULL
        owner.transfer(msg.value);
    }


}