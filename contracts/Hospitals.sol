pragma solidity ^0.8.9;

contract Hospitals {

    struct hospital {
        string hospital_name;
        string hospital_address;
        string hospital_spec;
    }
    mapping(uint256 => hospital) hospitallist;
    uint256 numberofHospitals = 0;
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");

        _;
    }

    function store_hospital_details(
        string memory _hospital_name,
        string memory _hospital_address,
        string memory _hospital_spec
    ) public isOwner returns (uint256) {
        hospital storage hosh = hospitallist[numberofHospitals];
        hosh.hospital_name = _hospital_name;
        hosh.hospital_address = _hospital_address;
        hosh.hospital_spec = _hospital_spec;

        numberofHospitals++;

        return numberofHospitals - 1;
    }

    function retreive_hospital_details(uint256 hospital_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory
        )
    {
        hospital memory h = hospitallist[hospital_id];
        return (h.hospital_name, h.hospital_address, h.hospital_spec);
    }
}
