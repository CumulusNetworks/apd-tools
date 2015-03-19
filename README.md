apd-tools (ACPI Platform Description)
=====================================

Overview
--------

apd-tools is a set of tools to help encode network switch platform details
using ACPI.  The project consists of a set of guidelines and tools to help
developers create and evaluate ACPI table modifications on network switch
platforms.

Quick Start
-----------

See the HOWTO guide for complete getting started documentation.

[place holder for HOWTO guide]

Prerequisites
-------------

The iasl compiler from ACPICA (http://acpica.org)
An OS with Cumulus ACPI changes.

ACPI Table Override
-------------------

Development of ACPI tables on Linux is typically done by overriding the BIOS
tables during early kernel initialization.  The mechanism is
[documented](https://www.kernel.org/doc/Documentation/acpi/initrd_table_override.txt)
in the Linux kernel tree.  However, Cumulus Linux provides an easy way to add
debugging tables to the initrd.  To override the built-in ACPI tables, place a
file for each table in:

    /boot/acpi-slot-<n>/kernel/firmware/acpi

then run 'update-dsdt'

For example, to replace the DSDT for the Cumulus Linux image in install slot 1:

    mkdir -p /boot/acpi-slot-1/kernel/firmware/acpi
    cp dsdt.aml /boot/acpi-slot-1/kernel/firmware/acpi
    update-dsdt

This will create grub menu entries to boot Cumulus Linux with the updated DSDT.

Reboot and select the "ACPI override" menu option.
