# tpm_pcr_dump.py
from tpm2_pytss import *

with TctiLdr('device') as tcti, SAPIContext(tcti) as sapi:
    caps = sapi.GetCapability(TPM2_CAP.PCRS, 0, 24)
    for pcr in range(caps.data.pcr_select_size):
        select = caps.data.pcr_select[pcr]
        print(f"PCR{pcr}: {bytes(select).hex()}")
