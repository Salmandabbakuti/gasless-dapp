//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/metatx/ERC2771Context.sol";

contract Greeter is ERC2771Context {
    address public trustedForwarder;
    string public greeting;

    constructor(string memory _greeting, address _trustedForwarder)
        ERC2771Context(address(trustedForwarder))
    {
        greeting = _greeting;
        trustedForwarder = _trustedForwarder;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
}
