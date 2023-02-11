// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Doctors {
    struct Doctor {
        string doctor_name;
        string doctor_specialisation;
        uint256 doctor_ph_no;
        string doctor_uid;
    }
    mapping(uint256 => Doctor) doctorList;
    uint256 public numberOfDoctors = 0;
    address owner;

    constructor() public {
        owner = 0xE6005Cc724c2d44F0aF23d663017a7E375DD7F35;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");

        _;
    }

    function addDoctor(
        string memory _doctor_name,
        string memory _doctor_specialisation,
        uint256 _doctor_ph_no,
        string memory _doctor_uid
    ) public isOwner returns (uint256) {
        Doctor storage doct = doctorList[numberOfDoctors];

        doct.doctor_name = _doctor_name;
        doct.doctor_specialisation = _doctor_specialisation;
        doct.doctor_ph_no = _doctor_ph_no;
        doct.doctor_uid = _doctor_uid;
        numberOfDoctors++;

        return numberOfDoctors - 1;
    }

    function getDoctor(uint256 doctor_id)
        public
        view
        returns (
            string memory,
            string memory,
            uint256,
            string memory
        )
    {
        return (
            doctorList[doctor_id].doctor_name,
            doctorList[doctor_id].doctor_specialisation,
            doctorList[doctor_id].doctor_ph_no,
            doctorList[doctor_id].doctor_uid
        );
    }
}
