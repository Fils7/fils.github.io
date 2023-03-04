    // SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0;

import "./Ownable.sol";

contract ParkingSpot is Ownable {


    uint public spotId;

    modifier checkCost(uint _value) {
        require (msg.value >= _value, "Not enought ether");
        _;
    }
    modifier checkStatus {
        require(currentStatus == lotStatus.VACANT);
        _;
    }

    enum lotStatus { VACANT, FULL }
    lotStatus public currentStatus;

    event Occupy (address _occupant, uint _value);

    constructor(uint _spotId) {
        super;
        spotId = _spotId;
        currentStatus = lotStatus.VACANT;
    }

    function checkVacancy() public view returns (bool) {
        if (currentStatus == lotStatus.VACANT) {
            return true;

       } else {
            return false;
        }
    }
    function park() payable external checkCost (2 ether) {
        currentStatus = lotStatus.FULL;
        owner.transfer(msg.value);
    }

    function getOut() external {
       currentstatus == lotstatus.VACANT;
    }
}