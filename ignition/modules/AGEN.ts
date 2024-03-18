import {buildModule} from "@nomicfoundation/hardhat-ignition/modules";

const ONE_GWEI: bigint = 1_000_000_000n;

const AGENModule = buildModule("AgenModule", m => {
    const lockedAmount = m.getParameter("lockedAmount", ONE_GWEI);

    const lock = m.contract("AGEN", [], {
        value: lockedAmount
    })

    return {lock}
})

export default AGENModule;

