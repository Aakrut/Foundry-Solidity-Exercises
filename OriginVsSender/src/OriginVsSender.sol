// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
// ✅
contract OriginVsSender {


    uint256 public number;

    function setNumber(uint256 num) external {
        /// your code here
        require(tx.origin == msg.sender, "Caller must be EOA");
        number = num;
    }
}
