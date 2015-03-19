/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140926-64 [Oct 21 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of dsdt.dat, Thu Dec  4 01:29:24 2014
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00002847 (10311)
 *     Revision         0x02
 *     Checksum         0x04
 *     OEM ID           "ALASKA"
 *     OEM Table ID     "A M I "
 *     OEM Revision     0x01072009 (17244169)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20061109 (537268489)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 2, "ALASKA", "A M I ", 0x01072009)
{
    Name (LAPB, 0xFEE00000)
    Name (CPVD, Zero)
    Name (SMBS, 0xEFA0)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (SMIP, 0xB2)
    Name (GPBS, 0x0500)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (RCRB, 0xFED1C000)
    Name (RCRL, 0x4000)
    Name (HPTB, 0xFED00000)
    Name (HPTC, 0xFED1F404)
    Name (PM30, 0x0430)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, Zero)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (MBEC, 0xFFFF)
    Name (PEBS, 0xE0000000)
    Name (PELN, 0x10000000)
    Name (SRSI, 0xB2)
    Name (CSMI, 0x61)
    Name (SMIA, 0xB2)
    Name (SMIB, 0xB3)
    Name (OFST, 0x35)
    Name (TRST, 0x02)
    Name (TPMF, One)
    Name (TCMF, Zero)
    Name (TMF1, Zero)
    Name (TMF2, Zero)
    Name (TMF3, Zero)
    Name (LAPL, 0x00100000)
    Name (GPLN, 0x80)
    Name (SMBL, 0x40)
    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            Store (0xAA, DBG8) /* \DBG8 */
        }
        Else
        {
            Store (0xAC, DBG8) /* \DBG8 */
        }

        Store (Arg0, PICM) /* \PICM */
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR) /* \OSVR */
        }

        If (LEqual (PICM, Zero))
        {
            Store (0xAC, DBG8) /* \DBG8 */
        }

        Store (0x03, OSVR) /* \OSVR */
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Windows 2001"))
            {
                Store (0x04, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2001.1"))
            {
                Store (0x05, OSVR) /* \OSVR */
            }

            If (_OSI ("FreeBSD"))
            {
                Store (0x06, OSVR) /* \OSVR */
            }

            If (_OSI ("HP-UX"))
            {
                Store (0x07, OSVR) /* \OSVR */
            }

            If (_OSI ("OpenVMS"))
            {
                Store (0x08, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                Store (0x09, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                Store (0x0A, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                Store (0x0B, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2006"))
            {
                Store (0x0C, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                Store (0x0D, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2009"))
            {
                Store (0x0E, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2012"))
            {
                Store (0x0F, OSVR) /* \OSVR */
            }

            If (_OSI ("Windows 2013"))
            {
                Store (0x10, OSVR) /* \OSVR */
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (Zero, OSVR) /* \OSVR */
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                Store (One, OSVR) /* \OSVR */
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                Store (0x02, OSVR) /* \OSVR */
            }

            If (MCTH (_OS, "Linux"))
            {
                Store (0x03, OSVR) /* \OSVR */
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                Store (0x06, OSVR) /* \OSVR */
            }

            If (MCTH (_OS, "HP-UX"))
            {
                Store (0x07, OSVR) /* \OSVR */
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                Store (0x08, OSVR) /* \OSVR */
            }
        }

        Return (OSVR) /* \OSVR */
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0) /* \MCTH.BUF0 */
        Store (Arg1, BUF1) /* \MCTH.BUF1 */
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (ShiftLeft (SS1, One), Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (UPWP, 1, NotSerialized)
    {
        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }
    }

    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, Zero)
    Name (SS2, Zero)
    Name (SS3, Zero)
    Name (SS4, Zero)
    Name (IOST, 0x0000)
    Name (TOPM, 0x00000000)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    OperationRegion (MNVS, SystemMemory, 0x7F48DF18, 0x0047)
    Field (MNVS, ByteAcc, NoLock, Preserve)
    {
        OSYS,   32, 
        HPEA,   32, 
        SMIF,   8, 
        LCKF,   8, 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        APIC,   8, 
        MPEN,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        ACST,   8, 
        BTST,   8, 
        PWST,   8, 
        TPMP,   8, 
        TPME,   8, 
        MMOB,   32, 
        MMOL,   32, 
        MMHB,   64, 
        MMHL,   64, 
        TSGB,   32, 
        TSSZ,   32, 
        CSEN,   8, 
        C6NS,   8, 
        C6FS,   8, 
        IPEN,   8, 
        AERE,   8
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
        Processor (CPU2, 0x03, 0x00000410, 0x06) {}
        Processor (CPU3, 0x04, 0x00000410, 0x06) {}
        Processor (CPU4, 0x05, 0x00000410, 0x06) {}
        Processor (CPU5, 0x06, 0x00000410, 0x06) {}
        Processor (CPU6, 0x07, 0x00000410, 0x06) {}
        Processor (CPU7, 0x08, 0x00000410, 0x06) {}
    }

    Scope (_SB)
    {
        Name (RSKA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {6,7,10,11,12,15}
        })
        Alias (RSKA, RSKB)
        Alias (RSKA, RSKC)
        Alias (RSKA, RSKD)
        Alias (RSKA, RSKE)
        Alias (RSKA, RSKF)
        Alias (RSKA, RSKG)
        Alias (RSKA, RSKH)
        Name (PR00, Package (0x0C)
        {
            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                PCI0.LPC0.LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                PCI0.LPC0.LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                PCI0.LPC0.LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x000FFFFF, 
                Zero, 
                PCI0.LPC0.LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                PCI0.LPC0.LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                PCI0.LPC0.LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                PCI0.LPC0.LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                PCI0.LPC0.LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                PCI0.LPC0.LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x0017FFFF, 
                Zero, 
                PCI0.LPC0.LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0018FFFF, 
                Zero, 
                PCI0.LPC0.LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                PCI0.LPC0.LNKC, 
                Zero
            }
        })
        Name (AR00, Package (0x0C)
        {
            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x000FFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x0017FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0018FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x12
            }
        })
        Name (PG03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                PCI0.LPC0.LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                PCI0.LPC0.LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                PCI0.LPC0.LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                PCI0.LPC0.LNKD, 
                Zero
            }
        })
        Name (AG03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PG05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                PCI0.LPC0.LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                PCI0.LPC0.LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                PCI0.LPC0.LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                PCI0.LPC0.LNKA, 
                Zero
            }
        })
        Name (AG05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PG07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                PCI0.LPC0.LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                PCI0.LPC0.LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                PCI0.LPC0.LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                PCI0.LPC0.LNKF, 
                Zero
            }
        })
        Name (AG07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x15
            }
        })
        Name (PG09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                PCI0.LPC0.LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                PCI0.LPC0.LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                PCI0.LPC0.LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                PCI0.LPC0.LNKG, 
                Zero
            }
        })
        Name (AG09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x16
            }
        })
    }

    Scope (_SB)
    {
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00) /* \_SB_.AR00 */
                }

                Return (PR00) /* \_SB_.PR00 */
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (One, OSYS) /* \OSYS */
                If (CondRefOf (_OSI, Local0))
                {
                    If (_OSI ("Windows 2001"))
                    {
                        Store (One, OSYS) /* \OSYS */
                    }

                    If (_OSI ("Windows 2001 SP1"))
                    {
                        Store (0x02, OSYS) /* \OSYS */
                    }

                    If (_OSI ("Windows 2001 SP2"))
                    {
                        Store (0x04, OSYS) /* \OSYS */
                    }

                    If (_OSI ("Windows 2001.1"))
                    {
                        Store (0x08, OSYS) /* \OSYS */
                    }

                    If (_OSI ("Windows 2006"))
                    {
                        Store (0x10, OSYS) /* \OSYS */
                    }

                    If (_OSI ("Windows 2009"))
                    {
                        Store (0x11, OSYS) /* \OSYS */
                    }

                    If (_OSI ("Windows 2012"))
                    {
                        Store (0x12, OSYS) /* \OSYS */
                    }
                }
            }

            OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
            Field (PXCS, AnyAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                L0SE,   1, 
                Offset (0x11), 
                Offset (0x12), 
                    ,   13, 
                LASX,   1, 
                Offset (0x1A), 
                ABPX,   1, 
                    ,   2, 
                PDCX,   1, 
                    ,   2, 
                PDSX,   1, 
                Offset (0x1B), 
                Offset (0x20), 
                Offset (0x22), 
                PSPX,   1, 
                Offset (0x98), 
                    ,   30, 
                HPEX,   1, 
                PMEX,   1, 
                    ,   30, 
                HPSX,   1, 
                PMSX,   1
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If (LEqual (Arg0, ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    Store (CDW2, SUPP) /* \_SB_.PCI0.SUPP */
                    Store (CDW3, CTRL) /* \_SB_.PCI0.CTRL */
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E, CTRL) /* \_SB_.PCI0.CTRL */
                    }

                    And (CTRL, 0x1D, CTRL) /* \_SB_.PCI0.CTRL */
                    If (LEqual (AERE, Zero))
                    {
                        And (CTRL, 0x17, CTRL) /* \_SB_.PCI0.CTRL */
                    }

                    If (Not (And (CDW1, One)))
                    {
                        If (And (CTRL, One))
                        {
                            Store (Zero, HPEX) /* \_SB_.PCI0.HPEX */
                            Store (One, HPSX) /* \_SB_.PCI0.HPSX */
                        }

                        If (And (CTRL, 0x04))
                        {
                            Store (Zero, PMEX) /* \_SB_.PCI0.PMEX */
                            Store (One, PMSX) /* \_SB_.PCI0.PMSX */
                        }
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    Store (CTRL, CDW3) /* \_SB_.PCI0._OSC.CDW3 */
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    Return (Arg3)
                }
            }

            Name (PBRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xA0000000,         // Range Minimum
                    0xDFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x40000000,         // Length
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (PBRS, \_SB.PCI0._Y00._MIN, PMMN)  // _MIN: Minimum Base Address
                Store (MMOB, PMMN) /* \_SB_.PCI0._CRS.PMMN */
                CreateDWordField (PBRS, \_SB.PCI0._Y00._MAX, PMMX)  // _MAX: Maximum Base Address
                Store (MMOL, PMMX) /* \_SB_.PCI0._CRS.PMMX */
                CreateDWordField (PBRS, \_SB.PCI0._Y00._LEN, PMLN)  // _LEN: Length
                Add (Subtract (PMMX, PMMN), One, PMLN) /* \_SB_.PCI0._CRS.PMLN */
                If (LGreater (OSYS, 0x08))
                {
                    CreateQWordField (PBRS, \_SB.PCI0._Y01._MIN, P2MN)  // _MIN: Minimum Base Address
                    Store (MMHB, P2MN) /* \_SB_.PCI0._CRS.P2MN */
                    CreateQWordField (PBRS, \_SB.PCI0._Y01._MAX, P2MX)  // _MAX: Maximum Base Address
                    Store (MMHL, P2MX) /* \_SB_.PCI0._CRS.P2MX */
                    CreateQWordField (PBRS, \_SB.PCI0._Y01._LEN, P2LN)  // _LEN: Length
                    Add (Subtract (P2MX, P2MN), One, P2LN) /* \_SB_.PCI0._CRS.P2LN */
                }

                Return (PBRS) /* \_SB_.PCI0.PBRS */
            }

            Device (APIC)
            {
                Name (_HID, EisaId ("PNP0003") /* IO-APIC Interrupt Controller */)  // _HID: Hardware ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Memory32Fixed (ReadOnly,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
            }

            Device (LPC0)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                OperationRegion (IBLB, PCI_Config, 0x50, 0x04)
                Field (IBLB, AnyAcc, NoLock, Preserve)
                {
                    IBAS,   32
                }

                OperationRegion (ILBR, SystemMemory, IBAS, 0x10)
                Field (ILBR, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x06), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRA, 0x80, PIRA) /* \_SB_.PCI0.LPC0.PIRA */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRA, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRA, 0x0F), IRQW) /* \_SB_.PCI0.LPC0.LNKA._CRS.IRQW */
                        Return (BUF0) /* \_SB_.PCI0.LPC0.LNKA._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6,7,10,11,12,15}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRA) /* \_SB_.PCI0.LPC0.PIRA */
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRB, 0x80, PIRB) /* \_SB_.PCI0.LPC0.PIRB */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRB, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRB, 0x0F), IRQW) /* \_SB_.PCI0.LPC0.LNKB._CRS.IRQW */
                        Return (BUF0) /* \_SB_.PCI0.LPC0.LNKB._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6,7,10,11,12,15}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRB) /* \_SB_.PCI0.LPC0.PIRB */
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRC, 0x80, PIRC) /* \_SB_.PCI0.LPC0.PIRC */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRC, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRC, 0x0F), IRQW) /* \_SB_.PCI0.LPC0.LNKC._CRS.IRQW */
                        Return (BUF0) /* \_SB_.PCI0.LPC0.LNKC._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6,7,10,11,12,15}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRC) /* \_SB_.PCI0.LPC0.PIRC */
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x04)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRD, 0x80, PIRD) /* \_SB_.PCI0.LPC0.PIRD */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRD, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRD, 0x0F), IRQW) /* \_SB_.PCI0.LPC0.LNKD._CRS.IRQW */
                        Return (BUF0) /* \_SB_.PCI0.LPC0.LNKD._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6,7,10,11,12,15}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRD) /* \_SB_.PCI0.LPC0.PIRD */
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x05)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRE, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRE, 0x80, PIRE) /* \_SB_.PCI0.LPC0.PIRE */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRE, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRE, 0x0F), IRQW) /* \_SB_.PCI0.LPC0.LNKE._CRS.IRQW */
                        Return (BUF0) /* \_SB_.PCI0.LPC0.LNKE._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6,7,10,11,12,15}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRE) /* \_SB_.PCI0.LPC0.PIRE */
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x06)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRF, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRB, 0x80, PIRF) /* \_SB_.PCI0.LPC0.PIRF */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRF, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRF, 0x0F), IRQW) /* \_SB_.PCI0.LPC0.LNKF._CRS.IRQW */
                        Return (BUF0) /* \_SB_.PCI0.LPC0.LNKF._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6,7,10,11,12,15}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRF) /* \_SB_.PCI0.LPC0.PIRF */
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x07)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRG, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRG, 0x80, PIRG) /* \_SB_.PCI0.LPC0.PIRG */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRG, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRG, 0x0F), IRQW) /* \_SB_.PCI0.LPC0.LNKG._CRS.IRQW */
                        Return (BUF0) /* \_SB_.PCI0.LPC0.LNKG._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6,7,10,11,12,15}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRG) /* \_SB_.PCI0.LPC0.PIRG */
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x08)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRH, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRH, 0x80, PIRH) /* \_SB_.PCI0.LPC0.PIRH */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRH, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRH, 0x0F), IRQW) /* \_SB_.PCI0.LPC0.LNKH._CRS.IRQW */
                        Return (BUF0) /* \_SB_.PCI0.LPC0.LNKH._CRS.BUF0 */
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6,7,10,11,12,15}
                    })
                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRH) /* \_SB_.PCI0.LPC0.PIRH */
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x0B)
                        }

                        Return (Zero)
                    }
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (MCH)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (_UID, 0x0A)  // _UID: Unique ID
                    Name (MCHR, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y02)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MCHR, \_SB.PCI0.LPC0.MCH._Y02._BAS, TSMN)  // _BAS: Base Address
                        Store (TSGB, TSMN) /* \_SB_.PCI0.LPC0.MCH_._CRS.TSMN */
                        CreateDWordField (MCHR, \_SB.PCI0.LPC0.MCH._Y02._LEN, TSLN)  // _LEN: Length
                        Store (TSSZ, TSLN) /* \_SB_.PCI0.LPC0.MCH_._CRS.TSLN */
                        Return (MCHR) /* \_SB_.PCI0.LPC0.MCH_.MCHR */
                    }
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x31)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0xFF,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x000C0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFA00000,         // Address Base
                            0x00600000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFEE00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (IUR3)
                {
                    Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, Serialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                        })
                        Return (BUF0) /* \_SB_.PCI0.LPC0.IUR3._CRS.BUF0 */
                    }
                }

                Device (IUR4)
                {
                    Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_STA, 0, Serialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                        })
                        Return (BUF0) /* \_SB_.PCI0.LPC0.IUR4._CRS.BUF0 */
                    }
                }

                Device (IPMC)
                {
                    Name (ECFL, 0x80000000)
                    Name (OSNV, Ones)
                    Method (OSNF, 0, NotSerialized)
                    {
                        If (LNotEqual (OSNV, Ones))
                        {
                            Return (OSNV) /* \_SB_.PCI0.LPC0.IPMC.OSNV */
                        }

                        Store (One, OSNV) /* \_SB_.PCI0.LPC0.IPMC.OSNV */
                        If (CondRefOf (_OSI, Local1))
                        {
                            If (_OSI ("Windows 2008"))
                            {
                                Store (Zero, OSNV) /* \_SB_.PCI0.LPC0.IPMC.OSNV */
                            }

                            If (_OSI ("Windows 2007"))
                            {
                                Store (Zero, OSNV) /* \_SB_.PCI0.LPC0.IPMC.OSNV */
                            }

                            If (_OSI ("Windows 2006"))
                            {
                                Store (Zero, OSNV) /* \_SB_.PCI0.LPC0.IPMC.OSNV */
                            }

                            If (_OSI ("Windows 2001.1 SP1"))
                            {
                                If (And (ECFL, One))
                                {
                                    Store (Zero, OSNV) /* \_SB_.PCI0.LPC0.IPMC.OSNV */
                                }
                            }
                        }
                        Else
                        {
                            Store (One, OSNV) /* \_SB_.PCI0.LPC0.IPMC.OSNV */
                        }

                        Return (OSNV) /* \_SB_.PCI0.LPC0.IPMC.OSNV */
                    }

                    Method (_SRV, 0, NotSerialized)  // _SRV: IPMI Spec Revision
                    {
                        Return (0x0200)
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (IPEN, Zero))
                        {
                            Return (Zero)
                        }

                        Store (Zero, Local0)
                        If (LEqual (OSNF (), Zero))
                        {
                            Store (0x0F, Local0)
                        }

                        Return (Local0)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0CA8,             // Range Minimum
                            0x0CA8,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CAC,             // Range Minimum
                            0x0CAC,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Name (_HID, "IPI0001")  // _HID: Hardware ID
                    Name (_IFT, One)  // _IFT: IPMI Interface Type
                    Name (_STR, Unicode ("IPMI_KCS"))  // _STR: Description String
                    Name (_UID, Zero)  // _UID: Unique ID
                    OperationRegion (IPMS, SystemIO, 0x0CA0, 0x08)
                    OperationRegion (APPN, SystemIO, 0x0600, 0x0100)
                    Field (APPN, BufferAcc, NoLock, Preserve)
                    {
                        Offset (0x06), 
                        SPWS,   8, 
                        GPWS,   8
                    }

                    Method (SPWM, 2, Serialized)
                    {
                        Name (BUFF, Buffer (0x42) {})
                        CreateByteField (BUFF, Zero, STAT)
                        CreateByteField (BUFF, One, LENG)
                        CreateByteField (BUFF, 0x02, SPST)
                        CreateByteField (BUFF, 0x03, DPST)
                        Store (0x02, LENG) /* \_SB_.PCI0.LPC0.IPMC.SPWM.LENG */
                        Store (Arg0, SPST) /* \_SB_.PCI0.LPC0.IPMC.SPWM.SPST */
                        Store (Arg1, DPST) /* \_SB_.PCI0.LPC0.IPMC.SPWM.DPST */
                        Store (Store (BUFF, SPWS) /* \_SB_.PCI0.LPC0.IPMC.SPWS */, BUFF) /* \_SB_.PCI0.LPC0.IPMC.SPWM.BUFF */
                        CreateByteField (BUFF, 0x02, CMPC)
                        If (LAnd (LEqual (STAT, Zero), LEqual (CMPC, Zero)))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (CMPC) /* \_SB_.PCI0.LPC0.IPMC.SPWM.CMPC */
                        }
                    }

                    Method (GPWM, 0, Serialized)
                    {
                        Name (BUFF, Buffer (0x42) {})
                        Name (OBUF, Buffer (0x03) {})
                        CreateByteField (BUFF, Zero, STAT)
                        CreateByteField (BUFF, One, LENG)
                        Store (Zero, LENG) /* \_SB_.PCI0.LPC0.IPMC.GPWM.LENG */
                        Store (Store (BUFF, GPWS) /* \_SB_.PCI0.LPC0.IPMC.GPWS */, BUFF) /* \_SB_.PCI0.LPC0.IPMC.GPWM.BUFF */
                        CreateByteField (BUFF, 0x02, CMPC)
                        CreateByteField (BUFF, 0x03, SPST)
                        CreateByteField (BUFF, 0x04, DPST)
                        CreateByteField (OBUF, Zero, COMP)
                        CreateByteField (OBUF, One, SYSP)
                        CreateByteField (OBUF, 0x02, DEVP)
                        Store (CMPC, COMP) /* \_SB_.PCI0.LPC0.IPMC.GPWM.COMP */
                        Store (SPST, SYSP) /* \_SB_.PCI0.LPC0.IPMC.GPWM.SYSP */
                        Store (DEVP, DPST) /* \_SB_.PCI0.LPC0.IPMC.GPWM.DPST */
                        If (LNotEqual (STAT, Zero))
                        {
                            Store (0xCE, COMP) /* \_SB_.PCI0.LPC0.IPMC.GPWM.COMP */
                        }

                        Return (OBUF) /* \_SB_.PCI0.LPC0.IPMC.GPWM.OBUF */
                    }
                }

                Method (UXDV, 1, NotSerialized)
                {
                    Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                    Store (0xFF, Local0)
                    Store (Add (Arg0, Zero), _T_0) /* \_SB_.PCI0.LPC0.UXDV._T_0 */
                    If (LEqual (_T_0, 0x03F8))
                    {
                        Store (Zero, Local0)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02F8))
                        {
                            Store (One, Local0)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x0220))
                            {
                                Store (0x02, Local0)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x0228))
                                {
                                    Store (0x03, Local0)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x0238))
                                    {
                                        Store (0x04, Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x02E8))
                                        {
                                            Store (0x05, Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0338))
                                            {
                                                Store (0x06, Local0)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x03E8))
                                                {
                                                    Store (0x07, Local0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Return (Local0)
                }

                Method (RRIO, 4, NotSerialized)
                {
                }

                Method (RDMA, 3, NotSerialized)
                {
                }

                OperationRegion (SMCF, SystemIO, 0x2E, 0x02)
                Field (SMCF, ByteAcc, NoLock, Preserve)
                {
                    INXF,   8, 
                    DATF,   8
                }

                IndexField (INXF, DATF, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x07), 
                    LDNF,   8, 
                    Offset (0x20), 
                    DIDF,   8, 
                    Offset (0x30), 
                    ACTF,   8, 
                    Offset (0x60), 
                    AHFF,   8, 
                    ALFF,   8, 
                    Offset (0x70), 
                    INTF,   8, 
                    INSF,   8, 
                    Offset (0x74), 
                    DMCF,   8
                }

                Method (ENFF, 1, NotSerialized)
                {
                    Store (0xA5, INXF) /* \_SB_.PCI0.LPC0.INXF */
                    Store (0xA5, INXF) /* \_SB_.PCI0.LPC0.INXF */
                    Store (Arg0, LDNF) /* \_SB_.PCI0.LPC0.LDNF */
                }

                Method (EXFF, 0, NotSerialized)
                {
                    Store (0xAA, INXF) /* \_SB_.PCI0.LPC0.INXF */
                }

                Method (NOSL, 0, NotSerialized)
                {
                    If (IPEN)
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (One)
                    }
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (NOSL ())
                        {
                            Return (Zero)
                        }

                        ENFF (0x02)
                        If (ACTF)
                        {
                            EXFF ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (AHFF, ALFF))
                            {
                                EXFF ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFF ()
                                Return (Zero)
                            }
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ENFF (0x02)
                        Store (Zero, ACTF) /* \_SB_.PCI0.LPC0.ACTF */
                        EXFF ()
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y03)
                            IRQNoFlags (_Y04)
                                {4}
                        })
                        CreateByteField (BUF0, \_SB.PCI0.LPC0.UAR1._CRS._Y03._MIN, IOLO)  // _MIN: Minimum Base Address
                        CreateByteField (BUF0, 0x03, IOHI)
                        CreateByteField (BUF0, \_SB.PCI0.LPC0.UAR1._CRS._Y03._MAX, IORL)  // _MAX: Maximum Base Address
                        CreateByteField (BUF0, 0x05, IORH)
                        CreateWordField (BUF0, \_SB.PCI0.LPC0.UAR1._CRS._Y04._INT, IRQL)  // _INT: Interrupts
                        ENFF (0x02)
                        Store (ALFF, IOLO) /* \_SB_.PCI0.LPC0.UAR1._CRS.IOLO */
                        Store (ALFF, IORL) /* \_SB_.PCI0.LPC0.UAR1._CRS.IORL */
                        Store (AHFF, IOHI) /* \_SB_.PCI0.LPC0.UAR1._CRS.IOHI */
                        Store (AHFF, IORH) /* \_SB_.PCI0.LPC0.UAR1._CRS.IORH */
                        Store (One, Local0)
                        ShiftLeft (Local0, INTF, IRQL) /* \_SB_.PCI0.LPC0.UAR1._CRS.IRQL */
                        EXFF ()
                        Return (BUF0) /* \_SB_.PCI0.LPC0.UAR1._CRS.BUF0 */
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x02)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Return (BUF0) /* \_SB_.PCI0.LPC0.UAR1._PRS.BUF0 */
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x09, IRQL)
                        ENFF (0x02)
                        Store (IOLO, ALFF) /* \_SB_.PCI0.LPC0.ALFF */
                        Store (IOHI, AHFF) /* \_SB_.PCI0.LPC0.AHFF */
                        FindSetRightBit (IRQL, INTF) /* \_SB_.PCI0.LPC0.INTF */
                        If (LNotEqual (IRQL, Zero))
                        {
                            Decrement (INTF)
                        }

                        Store (One, ACTF) /* \_SB_.PCI0.LPC0.ACTF */
                        EXFF ()
                    }
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AG03) /* \_SB_.AG03 */
                    }

                    Return (PG03) /* \_SB_.PG03 */
                }

                Device (D004)
                {
                    Name (_ADR, 0xFFFF)  // _ADR: Address
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AG05) /* \_SB_.AG05 */
                    }

                    Return (PG05) /* \_SB_.PG05 */
                }

                Device (D006)
                {
                    Name (_ADR, 0xFFFF)  // _ADR: Address
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AG07) /* \_SB_.AG07 */
                    }

                    Return (PG07) /* \_SB_.PG07 */
                }

                Device (D008)
                {
                    Name (_ADR, 0xFFFF)  // _ADR: Address
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AG09) /* \_SB_.AG09 */
                    }

                    Return (PG09) /* \_SB_.PG09 */
                }

                Device (D00A)
                {
                    Name (_ADR, 0xFFFF)  // _ADR: Address
                }
            }

            Device (NCPM)
            {
                Name (_ADR, 0x000B0000)  // _ADR: Address
            }

            Device (D00C)
            {
                Name (_ADR, 0x000E0000)  // _ADR: Address
            }

            Device (D00D)
            {
                Name (_ADR, 0x000F0000)  // _ADR: Address
            }

            Device (SMB2)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
            }

            Device (D00F)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
            }

            Device (D010)
            {
                Name (_ADR, 0x00140001)  // _ADR: Address
            }

            Device (D011)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
            }

            Device (EHC1)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (SAT2)
            {
                Name (_ADR, 0x00170000)  // _ADR: Address
            }

            Device (SAT3)
            {
                Name (_ADR, 0x00180000)  // _ADR: Address
            }

            Device (SMB1)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
            }
        }
    }

    Scope (_GPE)
    {
        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
            Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.EHC1, 0x02) // Device Wake
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (Arg0)
        {
            Store (Arg0, DBG8) /* \DBG8 */
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        UPWP (Arg0)
        Return (WAKP) /* \WAKP */
    }

    Scope (\)
    {
        Name (PCAP, 0x00010000)
        Name (WHEN, Zero)
    }

    Scope (_SB)
    {
        OperationRegion (GSTS, SystemIO, 0x1822, One)
        Field (GSTS, ByteAcc, NoLock, Preserve)
        {
            GP0,    1, 
            Offset (0x01)
        }

        OperationRegion (GINV, SystemIO, 0x082C, One)
        Field (GINV, ByteAcc, NoLock, Preserve)
        {
            GPIN,   1, 
            Offset (0x01)
        }

        OperationRegion (DBG0, SystemIO, 0x80, 0x02)
        Field (DBG0, ByteAcc, NoLock, Preserve)
        {
            IO80,   8, 
            IO81,   8
        }

        OperationRegion (IOB3, SystemIO, 0xB2, 0x02)
        Field (IOB3, ByteAcc, NoLock, Preserve)
        {
            SMIC,   8, 
            SMIS,   8
        }

        Name (OSVR, Ones)
        Method (OSFL, 0, NotSerialized)
        {
            If (LNotEqual (OSVR, Ones))
            {
                Return (OSVR) /* \_SB_.OSVR */
            }

            If (LEqual (PICM, Zero))
            {
                Store (0xAC, IO80) /* \_SB_.IO80 */
            }

            Store (One, OSVR) /* \_SB_.OSVR */
            If (CondRefOf (_OSI, Local0))
            {
                If (_OSI ("Windows 2009"))
                {
                    Store (0x0C, OSVR) /* \_SB_.OSVR */
                }
                Else
                {
                    If (_OSI ("Windows 2008"))
                    {
                        Store (0x0A, OSVR) /* \_SB_.OSVR */
                    }
                    Else
                    {
                        If (_OSI ("Windows 2007"))
                        {
                            Store (0x0A, OSVR) /* \_SB_.OSVR */
                        }
                        Else
                        {
                            If (_OSI ("Windows 2006"))
                            {
                                Store (0x0B, OSVR) /* \_SB_.OSVR */
                                If (_OSI ("Windows 2006.1"))
                                {
                                    Store (0x0A, OSVR) /* \_SB_.OSVR */
                                }
                            }
                            Else
                            {
                                If (_OSI ("Windows 2001"))
                                {
                                    Store (0x04, OSVR) /* \_SB_.OSVR */
                                }
                                Else
                                {
                                    If (_OSI ("Windows 2001.1"))
                                    {
                                        Store (0x05, OSVR) /* \_SB_.OSVR */
                                    }
                                    Else
                                    {
                                        If (_OSI ("FreeBSD"))
                                        {
                                            Store (0x06, OSVR) /* \_SB_.OSVR */
                                        }
                                        Else
                                        {
                                            If (_OSI ("HP-UX"))
                                            {
                                                Store (0x07, OSVR) /* \_SB_.OSVR */
                                            }
                                            Else
                                            {
                                                If (_OSI ("OpenVMS"))
                                                {
                                                    Store (0x08, OSVR) /* \_SB_.OSVR */
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Return (OSVR) /* \_SB_.OSVR */
        }

        OperationRegion (CMOS, SystemIO, 0x70, 0x04)
        Field (CMOS, ByteAcc, NoLock, Preserve)
        {
            IDX0,   7, 
            Offset (0x01), 
            DAT0,   8, 
            IDX1,   7, 
            Offset (0x03), 
            DAT1,   8
        }

        IndexField (IDX1, DAT1, ByteAcc, NoLock, Preserve)
        {
            Offset (0x48), 
            OSF1,   32, 
            OSF2,   32
        }

        Method (SWWE, 1, NotSerialized)
        {
            Store (Zero, SMIS) /* \_SB_.SMIS */
            Store (Arg0, SMIC) /* \_SB_.SMIC */
        }

        Device (WERR)
        {
            Name (_HID, EisaId ("PNP0C33"))  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (OSFL (), 0x0A))
                {
                    If (And (PCAP, 0x00010000))
                    {
                        Return (0x0F)
                    }
                }

                If (LEqual (OSFL (), 0x0C))
                {
                    If (And (PCAP, 0x00010000))
                    {
                        Return (0x0F)
                    }
                }

                Return (Zero)
            }
        }

        Method (\_GPE._L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (0xBB, \_SB.IO80)
            Notify (\_SB.WERR, 0x80) // Status Change
        }

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            CreateDWordField (Arg3, Zero, CPB1)
            CreateDWordField (Arg3, 0x04, CPB2)
            If (LEqual (Arg0, ToUUID ("ed855e0c-6c90-47bf-a62a-26de0fc5ad5c")))
            {
                If (LEqual (OSFL (), 0x0C))
                {
                    If (And (PCAP, 0x00010000))
                    {
                        SWWE (0x9E)
                        Store (One, WHEN) /* \WHEN */
                        Return (Arg3)
                    }
                }
            }

            Store (Zero, WHEN) /* \WHEN */
            Or (CPB2, 0x04, CPB2) /* \_SB_._OSC.CPB2 */
            Return (Arg3)
        }
    }

    Device (_SB.TPM)
    {
        Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
        {
            If (TCMF)
            {
                Return (0x01013469)
            }
            Else
            {
                Return (0x310CD041)
            }
        }

        Name (_STR, Unicode ("TPM 1.2 Device"))  // _STR: Description String
        Name (_UID, One)  // _UID: Unique ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            DWordMemory (ResourceConsumer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                0x00000000,         // Granularity
                0xFED40000,         // Range Minimum
                0xFED44FFF,         // Range Maximum
                0x00000000,         // Translation Offset
                0x00005000,         // Length
                ,, , AddressRangeMemory, TypeStatic)
        })
        OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x5000)
        Field (TMMB, ByteAcc, Lock, Preserve)
        {
            ACCS,   8, 
            Offset (0x18), 
            TSTA,   8, 
            TBCA,   8, 
            Offset (0xF00), 
            TVID,   16, 
            TDID,   16
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (TPMF)
            {
                Return (0x0F)
            }

            Return (Zero)
        }
    }

    Scope (_SB.TPM)
    {
        OperationRegion (ASMI, SystemIO, SMIA, One)
        Field (ASMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8
        }

        OperationRegion (BSMI, SystemIO, SMIB, One)
        Field (BSMI, ByteAcc, NoLock, Preserve)
        {
            DAT,    8
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            If (LEqual (Arg0, ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */))
            {
                Store (ToInteger (Arg2), _T_0) /* \_SB_.TPM_._DSM._T_0 */
                If (LEqual (_T_0, Zero))
                {
                    Return (Buffer (0x02)
                    {
                         0xFF, 0x01                                       /* .. */
                    })
                }
                Else
                {
                    If (LEqual (_T_0, One))
                    {
                        Return ("1.2")
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF2) /* \TMF2 */
                            Store (0x12, TMF1) /* \TMF1 */
                            Store (TMF1, DAT) /* \_SB_.TPM_.DAT_ */
                            Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Store (TMF2, DAT) /* \_SB_.TPM_.DAT_ */
                            Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            If (LEqual (DAT, 0xF1))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Name (PPI1, Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                                Store (0x11, DAT) /* \_SB_.TPM_.DAT_ */
                                Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                If (LEqual (DAT, 0xFF))
                                {
                                    Return (One)
                                }

                                Store (DAT, Index (PPI1, One))
                                Return (PPI1) /* \_SB_.TPM_._DSM.PPI1 */
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Return (TRST) /* \TRST */
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Name (PPI2, Package (0x03)
                                        {
                                            Zero, 
                                            Zero, 
                                            Zero
                                        })
                                        Store (0x21, DAT) /* \_SB_.TPM_.DAT_ */
                                        Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                        Store (DAT, Index (PPI2, One))
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        Store (0x31, DAT) /* \_SB_.TPM_.DAT_ */
                                        Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        If (LEqual (DAT, 0xF0))
                                        {
                                            Store (0x51, DAT) /* \_SB_.TPM_.DAT_ */
                                            Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                            If (LEqual (DAT, 0xFF))
                                            {
                                                Store (0xFFFFFFF0, Index (PPI2, 0x02))
                                                Return (PPI2) /* \_SB_.TPM_._DSM.PPI2 */
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (DAT, 0xF1))
                                            {
                                                Store (0x51, DAT) /* \_SB_.TPM_.DAT_ */
                                                Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                                If (LEqual (DAT, 0xFF))
                                                {
                                                    Store (0xFFFFFFF1, Index (PPI2, 0x02))
                                                    Return (PPI2) /* \_SB_.TPM_._DSM.PPI2 */
                                                }
                                            }
                                            Else
                                            {
                                                Store (DAT, Index (PPI2, 0x02))
                                            }
                                        }

                                        Return (PPI2) /* \_SB_.TPM_._DSM.PPI2 */
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x06))
                                        {
                                            Return (0x03)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x07))
                                            {
                                                ToInteger (DerefOf (Index (Arg3, Zero)), TMF2) /* \TMF2 */
                                                Store (0x12, TMF1) /* \TMF1 */
                                                Store (TMF1, DAT) /* \_SB_.TPM_.DAT_ */
                                                Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                                If (LEqual (DAT, 0xFF))
                                                {
                                                    Return (0x02)
                                                }

                                                Store (TMF2, DAT) /* \_SB_.TPM_.DAT_ */
                                                Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                                If (LEqual (DAT, 0xFF))
                                                {
                                                    Return (0x02)
                                                }

                                                If (LEqual (DAT, 0xF1))
                                                {
                                                    Return (One)
                                                }

                                                Return (Zero)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x08))
                                                {
                                                    ToInteger (DerefOf (Index (Arg3, Zero)), TMF2) /* \TMF2 */
                                                    Store (0x43, TMF1) /* \TMF1 */
                                                    Store (TMF1, DAT) /* \_SB_.TPM_.DAT_ */
                                                    Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                                    Store (TMF2, DAT) /* \_SB_.TPM_.DAT_ */
                                                    Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                                                    Return (DAT) /* \_SB_.TPM_.DAT_ */
                                                }
                                                Else
                                                {
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                If (LEqual (Arg0, ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d")))
                {
                    Store (ToInteger (Arg2), _T_1) /* \_SB_.TPM_._DSM._T_1 */
                    If (LEqual (_T_1, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }
                    Else
                    {
                        If (LEqual (_T_1, One))
                        {
                            Store (0x22, TMF1) /* \TMF1 */
                            Store (TMF1, DAT) /* \_SB_.TPM_.DAT_ */
                            Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF1) /* \TMF1 */
                            Store (TMF1, DAT) /* \_SB_.TPM_.DAT_ */
                            Store (OFST, INQ) /* \_SB_.TPM_.INQ_ */
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                        }
                    }
                }
            }

            Return (Buffer (One)
            {
                 0x00                                             /* . */
            })
        }
    }

    #include "as6712.asli"
}
