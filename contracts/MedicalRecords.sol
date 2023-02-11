// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MedicalRecords {
    mapping(uint256 => insurance) insurancelist;
    mapping(uint256 => past) pasthistory;
    mapping(uint256 => diag) diagnosis;
    mapping(uint256 => treat) treatment;
    mapping(uint256 => patient) patientlist;

    uint256 numberOfRecords = 0;

    struct patient {
        uint256 patient_id;
    }
    struct insurance {
        uint256 patient_id;
        string applicable;
        uint64 policy_no;
        string insurer;
        string policy_type;
        string policy_limit;
    }
    struct past {
        uint256 patient_id;
        string family_history;
        string personal_history;
        string drug_history;
    }
    struct diag {
        uint256 patient_id;
        string diag_summary;
        string prescription;
    }
    struct treat {
        string treatment;
        string date_treatment;
        uint256 doctor_id;
        uint256 hospital_id;
        string discharge;
        string follow_up;
    }
    address owner;

    constructor() public {
        owner = 0x34d8bC94989BbE14BCfd98E0550201ba4970B776;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");

        _;
    }
    
    function insurance_details(
        uint256 _patient_id,
        string memory _applicable,
        uint64 _policy_no,
        string memory _insurer,
        string memory _policy_type,
        string memory _policy_limit
    ) public isOwner returns(uint256) {
        insurance storage i = insurancelist[numberOfRecords];
        i.patient_id = _patient_id;
        i.applicable = _applicable;
        i.policy_no = _policy_no;
        i.insurer = _insurer;
        i.policy_type = _policy_type;
        i.policy_limit = _policy_limit;
        numberOfRecords++;

        return numberOfRecords - 1;
    }
    function get_insurance(uint256 patient_id)
        public
        view
        returns (
            string memory,
            uint64,
            string memory,
            string memory,
            string memory
        )
    {
        insurance memory i = insurancelist[patient_id];
        return (
            i.applicable,
            i.policy_no,
            i.insurer,
            i.policy_type,
            i.policy_limit
        );
    }
}
