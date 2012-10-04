AddonSoftware readme.txt: Using Triggers for Hybrid Installations

+Version 6 triggers currently defined for Payroll:

The trigger definition (.trigger) and source (.src) files in the <install>/apps/aon/util/v6triggers/ directories are usable with a standard install of Barista/Addon coupled with Addon Version 6 in a hybrid environment. 

A given trigger definition may specify more than one trigger for a database file, so you will find one or more files in the src directory corresponding to each trigger definition file. 

The .trigger file(s) should be placed in the same directory as the version 6 data files, and the .src file(s) should be placed in a src directory directly underneath the version 6 data directory.  

APM-11 Bank Reconciliation
	These 2 triggers will maintain the Barista version of the Bank Rec file instead of maintaining the v6 version.
GLM-03 Journal ID Codes
	This trigger will read from the Barista version of the file so that the version 6 file will no longer need to be maintained.
GLT-04 Daily Transaction Detail
	This trigger will write to the Barista version of the file instead of writing to the v6 file.
GLT-05 Transaction Detail Sort
	This trigger will write to the Barista version of the file instead of writing to the v6 file.
PRM-01 Payroll Master File (used for Shop Floor integration)
	These 2 triggers will ensure that the Barista version of the file will maintain synchronicity with the v6 file so that Employee lookups in Barista SF Time Sheet Entry will display exactly what the v6 file contains.
PRM-02 Payroll Pay Rate File (used for Shop Floor integration)
	These 2 triggers will ensure that the Barista version of the file will maintain synchronicity with the v6 file so that Pay rates and hours in Barista SF Time Sheet Entry will use exactly what the v6 file contains.
PRM-10 Pay Codes and Title Codes (used for Shop Floor integration)
	These 2 triggers will ensure that the Barista version of the files will maintain synchronicity with the v6 file so that Pay Code and Title Code lookups in Barista will display exactly what the v6 file contains.
PRT-01 Payroll Earnings History File (used for Shop Floor integration)
	These 2 triggers will ensure that the Barista version of the file will maintain synchronicity with the v6 file so that Pay Codes in Barista will validate properly against what the v6 file contains.
SYM-04 System Master
	This trigger reads from the Barista Modules table instead of the v6 System Master table.
SYM-06 Firm Master
	This trigger reads from the Barista Firms table instead of the v6 Firm Master table.
SYS-01 System Control
	These triggers attempt to read and write to/from the parameter tables in Barista. If successful, the read overrides the data found in the v6 table.

+Barista/Addon triggers currently defined for Payroll:

In addition, there are two triggers that should be placed in the Barista/Addon database.  The .trigger files should be placed in the same directory as the corresponding Barista/Addon data files, and the related .src files should be placed in a src directory directly underneath the Barista/Addon data directory.

glm-01 Account Master
pre-02 Daily Time Entry

See the readme.txt file in the util/triggers directory for more detail on these 2 files.

Enterprise Manager settings:
Make sure to add both the v6 Addon data directory and the Barista/Addon data directory in the Triggers Configuration.
The Enterprise Manager "Triggers" setting includes a Configuration tab. Set the
"Config File:" and "Working Directory:" to reflect the current environment.
For example:
Config File: <install>/barista/sys/config/enu/barista.cfg
Working Directory: <install>/barista

