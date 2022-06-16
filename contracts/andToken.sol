// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AndToken is ERC20 {
  address public admin;
  constructor() ERC20('AndresToken', 'AND') {
    _mint (msg.sender, 10000 * 10 ** 18);
    admin = msg.sender;
  }

  /**
    * @dev create `amount` tokens to `to`, crecendo the
    * total supply.
    *
    * Requirements:
    *
    * - have the tokens that u going to mind in ur account
    */
  function mind (address to, uint256 amount) external {
    require(msg.sender == admin, 'only admin'); //access control
    _mint(to, amount);
  }

  /**
    * @dev Destroys `amount` tokens from your account, reducing the
    * total supply.
    *
    * Requirements:
    *
    * - have the tokens that u going to burn in ur account
    */
  function burn (uint256 amount) external {
    _burn(msg.sender, amount);
  }

  /**
    * @dev See {IERC20-transfer}.
    *
    * Requirements:
    *
    * - `to` cannot be the zero address.
    * - the caller must have a balance of at least `amount`.
    */
  function tranfer (address to, uint256 amount) external returns (bool) {
    _transfer (msg.sender, to, amount);
    return true;
  }
}