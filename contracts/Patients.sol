// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Patients {
    struct Patient {
        string patient_name;
        uint256 patient_age;
        string gender;
        string height;
        uint256 weight;
        string phone_no;
        string email_id;
        uint256 date;
        uint256 doctor_id;
        uint256 hospital_id;
    }
    mapping(uint256 => Patient) patientlist;
    uint256 public numberofPatients;
    address owner;

    constructor() public {
        owner = 0xE6005Cc724c2d44F0aF23d663017a7E375DD7F35;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");

        _;
    }

    function addPatient (
        string memory _patient_name,
        uint256 _patient_age,
        string memory _patient_gender,
        string memory _patient_height,
        uint256 _patient_weight,
        string memory _patient_ph_no,
        string memory _patient_email_id,
        uint256 _date,
        uint256 _doctor_id,
        uint256 _hospital_id
    ) public returns(uint256) {
        Patient storage patient = patientlist[numberofPatients];
        patient.patient_name = _patient_name;
        patient.patient_age = _patient_age;
        patient.gender = _patient_gender;
        patient.height = _patient_height;
        patient.weight = _patient_weight;
        patient.phone_no = _patient_ph_no;
        patient.email_id = _patient_email_id;
        patient.date = _date;
        patient.doctor_id = _doctor_id;
        patient.hospital_id = _hospital_id;

        numberofPatients++;

        return numberofPatients - 1;
    }

    function getPatient(uint256 _id) public view returns(string memory,uint256,string memory,string memory,uint256,string memory,string memory,uint256,uint256,uint256){
        Patient memory p = patientlist[_id];
        return(p.patient_name,p.patient_age,p.gender,p.height,p.weight,p.phone_no,p.email_id,p.date,p.doctor_id,p.hospital_id);
    }
}
