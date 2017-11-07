# Group-Policy-Hardening
Two Group Policy Objects to apply to your domain in order to disable dangerous AD defaults that are often used to escalate privileges.

Security_Hardening_GPOs.zip file includes two exported GPOs. Extract it.

To import, launch Group Policy Management Console (gpmc.msc).  Create a blank new Group Policy Object, then right click on it and choose Import Settings, select the extracted folder.
  
Security Hardening I should be applied to all systems and allowed ample time to bake in before applying Security Hardening II, since I is a prerequisite.  BE CAREFUL, I enables SMB Signing, and II makes SMB signing a requirement.  If I is not applied before II, group policy will fail to apply.

As always, settings may cause issues with legacy and third party operating systems.  Please test!

GPOs were created by Kevin McBride (@tallmega)

The startup vbscript that disables NETBIOS Name Service was originally written by Gregory Strike.
