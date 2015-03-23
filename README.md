apd-tools (ACPI Platform Description)
=====================================

Overview
--------

apd-tools is a set of tools to help encode network switch platform details
using
[ACPI](https://en.wikipedia.org/wiki/Advanced_Configuration_and_Power_Interface).
The project consists of a set of guidelines and tools to help developers create
and evaluate ACPI table modifications on network switch platforms.

Quick Start
-----------

See the [apd-tools Wiki](https://github.com/CumulusNetworks/apd-tools/wiki) for
complete getting started documentation.

Prerequisites
-------------

1. The iasl compiler from [ACPICA](http://acpica.org)
1. An OS with APD [kernel changes](https://github.com/CumulusNetworks/linux-apd)

ACPI Table Override on Cumulus Linux
------------------------------------

Development of ACPI tables on Linux is typically done by overriding the BIOS
tables during early kernel initialization.  The mechanism is
[documented](https://www.kernel.org/doc/Documentation/acpi/initrd_table_override.txt)
in the Linux kernel tree.  Cumulus Linux provides convienence script that to
automate those instructions.  To override the built-in ACPI tables, place a
file for each table in:

```sh
/boot/acpi-slot-<n>/kernel/firmware/acpi
```

then run `update-dsdt`

For example, to replace the DSDT for the Cumulus Linux image in install slot 1:

```sh
mkdir -p /boot/acpi-slot-1/kernel/firmware/acpi
cp dsdt.aml /boot/acpi-slot-1/kernel/firmware/acpi
update-dsdt
```

This will create grub menu entries to boot Cumulus Linux with the updated DSDT.

Reboot and select the "ACPI override" grub menu option.  It's a good idea to
attempt the \_PRT "hello world" example from initrd_table_override.txt to prove
the mechanism is working.
