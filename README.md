## Provisioning Services 7.x vDisk version Export and Import Script

Keep PVS vDisk versioning consistent across multiple PVS sites and additional PVS farms

**PVSReplicate.ps1**

**PLEASE USE WITH CAUTION. THIS WILL OVERWRITE SETTINGS ON IMPORT**

### Requirements

- PC\Server with Citrix PVS Console 7.7 or greater installed
- Admin access to PVS farm
- PowerShell v3 or greater
- PassThru is used for all PVS server authentication
- vDisk store path is the same across all servers (eg E:\vdisks)

### PS Gallery
If running PowerShell version 5 or above you can install via [Microsoft PowerShell Gallery](https://www.powershellgallery.com/)

#### Install
```
Install-Script -Name PVSReplicate -Scope currentuser
```
### Inspect
```
Save-Script -Name PVSReplicate -Path <path>
```
#### Update
```
Update-Script PVSReplicate
```

### Changelog

- 02-28-2017: Initial release
- 05-09-2017: Added "Site" option to only replicate specific site.
- 07-27-2017: Added 'JustAdmin' switch to only replicate to single server
- 07-27-2017: Added 'disk' argument to copy specific disk
- 08-28-17: Updated for PS gallery

### PVS Versions Tested

- 7.13

### What is performed?

- vDisk information is copied to all farm servers utilizing robocopy
- Imports missing vDisks
- vDisk versions are imported to all or specific sites
- vDisk override versions set to all or specific sites
- Remove any unneeded vDisk versions

### What this doesn't do?

- Delete non-used vDisks

### Usage

Copies and imports disks and versions to all PVS farm servers accessible via localhost and uses the vDisk store at "E:\teststore" for robocopy.

`.\PVSReplicate.ps1 -StorePath "E:\teststore"`

Copies and imports disks and versions to all PVS farm servers accessible via localhost, PVSFARM01, PVSFARM02 and uses the vDisk store at "E:\teststore" for robocopy.

`.\PVSReplicate.ps1 -StorePath "E:\teststore" -PVSServers "PVSFARM01","PVSFARM02"`

Copies and imports disk versions to all PVS farm servers accessible via localhost, PVSFARM01, PVSFARM02 and uses the vDisk store at "E:\teststore" and "E:\teststore2" for robocopy.

`.\PVSReplicate.ps1 -StorePath "E:\teststore","E:\teststore2" -PVSServers "PVSFARM01","PVSFARM02"`

Copies and imports disks and versions to all PVS farm servers in 'General' site accessible via localhost, PVSFARM01, PVSFARM02 and uses the vDisk store at "E:\teststore" for robocopy.

`.\PVSReplicate.ps1 -StorePath "E:\teststore" -PVSServers "PVSFARM01","PVSFARM02" -Site "General"`
   
Imports disks and versions on all PVS farm servers accessible via localhost for each server. Does not perform any robocopy

`.\PVSReplicate.ps1 -nocopy`

Copies and imports "MYDISK" ONLY to all servers in "MYSITE"

`.\PVSReplicate.ps1 -StorePath "E:\teststore" -Site "MySite" -Disk "MYDISK"`

Copies and imports disks and versions from MYSITE to PVSFARM01 server ONLY. (Images must be replicated from PVSFARM01)   

`.\PVSReplicate.ps1 -StorePath "E:\teststore" -Site "MySite" -PVSServers "PVSFARM01" -JUSTADMIN`
   
