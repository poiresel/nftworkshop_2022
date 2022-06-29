// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";

contract KiwiCollectible is ERC721, ERC721Enumerable, ERC721URIStorage, ERC721Burnable, Ownable {
    using Strings for uint256;
    string baseURI;
    string public baseExtension = ".json";
    uint256 public maxSupply = 200;
    bool public paused = false;

    event ValueReceived(address user, uint amount);

    constructor() ERC721("KiwiCollectible", "KIWI") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmNT82xLpQ1YiJ59piE5UDXcjoVffDCBeKqC1DsTe5M6Zh/";
    }

    // public
    function mint(uint256 _mintAmount) public payable {
        uint256 supply = totalSupply();
        require(_mintAmount < 20);
        require(supply + _mintAmount <= maxSupply);

        for (uint256 i = 1; i <= _mintAmount; i++) {
            _safeMint(msg.sender, supply + i);
        }
    }

    function safeMint(address to, uint256 tokenId, string memory uri)
        public
        onlyOwner
    {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override(ERC721, ERC721URIStorage)
    returns (string memory)
    {
        require(
        _exists(tokenId),
        "ERC721Metadata: URI query for nonexistent token"
        );

        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0
            ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension))
            : "";
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    fallback() external payable {
        // React to receiving ether
        emit ValueReceived(msg.sender, msg.value);
    }

    receive() external payable {
        // React to receiving ether
        emit ValueReceived(msg.sender, msg.value);
    }

}
