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
  script_oid("1.3.6.1.4.1.25623.1.0.814678");
  script_version("$Revision: 14107 $");
  script_cve_id("CVE-2019-0669");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"creation_date", value:"2019-02-13 10:16:01 +0530 (Wed, 13 Feb 2019)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-12 08:31:46 +0100 (Tue, 12 Mar 2019) $");
  script_name("Microsoft Excel 2013 Service Pack 1 Information Disclosure Vulnerability (KB4461597)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4461597");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw is due to Microsoft Excel improperly
  discloses the contents of its memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker to
  craft a special document file and then convince the user to open it and compromise
  the user's computer or data.");

  script_tag(name:"affected", value:"Microsoft Excel 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4461597");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Excel/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

excelVer = get_kb_item("SMB/Office/Excel/Version");
if(!excelVer){
  exit(0);
}

excelPath = get_kb_item("SMB/Office/Excel/Install/Path");
if(!excelPath){
  excelPath = "Unable to fetch the install path";
}

if(excelVer =~ "^15\." && version_is_less(version:excelVer, test_version:"15.0.5111.1000"))
{
  report = report_fixed_ver(file_checked:excelPath + "Excel.exe",
                            file_version:excelVer, vulnerable_range:"15.0 - 15.0.5111.0999");
  security_message(data:report);
  exit(0);
}
exit(99);
