// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
// ✅
contract BasicBank {
    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times
    function addEther() external payable {
        (bool sent, ) = payable(address(this)).call{value: msg.value}("");
    }

    /// @notice used to withdraw ether from the contract (No restriction on withdrawals)
    function removeEther(uint256 amount) external payable {
        payable(msg.sender).transfer(amount);
    }

    // receive ether 
    receive() external payable {}

    // if no available trigger fallback
    fallback() external payable {}
}
