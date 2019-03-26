###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-097.nasl 12455 2018-11-21 09:17:27Z cfischer $
#
# Microsoft Graphics Component Multiple Remote Code Execution Vulnerabilities (3177393)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808786");
  script_version("$Revision: 12455 $");
  script_cve_id("CVE-2016-3301", "CVE-2016-3303", "CVE-2016-3304");
  script_bugtraq_id(92302, 92301, 92288);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 10:17:27 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-08-10 11:19:21 +0530 (Wed, 10 Aug 2016)");
  script_name("Microsoft Graphics Component Multiple Remote Code Execution Vulnerabilities (3177393)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-097.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to windows font
  library improperly handles specially crafted embedded fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to obtain information to further compromise the user's system, and  install
  programs view, change, or delete data, or create new accounts with full user rights.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition

  Microsoft Windows 10 x32/x64

  Microsoft Windows Server 2012/2012R2

  Microsoft Windows 10 Version 1511 x32/x64

  Microsoft Windows Vista x32/x64 Edition Service Pack 2

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2

  Microsoft Windows 7 x32/x64 Edition Service Pack 1

  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3177393");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-097");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, winVistax64:3, win2008x64:3,
                   win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

winPath = smb_get_systemroot();
if(!winPath ){
  exit(0);
}

windllVer = fetch_file_version(sysPath: winPath, file_name:"System32\Gdiplus.dll");
if(!windllVer){
  exit(0);
}

if(hotfix_check_sp(winVista:3, winVistax64:3, win2008:3, win2008x64:3) > 0)
{
  if(version_is_less(version:windllVer, test_version:"6.0.6002.19672"))
  {
    Vulnerable_range = "Less than 6.0.6002.19672";
    VULN = TRUE ;
  }
  else if(version_in_range(version:windllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23997"))
  {
    Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23997";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:windllVer, test_version:"6.3.9600.18405"))
  {
    Vulnerable_range = "Less than 6.3.9600.18405";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:windllVer, test_version:"6.1.7601.23508"))
  {
    Vulnerable_range = "Less than 6.1.7601.23508";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:windllVer, test_version:"10.0.10240.17071"))
  {
    Vulnerable_range = "Less than 10.0.10240.17071";
    VULN = TRUE ;
  }
  else if(version_in_range(version:windllVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.544"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.544";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + winPath + "\System32\Gdiplus.dll" + '\n' +
           'File version:     ' + windllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);