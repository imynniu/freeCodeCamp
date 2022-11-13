// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{
    //重写store函数
    function store(uint256 _favorityNumber) public override {
        favoriteNumber = _favorityNumber + 5;
    }
}