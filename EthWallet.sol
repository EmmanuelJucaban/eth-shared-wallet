// SPDX-License-Identifier: GNU 3.0
pragma solidity >=0.6.0 <=0.8.7;

contract EthWallet {
    event Received(address, uint256, string, uint256);

    uint256 walletBalance;

    function withdrawMoney(address payable recieverAddress, uint256 amount)
        public 
    {
        recieverAddress.transfer(amount);
        walletBalance -= amount;
    }

    receive() external payable {
        walletBalance += msg.value;
        emit Received(
            address(this),
            msg.value,
            "Contract received payment",
            walletBalance
        );
    }
}
