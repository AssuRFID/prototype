#!/bin/bash
/root/Sunfounder_PN532_NFC_Code/readID | grep "Read card" | sed 's/Read card #'//g' | /root/prototype/process.sh
