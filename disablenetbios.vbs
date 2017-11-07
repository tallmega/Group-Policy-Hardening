'  Title:      Configure NetBIOS over TCP/IP
'   Date:      2/25/2013
'Updated:
' Author:      Gregory Strike
'    URL:      http://www.gregorystrike.com/2013/02/25/configure-netbios-over-tcpip-group-policy.html
'
'Purpose:      The following script will itterate through all NICs on a computer
'              to configuure NetBIOS over TCP/IP.  It finds the NICs listed under:
'              HKLM\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces
'
'              For each NIC under the key, it sets the NetbiosOptions value to one
'              of the below.  (Be sure to uncomment the setting you desire.)
'
'              0 - Default: Use DHCP setting from the DHCP Server
'              1 - Enable NetBIOS over TCP/IP
'              2 - Disable NetBIOS over TCP/IP
'
'Requirements: Administrative Privileges
const HKEY_LOCAL_MACHINE = &H80000002
strComputer = "."
Set ObjWMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")
'Set the path to the Network Interfaces
strKeyPath = "SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces"
'Get all the known interfaces
ObjWMI.EnumKey HKEY_LOCAL_MACHINE, strKeyPath, arrSubKeys
'If there was a problem getting strKeyPath, exit the script before throwing an error.
If IsNull(arrSubKeys) Then WScript.Quit
'WScript.Echo Now() & " - Searching for Network Adapaters."
'Loop through all Network Interface Cards and disable NetBIOS over TCP/IP
For Each Adapter In arrSubKeys
	WScript.Echo Now() & " - Disabling NetBIOS over TCP/IP on '" & Adapter & "'"
	'Default: Use DHCP setting from the DHCP Server
	'objWMI.SetDWORDValue HKEY_LOCAL_MACHINE, strKeyPath & "\" & Adapter, "NetbiosOptions", 0
	'Enable NetBIOS over TCP/IP
	'objWMI.SetDWORDValue HKEY_LOCAL_MACHINE, strKeyPath & "\" & Adapter, "NetbiosOptions", 1
	'Disable NetBIOS over TCP/IP
	objWMI.SetDWORDValue HKEY_LOCAL_MACHINE, strKeyPath & "\" & Adapter, "NetbiosOptions", 2
Next
'WScript.Echo Now() & " - Completed."