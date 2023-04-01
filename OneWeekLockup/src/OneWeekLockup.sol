// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
// ✅
contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */

    mapping(address => uint256) account;
    mapping(address => uint256) ending;

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return account[user];
    }

    function depositEther() external payable {
        /// add code here
        require(msg.value != 0);
        account[msg.sender] += msg.value;
        ending[msg.sender] = block.timestamp ;
    }

    function withdrawEther(uint256 amount) external {
        // Check if the user has deposited ether in the past week
        require(
            block.timestamp -  ending[msg.sender]  >= 1 weeks  ,
            "You can only withdraw after one week of your last deposit"
        );

        // Check if the user has enough balance to withdraw the specified amount
        require(
            amount <= account[msg.sender],
            "Insufficient balance to withdraw"
        );

        // Subtract the withdrawn ether from the user's balance
        account[msg.sender] -= amount;

        // Transfer the withdrawn ether to the user's account
        payable(msg.sender).transfer(amount);
    }

    receive() external payable {}
}
