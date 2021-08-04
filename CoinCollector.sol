pragma solidity ^0.5.0;


contract NotCoin {
    bytes32 public notId;
    uint public notRarity;
    
    constructor(bytes32 _id, uint _rarity) public {
    notId = _id;
    notRarity = _rarity;
    }
}

contract Coin {
    bytes32 public id;
    uint public rarity;
    
    constructor(bytes32 _id, uint _rarity) public {
    id = _id;
    rarity = _rarity;
    }
}

interface ICoinCollector {
    function isCollected(address coin) external view returns (bool);
    function collectCoin(address coin) external ;
}


contract Collector is ICoinCollector {
    
    mapping(address=>bool) collection;

    
    function isCollected(address coin)  external view returns (bool){
        return collection[coin];
    }
    
    function collectCoin(address coin) external{
        require(Coin(coin).rarity() >= 0);
        collection[coin] = true;
    }
}
