    // SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0;

import "./Ownable.sol";
import "./ParkingSpot.sol";

contract ParkingLot is Ownable {

    mapping (uint => address) public spots;

    function createSpot (uint _spotId) external {
        ParkingSpot spot = new ParkingSpot(_spotId);
        spots[_spotId] = address(spot);
    }

    function parkingSpotStatus (uint _spotId) external view returns(bool){
        ParkingSpot spot = ParkingSpot[spots(_spotId)];
        return spot.checkVacancy();
    }

    function takeSpot (uint _spotId) payable external {
        ParkingSpot spot = ParkingSpot[spots(_spotId)];
        spot.park{value: msg.value}();
    }
    function Leave(uint _spotId) external checkOwnership {
        ParkingSpot spot = ParkingSpot[spots(_spotId)];
        spot.getOut();
    }
}