// SPDX-License-Identifier: Unlicenced
pragma solidity 0.8.30;

contract TokenContract {
    address public owner;
    
    struct Receivers {
        string name;
        uint256 tokens;
    }
    
    mapping(address => Receivers) public users;
    
    modifier onlyOwner(){
        require(msg.sender == owner, "Solo el propietario puede ejecutar esta funcion");
        _;
    }
    
    constructor(){
        owner = msg.sender;
        users[owner].tokens = 100;
    }
    
    function double(uint _value) public pure returns (uint){
        return _value * 2;
    }
    
    function register(string memory _name) public{
        users[msg.sender].name = _name;
    }
    
    function giveToken(address _receiver, uint256 _amount) onlyOwner public{
        require(users[owner].tokens >= _amount, "El propietario no tiene suficientes tokens");
        users[owner].tokens -= _amount;
        users[_receiver].tokens += _amount;
    }
    
    // Nueva función para comprar tokens con Ether
    function buyToken(uint256 _amount) public payable{
        uint256 requiredEther = _amount * 1 wei;
        require(msg.value >= requiredEther, "Ether insuficiente para comprar los tokens");
        require(users[owner].tokens >= _amount, "El propietario no tiene suficientes tokens disponibles");
        
        users[owner].tokens -= _amount;
        users[msg.sender].tokens += _amount;
    }
    
    // Función para mostrar el balance del contrato
    function getContractBalance() public view returns (uint256){
        return address(this).balance;
    }
}
