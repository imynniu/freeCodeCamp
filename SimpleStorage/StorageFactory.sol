// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{
    //使用数组存储智能合约
    SimpleStorage[] public simpleStorageArray;
    //部署SimpleStorage智能合约
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    //与simplestorage contract进行交互，存入favoriteNumber
    function sfFtore(uint256 _SimpleStorageIndex,uint256 _SimpleStorageNumber) public {
        //address
        //ABI
        //方式二,不使用new关键字，在SimpleStorage（）传入contract address
        SimpleStorage simpleStorage = simpleStorageArray[_SimpleStorageIndex];
        simpleStorage.store(_SimpleStorageNumber);
    }

    //与simplestorage contract进行交互，读取favoriteNumber
    function sfGet(uint256 _SimpleStorageIndex) public view returns(uint256){
        SimpleStorage simpleStorage =simpleStorageArray[_SimpleStorageIndex];
        return simpleStorage.retrieve();
    }
}