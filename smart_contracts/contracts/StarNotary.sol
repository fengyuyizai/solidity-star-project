pragma solidity ^0.4.23;

import './ERC721Token.sol';

contract StarNotary is ERC721Token { 

    struct Star { 
        string name;
        string story;
        string ra;
        string dec;
        string mag;
    }
    
    mapping(uint256 => Star) public tokenIdToStarInfo;

    mapping(uint256 => uint256) public starsForSale;

    mapping(bytes32 => bool) public starHash;

    function createStar(string _name, string _story, string _ra, string _dec, string _mag, uint256 _tokenId) public {
        // check that empty;
        require(keccak256(abi.encodePacked(tokenIdToStarInfo[_tokenId].dec)) == keccak256(""));
        require(keccak256(abi.encodePacked(_ra)) != keccak256(""), "ra is empty");
        require(keccak256(abi.encodePacked(_dec)) != keccak256(""), "dec is empty");
        require(keccak256(abi.encodePacked(_mag)) != keccak256(""), "mag is empty");
        require(_tokenId != 0);

        require(!checkIfStarExist(_ra, _dec, _mag));


        Star memory newStar = Star(_name, _story, _ra, _dec, _mag);

        tokenIdToStarInfo[_tokenId] = newStar;
        starHash[keccak256(abi.encodePacked(_ra, _dec, _mag))] = true;
        ERC721Token.mint(_tokenId);
    }

    function putStarUpForSale(uint256 _tokenId, uint256 _price) public { 
        require(this.ownerOf(_tokenId) == msg.sender, 'address is not same');

        starsForSale[_tokenId] = _price;
    }

    function buyStar(uint256 _tokenId) public payable { 
        require(starsForSale[_tokenId] > 0);

        uint256 starCost = starsForSale[_tokenId];
        address starOwner = this.ownerOf(_tokenId);

        require(msg.value >= starCost);

        clearPreviousStarState(_tokenId);

        transferFromHelper(starOwner, msg.sender, _tokenId);

        if(msg.value > starCost) { 
            msg.sender.transfer(msg.value - starCost);
        }

        starOwner.transfer(starCost);
    }

    function clearPreviousStarState(uint256 _tokenId) private {
        //clear approvals 
        tokenToApproved[_tokenId] = address(0);

        //clear being on sale 
        starsForSale[_tokenId] = 0;
    }

    function checkIfStarExist(string _ra, string _dec, string _mag) public view returns(bool) {
        return starHash[keccak256(abi.encodePacked(_ra, _dec, _mag))];
    }

    function tokenIdToStarInfo(uint256 _tokenId) public view returns(string, string, string, string, string){
        return (tokenIdToStarInfo[_tokenId].name, tokenIdToStarInfo[_tokenId].story, tokenIdToStarInfo[_tokenId].ra, tokenIdToStarInfo[_tokenId].dec, tokenIdToStarInfo[_tokenId].mag);
    }

}