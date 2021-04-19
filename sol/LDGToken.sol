// SPDX-License-Identifier: MIT
pragma solidity 0.6.10;

import "./ERC721.sol";
import "./Counters.sol";
import "./Ownable.sol";

contract LDGToken is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("NFT-Example", "NEX") public{}

    function mintNft(address receiver, string memory tokenURI) external onlyOwner returns (uint256) {
        _tokenIds.increment();

        uint256 newNftTokenId = _tokenIds.current();
        _mint(receiver, newNftTokenId);
        _setTokenURI(newNftTokenId, tokenURI);
        return newNftTokenId;
    }
}