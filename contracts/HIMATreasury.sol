// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HIMATreasury {
    // Daftar petinggi yang punya hak voting
    address[] public pengurus;
    mapping(address => bool) public isPengurus;
    
    // Syarat minimal persetujuan (contoh: 2 dari 3 pengurus)
    uint public minimalApproval;

    struct Proposal {
        address payable tujuan;
        uint jumlah;
        string deskripsi;
        bool tereksekusi;
        uint jumlahApproval;
    }

    Proposal[] public daftarProposal;
    mapping(uint => mapping(address => bool)) public sudahApprove;

    event UangKasMasuk(address dari, uint jumlah);
    event ProposalDibuat(uint proposalId, address pembuat, address tujuan, uint jumlah, string deskripsi);
    event ProposalDisetujui(uint proposalId, address pengurus);
    event DanaCair(uint proposalId, address tujuan, uint jumlah);

    modifier hanyaPengurus() {
        require(isPengurus[msg.sender], "Akses ditolak: Anda bukan pengurus HIMA!");
        _;
    }

    // Constructor: Masukkan address 3 pengurus dan angka 2 saat Deploy di Remix
    constructor(address[] memory _pengurus, uint _minimalApproval) {
        require(_pengurus.length > 0, "Harus ada minimal 1 pengurus");
        require(_minimalApproval > 0 && _minimalApproval <= _pengurus.length, "Minimal approval tidak valid");

        for (uint i = 0; i < _pengurus.length; i++) {
            address p = _pengurus[i];
            require(p != address(0), "Address tidak valid");
            require(!isPengurus[p], "Pengurus tidak boleh duplikat");
            
            isPengurus[p] = true;
            pengurus.push(p);
        }
        minimalApproval = _minimalApproval;
    }

    function bayarKas() public payable {
        require(msg.value > 0, "Nominal kas tidak boleh 0");
        emit UangKasMasuk(msg.sender, msg.value);
    }

    function ajukanPenarikan(address payable _tujuan, uint _jumlah, string memory _deskripsi) public hanyaPengurus {
        require(address(this).balance >= _jumlah, "Saldo kas HIMA tidak cukup!");

        daftarProposal.push(Proposal({
            tujuan: _tujuan,
            jumlah: _jumlah,
            deskripsi: _deskripsi,
            tereksekusi: false,
            jumlahApproval: 0
        }));

        emit ProposalDibuat(daftarProposal.length - 1, msg.sender, _tujuan, _jumlah, _deskripsi);
    }

    function setujuiProposal(uint _proposalId) public hanyaPengurus {
        Proposal storage prop = daftarProposal[_proposalId];
        
        require(!prop.tereksekusi, "Proposal ini sudah dicairkan!");
        require(!sudahApprove[_proposalId][msg.sender], "Anda sudah memberikan persetujuan!");

        sudahApprove[_proposalId][msg.sender] = true;
        prop.jumlahApproval += 1;

        emit ProposalDisetujui(_proposalId, msg.sender);
    }

    function cairkanDana(uint _proposalId) public hanyaPengurus {
        Proposal storage prop = daftarProposal[_proposalId];

        require(!prop.tereksekusi, "Proposal ini sudah dicairkan!");
        require(prop.jumlahApproval >= minimalApproval, "Persetujuan belum memenuhi syarat minimal!");
        require(address(this).balance >= prop.jumlah, "Saldo kas HIMA tidak cukup!");

        prop.tereksekusi = true;
        prop.tujuan.transfer(prop.jumlah);

        emit DanaCair(_proposalId, prop.tujuan, prop.jumlah);
    }

    function getSaldoKas() public view returns (uint) {
        return address(this).balance;
    }
}
