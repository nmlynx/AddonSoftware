AddonSoftware readme.txt: Using Triggers for Hybrid Installations

Barista triggers currently defined for Payroll:

The trigger definition (.trigger) and source (.src) files in the <install>/aon/util/triggers/ directories are usable with a standard install of Barista/Addon coupled with Addon Version 6 in a hybrid environment. 

A given trigger definition may specify more than one trigger for a database file, so you will find one or more files in the src directory corresponding to each trigger definition file.

The .trigger file(s) should be placed in the same directory as the Barista data files (<install>/aon/data), and the .src file(s) should be placed in a src directory directly underneath the Barista data directory.  

glm-01 GLM_ACCT Account Master
	These 2 triggers will ensure that the v6 version of the file will maintain synchronicity with the Barista file so that Account lookups in v6 will display exactly what the Barista file contains.
pre-02 PRE_DAYTIME Daily Time Entry (used for Shop Floor integration)
	This file is written to during the Shop Floor Time Sheet Register Update. Instead of writing to the Barista version, it will write to the version 6 data file for use with the version 6 payroll system.

See the readme.txt file in the util/v6triggers directory for more detail

Enterprise Manager settings:
Make sure to add both the v6 Addon data directory and the Barista/Addon data directory in the Triggers Configuration.
The Enterprise Manager "Triggers" setting includes a Configuration tab. Set the
"Config File:" and "Working Directory:" to reflect the current environment.
For example:
Config File: <install>/barista/sys/config/enu/barista.cfg
Working Directory: <install>/barista