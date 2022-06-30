// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.7.4;

import "../../interfaces/IERC1155.sol";

contract NotERC1155 {
  IERC1155 proxy;

  function notSafeTransferFrom(address _from, address _to, uint256 _id, uint256 _amount, bytes calldata _data) external {
    proxy.safeTransferFrom(_from, _to, _id, _amount, _data);
  }

  function notSafeBatchTransferFrom(address _from, address _to, uint256[] calldata _ids, uint256[] calldata _amounts, bytes calldata _data) external {
    proxy.safeBatchTransferFrom(_from, _to, _ids, _amounts, _data);
  }

  function notBalanceOf(address _owner, uint256 _id) external view returns (uint256) {
    return proxy.balanceOf(_owner, _id);
  }

  function notBalanceOfBatch(address[] calldata _owners, uint256[] calldata _ids) external view returns (uint256[] memory) {
    return proxy.balanceOfBatch(_owners, _ids);
  }

  function notSetApprovalForAll(address _operator, bool _approved) external {
    proxy.setApprovalForAll(_operator, _approved);
  }

  function notIsApprovedForAll(address _owner, address _operator) external view returns (bool) {
    return proxy.isApprovedForAll(_owner, _operator);
  }
}
