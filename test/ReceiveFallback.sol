// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ReceiveFallback {
    uint public result;

    // Fallback function must be declared as external, triggered when msg.data has value
    fallback() extrernal payable {
        result = 2;
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() extrernal payable {
        result = 1;
    } 
}

