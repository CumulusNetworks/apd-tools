# APD Validation Suite

This repository contains the tests to ensure a vendor's APD implementation
complies with the specification.

## Setup

In order to use these tests, ensure you have acpica-tools installed along with
nose and other utilities.  This can be done by the following:
```
# sudo apt-get install acpica-tools
# pip install -r requirements.txt
```

If you prefer to use a virtualenv:
```
# virtualenv .venv
# source .venv/bin/activate
(.venv)# pip install -r requirements.txt
```

Another requirement to these tests is to have passwordless sudo(1) access to
dump the ACPI tables and access the ONIE\_EEPROM data.

## Run
In order to run these tests, perform the following:
```
# nosetests
```

## Test Descriptions

### Syntax Correctness
Check if the vendor correctly embedded ACPI blob.

*PASS:* If ACPI blob is inserted into the BIOS. Test 0.

### Semantic Correctness
Check ACPI tables can be extracted and disassembled.

*PASS:* If acpidump, acpixtract, and iasl dissassembly succeeds. Test 1.

### Presence of ASIC
Check the SWD module to determine if the port lane mapping is present.

*PASS:*  If port lane mapping is present.  Test 2.

### String Association with Fan module
Check if the vendor labeled the Fan FRUs for sensor and other
subsystems/commands to display correctly to the user.

*PASS:* If the Fan labels are not derived from the \_HID default word. Test 3.

### ONIE EEPROM Information
Check if the ONIE EEPROM information is available through the SWC module and
print out all TLV data.  Same information should be available to ONIE should
be accessible to the NOS.

*PASS:* Locate ONIE EEPROM data from SWC module and print out TLV data. Test 4.

### Port Mapping Consistency
TBD

*PASS:*  TBD
