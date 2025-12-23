// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Pharmacy Supply Chain with 6 Roles
/// @notice Tracks medicine batch lifecycle using blockchain
contract PharmacySupplyChainSixRoles {
    address public admin;
    address public supplier;
    address public transporter;
    address public manufacturer;
    address public distributor;
    address public pharmacy;

    enum State {
        CreatedBySupplier,
        InTransitToManufacturer,
        WithManufacturer,
        InTransitToDistributor,
        WithDistributor,
        InTransitToPharmacy,
        AtPharmacy,
        Sold
    }

    struct Batch {
        uint256 batchId;
        string name;
        uint256 mfgDate;
        uint256 expDate;
        State state;
        address currentOwner;
    }

    uint256 public nextBatchId = 1;
    mapping(uint256 => Batch) public batches;

    event RolesUpdated(
        address admin,
        address supplier,
        address transporter,
        address manufacturer,
        address distributor,
        address pharmacy
    );

    event BatchCreated(uint256 batchId, string name, address supplier);
    event SentToTransporter(uint256 batchId);
    event ReceivedByManufacturer(uint256 batchId);
    event SentToDistributor(uint256 batchId);
    event ReceivedByDistributor(uint256 batchId);
    event SentToPharmacy(uint256 batchId);
    event ReceivedByPharmacy(uint256 batchId);
    event SoldToCustomer(uint256 batchId);

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    modifier onlyRole(address role) {
        require(msg.sender == role, "Unauthorized");
        _;
    }

    modifier inState(uint256 id, State s) {
        require(batches[id].state == s, "Invalid state");
        _;
    }

    function setRoles(
        address _supplier,
        address _transporter,
        address _manufacturer,
        address _distributor,
        address _pharmacy
    ) external onlyAdmin {
        supplier = _supplier;
        transporter = _transporter;
        manufacturer = _manufacturer;
        distributor = _distributor;
        pharmacy = _pharmacy;

        emit RolesUpdated(admin, supplier, transporter, manufacturer, distributor, pharmacy);
    }

    function createBatch(
        string calldata name,
        uint256 mfgDate,
        uint256 expDate
    ) external onlyRole(supplier) returns (uint256) {
        uint256 id = nextBatchId++;
        batches[id] = Batch(id, name, mfgDate, expDate, State.CreatedBySupplier, supplier);
        emit BatchCreated(id, name, supplier);
        return id;
    }

    function sendToTransporter(uint256 id)
        external
        onlyRole(supplier)
        inState(id, State.CreatedBySupplier)
    {
        batches[id].state = State.InTransitToManufacturer;
        batches[id].currentOwner = transporter;
        emit SentToTransporter(id);
    }

    function deliverToManufacturer(uint256 id)
        external
        onlyRole(transporter)
        inState(id, State.InTransitToManufacturer)
    {
        batches[id].state = State.WithManufacturer;
        batches[id].currentOwner = manufacturer;
        emit ReceivedByManufacturer(id);
    }

    function sendToDistributor(uint256 id)
        external
        onlyRole(manufacturer)
        inState(id, State.WithManufacturer)
    {
        batches[id].state = State.InTransitToDistributor;
        batches[id].currentOwner = distributor;
        emit SentToDistributor(id);
    }

    function receiveFromManufacturer(uint256 id)
        external
        onlyRole(distributor)
        inState(id, State.InTransitToDistributor)
    {
        batches[id].state = State.WithDistributor;
        emit ReceivedByDistributor(id);
    }

    function sendToPharmacy(uint256 id)
        external
        onlyRole(distributor)
        inState(id, State.WithDistributor)
    {
        batches[id].state = State.InTransitToPharmacy;
        batches[id].currentOwner = pharmacy;
        emit SentToPharmacy(id);
    }

    function receiveFromDistributor(uint256 id)
        external
        onlyRole(pharmacy)
        inState(id, State.InTransitToPharmacy)
    {
        batches[id].state = State.AtPharmacy;
        emit ReceivedByPharmacy(id);
    }

    function markAsSold(uint256 id)
        external
        onlyRole(pharmacy)
        inState(id, State.AtPharmacy)
    {
        batches[id].state = State.Sold;
        emit SoldToCustomer(id);
    }

    function getBatchDetails(uint256 id)
        external
        view
        returns (Batch memory)
    {
        return batches[id];
    }
}
