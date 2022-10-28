// SPDX-license-identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint minimumDollar = 1;

    function fund() public payable {
        require(msg.value >= minimumDollar, "Not enough");
    }

    function getVersion() public returns(uint) {
        AggregatorV3Interface feed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return feed.version();
    }
}