//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./PriceConverter.sol";
error NotOwner();
contract FundMe {
    using PriceConverter for uint256;
     uint public constant MINIMUMUSD= 50 * 1e18;
    address public immutable i_owner;
     constructor(){
         i_owner =msg.sender;
     }
    // fund函数，所有人都可以向该合约发送代币
    address[] public funders; 
    mapping(address => uint256) public addressToAmountFunded;
    function fund() public payable{
        //至少50usd才能发送
        require(msg.value.getConversionRate() >= MINIMUMUSD,"Didn't send enough one ether");//1e18==1*10**18==1 ether
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    //withdraw function
    function withdraw()public onlyOwner {
        for(uint256 funderIndex = 0 ; funderIndex< funders.length ; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset array
        funders =new address[](0);
        //actually withdraw coin
        (bool callSuccess,)=payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess,"call failed");
    }
    modifier onlyOwner{
        // require(msg.sender == owner,"sender is not ownder!");
        if(msg.sender!=i_owner)
        revert NotOwner();
        _;
    }
    //如果有人不适用fund函数向合约地址发送以太坊
    receive()external payable{
        fund();
    }

    fallback()external payable{
        fund();
    }
   
}