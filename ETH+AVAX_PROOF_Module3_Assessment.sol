// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    modifier only_owner {
        require(msg.sender == owner, "Only the contract owner can execute this function");
        _;
    }

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initial_supply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initial_supply * 10**uint256(_decimals);
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    function transfer(address _to, uint256 _value) external {
        require(_to != address(0), "Invalid recipient address");
        require(balances[msg.sender] >= _value, "Insufficient balance");

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
    }

    function mint(address _to, uint256 _value) external only_owner {
        require(_to != address(0), "Invalid recipient address");
        require(_value > 0, "Mint amount must be greater than zero");

        totalSupply += _value;
        balances[_to] += _value;

        emit Mint(_to, _value);
    }

    function burn(uint256 _value) external {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        require(_value > 0, "Burn amount must be greater than zero");

        totalSupply -= _value;
        balances[msg.sender] -= _value;

        emit Burn(msg.sender, _value);
    }
}
