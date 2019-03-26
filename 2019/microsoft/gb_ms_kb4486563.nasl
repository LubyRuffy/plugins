# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) the respective author(s)
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814686");
  script_version("$Revision: 14113 $");
  script_cve_id("CVE-2019-0595", "CVE-2019-0596", "CVE-2019-0597", "CVE-2019-0598",
                "CVE-2019-0599", "CVE-2019-0600", "CVE-2019-0601", "CVE-2019-0602",
                "CVE-2019-0606", "CVE-2019-0615", "CVE-2019-0616", "CVE-2019-0618",
                "CVE-2019-0619", "CVE-2019-0621", "CVE-2019-0623", "CVE-2019-0625",
                "CVE-2019-0626", "CVE-2019-0628", "CVE-2019-0630", "CVE-2019-0635",
                "CVE-2019-0636", "CVE-2019-0654", "CVE-2019-0660", "CVE-2019-0661",
                "CVE-2019-0662", "CVE-2019-0664", "CVE-2019-0676");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-03-12 11:34:46 +0100 (Tue, 12 Mar 2019) $");
  script_tag(name:"creation_date", value:"2019-02-13 10:33:26 +0530 (Wed, 13 Feb 2019)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4486563)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4486563");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the
  target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - Windows Jet Database Engine improperly handles objects in memory.

  - Human Interface Devices (HID) component improperly handles objects in memory.

  - Windows GDI component improperly discloses the contents of its memory.

  - Internet Explorer improperly accesses objects in memory.

  - Windows kernel improperly handles objects in memory.

  - Win32k component fails to properly handle objects in memory.

  - DHCP servers fails to properly handle network packets.

  - Microsoft Server Message Block 2.0 (SMBv2) server improperly handles
    specially crafted requests.

  - Windows Hyper-V on a host operating system fails to properly validate input
    from an authenticated user on a guest operating system.

  - Microsoft browsers improperly handles specific redirects.

  - Internet Explorer improperly handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  an attacker to execute arbitrary code on a victim system, obtain information
  to further compromise the user's system, gain elevated privileges and
  conduct spoofing attacks.");

  script_tag(name:"affected", value:"Windows 7 for 32-bit/x64 Systems Service Pack 1

  Windows Server 2008 R2 for x64-based Systems Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4486563");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) <= 0){
  exit(0);
}

dllPath = smb_get_system32root();
if(!dllPath ){
  exit(0);
}

fileVer = fetch_file_version(sysPath:dllPath, file_name:"Ntoskrnl.exe");
if(!fileVer){
  exit(0);
}

if(version_is_less(version:fileVer, test_version:"6.1.7601.24354"))
{
  report = report_fixed_ver(file_checked:dllPath + "\Ntoskrnl.exe",
                            file_version:fileVer, vulnerable_range:"Less than 6.1.7601.24354");
  security_message(data:report);
  exit(0);
}
exit(99);
