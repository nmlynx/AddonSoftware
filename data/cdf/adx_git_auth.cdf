[[ADX_GIT_AUTH.BWRI]]
use ::ado_GitRepoInterface.aon::GitRepoInterface

REM Verify the Git site to make sure it's a copy of the official repo.

REM Get our values from the callpoint fields 
authId$=callpoint!.getColumnData("ADX_GIT_AUTH.GIT_AUTH_ID")
password$=callpoint!.getColumnData("ADX_GIT_AUTH.PASSWORD")
sshKeyFile$=callpoint!.getColumnData("ADX_GIT_AUTH.SSH_KEY_FILE")
sshPassword$=callpoint!.getColumnData("ADX_GIT_AUTH.SSH_PASSWORD")
authToken$=callpoint!.getColumnData("ADX_GIT_AUTH.TOKEN")
url$=callpoint!.getColumnData("ADX_GIT_AUTH.URL")
username$=callpoint!.getColumnData("ADX_GIT_AUTH.USERNAME")

REM Instantiate the Git Repo Interface and perform the site check

git!=new GitRepoInterface(authID$, url$, username$, password$, sshKeyFile$, sshPassword$, authToken$)
official=git!.isDescendantOfOfficialRepo()

REM Skip the write and show an error message if the site check did not pass
if !official then
	msg_id$="ADX_INVALID_GIT_REPO"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif 



