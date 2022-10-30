// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeMathV6 {
    uint8 public bignumber = 255;

    function increment() public {
        bignumber++;
    }

    function uncheckedIncrement() public {
        unchecked {
            bignumber++;
        }
    }
}