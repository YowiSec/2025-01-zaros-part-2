// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import { MockPriceFeedWithInvalidReturn } from "test/mocks/MockPriceFeedWithInvalidReturn.sol";

contract MockSequencerUptimeFeedWithInvalidReturn is MockPriceFeedWithInvalidReturn { }
