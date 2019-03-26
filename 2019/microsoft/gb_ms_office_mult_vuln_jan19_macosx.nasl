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
  script_oid("1.3.6.1.4.1.25623.1.0.814757");
  script_version("$Revision: 13701 $");
  script_cve_id("CVE-2019-0561", "CVE-2019-0585");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"creation_date", value:"2019-02-14 12:56:05 +0530 (Thu, 14 Feb 2019)");
  script_tag(name:"last_modification", value:"$Date: 2019-02-15 16:13:17 +0100 (Fri, 15 Feb 2019) $");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Multiple Vulnerabilities-January19 (Mac OS X)");

  script_tag(name:"summary", value:"This host is missing an important security
  update for Microsoft Office 2016/2019 on Mac OSX according to Microsoft security
  update January 2019");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - An error in Microsoft Word software when it fails to properly handle objects
    in memory.

  - An error when Microsoft Word macro buttons are used improperly.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain access to potentially sensitive information and execute arbitrary code
  on affected system");

  script_tag(name:"affected", value:"Microsoft Office 2016 on Mac OS X,

  Microsoft Office 2019 on Mac OS X");

  script_tag(name:"solution", value:"Upgrade to Microsoft Office 2016 version
  16.16.6 (Build 19011400) or Microsoft Office 2019 version 16.21.0 (Build
  190101500) or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://docs.microsoft.com/en-us/officeupdates/release-notes-office-2016-mac");
  script_xref(name:"URL", value:"https://docs.microsoft.com/en-us/officeupdates/release-notes-office-for-mac");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gb_microsoft_office_detect_macosx.nasl");
  script_mandatory_keys("MS/Office/MacOSX/Ver");
  exit(0);
}

include("version_func.inc");

if(!offVer = get_kb_item("MS/Office/MacOSX/Ver")){
  exit(0);
}

if(offVer =~ "^1[5|6]\.)")
{
  if(version_is_less(version:offVer, test_version:"16.16.6")){
    fix = "16.16.6";
  }
  else if(offVer =~ "^(16\.1[7|8|9]\.)" && version_is_less(version:offVer, test_version:"16.21.0")){
    fix = "16.21.0";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:offVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}
exit(99);
