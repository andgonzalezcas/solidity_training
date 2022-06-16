// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract andNFT is ERC721 {
    address public admin;
    address paymentToken;
    uint256 price;

    constructor (address _paymentToken, uint256 _price) ERC721('NFT andres', 'NFTAND') {
        admin = msg.sender;
        paymentToken = _paymentToken;
        price = _price;
    }

    function mind (address to, uint256 tokenId) external {
        require(msg.sender == admin, 'only admin'); //access control
        ERC20(paymentToken).transferFrom(msg.sender, address(this), price);
        _safeMint(to, tokenId);
    }

    function burn (uint256 tokenId) external {
        require(msg.sender == ERC721.ownerOf(tokenId));
        ERC20(paymentToken).transferFrom(address(this), msg.sender, price);
        _burn(tokenId);
    }
}