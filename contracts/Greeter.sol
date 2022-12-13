//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/metatx/ERC2771Context.sol";

contract Greeter is ERC2771Context {
    address public trustedForwarder;
    string public greeting;
    address public lastCaller;

    constructor(
        address _trustedForwarder,
        string memory _greeting
    ) ERC2771Context(address(_trustedForwarder)) {
        greeting = _greeting;
        trustedForwarder = _trustedForwarder;
    }

    event GreetingAdded(string greeting, address indexed sender);

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
        lastCaller = _msgSender();
        emit GreetingAdded(_greeting, _msgSender());
    }
}
