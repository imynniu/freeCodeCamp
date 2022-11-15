//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConverter {
     function getPrice() internal view returns (uint256){
        //ABI
        //contract address  0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface aggregatorV3Interface = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
         (
            /*uint80 roundID*/,
            int256 price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = aggregatorV3Interface.latestRoundData();
        return uint256( price * 1e10 );
    }
    //给定数量的eth获取其价格
    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD  = (ethPrice * ethAmount)/1e18;
        return ethAmountInUSD;
    }
}