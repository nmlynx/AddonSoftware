BASIS currently uses three triggers in their own Addon hybrid environment. The trigger source code provided here is for reference/tutorial purposes. They are not intended for general use in other environments.

glm-01.trigger.aw.src - is set as an after write trigger on the glm-01 table in Barista Addon. It's purpose is to replicate any changes to glm-01 to GLM-01 in our 6.1 installation. Since our GL is maintained in Barista Addon we need changes to the glm-01 to go to 6.1 GLM-01 so that they are available for use in GL distribution from our 6.1 modules.

GLT-04.trigger.iw.src - is set as an instead of write trigger on the GLT-04 table in 6.1 Addon. It's purpose is to move data into the glt-04 (daily detail file) in Barista Addon. It supports parallel operation, writes go to both tables. The parallel mode was useful for us in proving the concept and once done can be removed causing writes to be done only to the gl4-04.

GLT-05.trigger.iw.src - is set as an instead of write trigger on the GLT-05 table in 6.1 Addon. It's purpose is intercept writes to the GLT-05 table and dump them since there is no glt-05 in Barista Addon. It also supports parallel operation allowing the write to proceed to the GLT-05 table for use in the proof of concept phase. Once complete it can be removed which then simply discards the write to GLT-05.

Notes:

There is an outstanding BBj issue with Configuration (Bugzilla #17369). When triggers are set up in EM there is one config file for all triggers. This can be a problem for a site that has triggers for multiple systems. In the case of Barista Addon running along side another non-Barista application that also has triggers and it's own config. In this case you may need to set some STBLs and/or specify pathnames directly in the trigger source.

 

