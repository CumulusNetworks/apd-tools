import os
import os.path
import shutil

import psutil
import nose.tools

# perform an acpidump as root
def test_acpidump(dir_str='./acpi_dump'):

    cur_dir = os.path.abspath(os.curdir)

    if os.path.exists(dir_str):
        # if file, remove it
        if os.path.isfile(dir_str):
            os.remove(test_dir)
        if os.path.isdir(dir_str):
            shutil.rmtree(dir_str)

    os.makedirs(dir_str)
    os.chdir(dir_str)
    proc = psutil.Popen('sudo acpidump -o acpi.bin', shell=True)
    proc.wait()

    msg = 'Was not able to dump ACPI tables'
    nose.tools.eq_(os.path.isfile('acpi.bin'), True, msg)

    stat = os.stat('acpi.bin')
    msg = 'ACPI Tables File is 0 length'
    nose.tools.eq_(stat.st_size == 0, False, msg)

    os.chdir(cur_dir)


# perform an acpixtract <FILE>, extracts files
def test_acpixtract(dir_str='./acpi_dump'):

    cur_dir = os.path.abspath(os.curdir)
    if os.path.exists(dir_str) is False:
        msg = '{0} is not created'.format(dir_str)
        nose.tools.eq_(True, True, msg)

    os.chdir(dir_str)
    proc = psutil.Popen('acpixtract acpi.bin', shell=True)
    proc.wait()

    msg = 'Was not able to extract DSDT'
    nose.tools.eq_(os.path.isfile('dsdt.dat'), True, msg)

    stat = os.stat('dsdt.dat')
    msg = 'ACPI DSDT is 0 length'
    nose.tools.eq_(stat.st_size == 0, False, msg)
    os.chdir(cur_dir)


# perform an iasl decompile, -d dsdt.dat ssdt*.dat
def test_iasl_decompile(dir_str='./acpi_dump'):

    cur_dir = os.path.abspath(os.curdir)
    if os.path.exists(dir_str) is False:
        msg = '{0} is not created'.format(dir_str)
        nose.tools.eq_(True, True, msg)

    os.chdir(dir_str)
    proc = psutil.Popen('iasl -d dsdt.dat ssdt*.dat', shell=True)
    proc.wait()

    msg = 'Was not able to Disassmble DSDT'
    nose.tools.eq_(os.path.isfile('dsdt.dsl'), True, msg)

    stat = os.stat('dsdt.dsl')
    msg = 'ACPI DSDT Disassembly is 0 length'
    nose.tools.eq_(stat.st_size == 0, False, msg)
    os.chdir(cur_dir)

