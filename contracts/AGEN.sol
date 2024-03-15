// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
// import { ERC20Burnable } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
// import { ERC20Capped } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
// import { ERC20Votes, IVotes } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
// import { ERC20Permit } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import { IAGEN, IERC20 } from "./interfaces/IAGEN.sol";
import { IERC165 } from  "@openzeppelin/contracts/interfaces/IERC165.sol";
import { IVotes } from "@openzeppelin/contracts/governance/utils/IVotes.sol";


// Upgradeables
import { ERC20BurnableUpgradeable } from "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import { ERC20CappedUpgradeable } from "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20CappedUpgradeable.sol";
import { ERC20VotesUpgradeable } from "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import { ERC20Upgradeable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import { ERC20PermitUpgradeable } from "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";


contract AGEN is IAGEN, ERC20Upgradeable, ERC20VotesUpgradeable, ERC20CappedUpgradeable, ERC20BurnableUpgradeable, OwnableUpgradeable {
    constructor(uint256 cap) ERC20Upgradeable("AGEN", "AGEN") ERC20CappedUpgradeable(cap) ERC20PermitUpgradeable("AGEN") {}


    function supportsInterface(bytes4 interfaceId) external pure override returns (bool) {

        return
            interfaceId == type(IAGEN).interfaceId ||
            interfaceId == type(IERC20).interfaceId ||
            interfaceId == type(IERC165).interfaceId ||
            interfaceId == type(IVotes).interfaceId;
    }

function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20Upgradeable, ERC20VotesUpgradeable) {
        super.afterTokenTransfer(from, to, amount);
    }

    function cap() public view override(IAGEN, ERC20CappedUpgradeable) returns (uint256) {
        return ERC20CappedUpgradeable.cap();
    }

    function mint(address account, uint256 amount_) external onlyOwner {
        _mint(account, amount_);
    }


function _burn(address account, uint256 amount) internal override(ERC20Upgradeable, ERC20VotesUpgradeable) {
        super._burn(account, amount);
    }

function _mint(address account, uint256 amount) internal override(ERC20Upgradeable, ERC20CappedUpgradeable, ERC20VotesUpgradeable) {
        super._mint(account, amount);
    }
}