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
  script_oid("1.3.6.1.4.1.25623.1.0.814908");
  script_version("$Revision: 14086 $");
  script_cve_id("CVE-2019-0540");
  script_bugtraq_id(106863);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-03-11 10:05:57 +0100 (Mon, 11 Mar 2019) $");
  script_tag(name:"creation_date", value:"2019-02-13 12:16:48 +0530 (Wed, 13 Feb 2019)");
  script_name("Microsoft Office Security Feature Bypass Vulnerabilities (KB4092465)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4092465");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"A security feature bypass vulnerability
  exists when Microsoft Office does not validate URLs.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to perform a phishing attack.");

  script_tag(name:"affected", value:"Microsoft Excel Viewer 2007 Service Pack 3,
  Microsoft PowerPoint Viewer and Microsoft Office Compatibility Pack Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4092465");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/ComptPack/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(!os_arch = get_kb_item("SMB/Windows/Arch")){
  exit(0);
}

if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion");
}
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion",
                        "SOFTWARE\Microsoft\Windows\CurrentVersion");
}

foreach key(key_list)
{
  commonpath = registry_get_sz(key:key, item:"CommonFilesDir");

  if(!commonpath){
    exit(0);
  }

  offPath = commonpath + "\Microsoft Shared\Office12";
  offexeVer = fetch_file_version(sysPath:offPath, file_name:"Mso.dll");
  if(!offexeVer){
    continue;
  }

  if(version_in_range(version:offexeVer, test_version:"12.0", test_version2:"12.0.6807.4999"))
  {
    report = report_fixed_ver( file_checked:offPath + "\Mso.dl",
                               file_version:offexeVer, vulnerable_range:"12.0 - 12.0.6807.4999");
    security_message(data:report);
    exit(0);
  }
}