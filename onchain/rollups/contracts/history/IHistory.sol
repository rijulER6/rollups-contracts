// Copyright 2023 Cartesi Pte. Ltd.

// SPDX-License-Identifier: Apache-2.0
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use
// this file except in compliance with the License. You may obtain a copy of the
// License at http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

/// @title History interface
pragma solidity ^0.8.13;

interface IHistory {
    // Permissioned functions

    /// @notice Submit a claim
    /// @param _claimData Data for submitting a claim
    /// @dev The encoding of _claimData might vary depending on the history implementation
    /// @dev Should have access control
    function submitClaim(bytes calldata _claimData) external;

    /// @notice Migrate to a new consensus
    /// @param _consensus The new consensus
    /// @dev Should have access control
    function migrateToConsensus(address _consensus) external;

    // Permissionless functions

    /// @notice Get a claim
    /// @param _dapp The DApp
    /// @param _proofContext Data for retrieving the desired claim
    /// @return epochHash_ The epoch hash of the claim
    /// @return firstInputIndex_ The index of the first input of the epoch in the input box
    /// @return lastInputIndex_ The index of the last input of the epoch in the input box
    /// @dev The encoding of _proofContext might vary depending on the history implementation
    function getClaim(
        address _dapp,
        bytes calldata _proofContext
    )
        external
        view
        returns (
            bytes32 epochHash_,
            uint256 firstInputIndex_,
            uint256 lastInputIndex_
        );
}
