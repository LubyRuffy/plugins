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
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814764");
  script_version("$Revision: 14151 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-03-13 15:00:15 +0100 (Wed, 13 Mar 2019) $");
  script_tag(name:"creation_date", value:"2019-03-13 09:30:21 +0530 (Wed, 13 Mar 2019)");
  script_name("Microsoft SHA-2 Code Sign Support Defense in Depth (KB4474419)");

  script_tag(name:"summary", value:"This host is missing a defense-in-depth update
  according to Microsoft KB4474419");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Microsoft has released an update for SHA-2
  code signing that introduces SHA-2 code sign support for Windows 7 SP1, and
  Windows Server 2008 R2 SP1.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to bypass defense-in-depth measures and perform exploitation.");

  script_tag(name:"affected", value:"Windows 7 for 32-bit/x64 Systems Service Pack 1 and

  Microsoft Windows Server 2008 R2 for x64-based Systems Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4474419");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2008r2:2, win7:2, win7x64:2) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

cryptVer = fetch_file_version(sysPath:sysPath, file_name:"Crypt32.dll");
if(!cryptVer){
  exit(0);
}

if(version_is_less(version:cryptVer, test_version:"6.1.7601.24382"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Crypt32.dll",
                            file_version:cryptVer, vulnerable_range:"Less than 6.1.7601.24382");
  security_message(data:report);
  exit(0);
}
exit(99);
