// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

contract JakeHong is ERC1155, Ownable, ERC1155Supply {

    uint256 public constant WEDDING = 1;
    uint256 public constant BIRTHDAY = 2;
    uint256 public constant NEW_YEAR = 3;
    uint256 public constant GRADUATE = 4;

    constructor()
        ERC1155("https://gateway.pinata.cloud/ipfs/QmWro7aMqeeMyBBWN7BiHPU6ReRLioigkji1m5dXT8zemC/{id}.json")
    {
        _mint(msg.sender, WEDDING, 40, "");
        _mint(msg.sender, BIRTHDAY, 30, "");
        _mint(msg.sender, NEW_YEAR, 20, "");
        _mint(msg.sender, GRADUATE, 10, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        override(ERC1155, ERC1155Supply)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}