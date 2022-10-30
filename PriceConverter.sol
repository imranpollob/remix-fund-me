// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns (uint) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (, int ans , , , ) = priceFeed.latestRoundData();
        return int(ans * 1e10);
    }

    function getConversionRate(uint ethAmount) internal view returns (uint) {
        uint ethPrice = getPrice();
        return (ethPrice * ethAmount) / 1e18;
    }
}