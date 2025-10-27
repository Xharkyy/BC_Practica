// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import Ownable from the OpenZeppelin Contracts library
import "@openzeppelin/contracts/access/Ownable.sol";

// Make Box inherit from the Ownable contract
contract Box is Ownable {
    uint256 private _value;

    event ValueChanged(uint256 value);

    constructor() Ownable(msg.sender) {}

    // The onlyOwner modifier restricts who can call the store function
    function store(uint256 value) public onlyOwner {
        _value = value;
        emit ValueChanged(value);
    }

    function retrieve() public view returns (uint256) {
        return _value;
    }
}


/*
Conceptos del codigo: 

Herencia: El contrato Box hereda de Ownable de OpenZeppelin, lo que proporciona control de acceso básico.
Modificadores: Utiliza el modificador onlyOwner para restringir quién puede ejecutar la función store.
Eventos: Emite un evento ValueChanged cuando se almacena un nuevo valor.

*/