// SPDX-license-identifier: MIT
pragma solidity ^0.8.8;

error NotOwner();

contract FundMe {
    using PriceConverter for uint;

    mapping(address => uint) public addressToAmountFunded;
    address[] public funders;
    address public immutable i_owner;
    uint public constant MINIMUM_USD = 50 * 1e18;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Not enough");
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    modifier onlyOwner {
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }

    function withdraw() public onlyOwner {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            addressToAmountFunded[funder] = 0;
        }
        
        funders = new address[](0);
        
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    fallback() external] payable {
        fund();
    }

    receive() external] payable {
        fund();
    }
}