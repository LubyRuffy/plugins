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
  script_oid("1.3.6.1.4.1.25623.1.0.814670");
  script_version("$Revision: 14292 $");
  script_cve_id("CVE-2019-6223", "CVE-2019-7286", "CVE-2019-7288");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 19:39:37 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2019-02-08 10:02:49 +0530 (Fri, 08 Feb 2019)");
  script_name("Apple MacOSX Security Updates(HT209521)");

  script_tag(name:"summary", value:"This host is installed with Apple Mac OS X
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - A logic issue existed in the handling of Group FaceTime calls.

  - A memory corruption issue due to improper input validation.

  - An improper input validation on FaceTime server.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code and circumvent sandbox restrictions.");

  script_tag(name:"affected", value:"Apple Mac OS X versions 10.14.x through
  10.14.3 build 18D43.");

  script_tag(name:"solution", value:"Upgrade to Apple Mac OS X 10.14.3 build
  18D109 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT209521");
  script_xref(name:"URL", value:"http://www.apple.com/support");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version", re:"ssh/login/osx_version=^10\.14");
  exit(0);
}

include("version_func.inc");

osName = get_kb_item("ssh/login/osx_name");
if(!osName)
  exit(0);

osVer = get_kb_item("ssh/login/osx_version");

if(!osVer|| osVer !~ "^10\.14"|| "Mac OS X" >!< osName){
  exit(0);
}

buildVer = get_kb_item("ssh/login/osx_build");

if(version_in_range(version:osVer, test_version:"10.14", test_version2:"10.14.2")){
  fix = "Upgrade to latest OS release 10.14.3 and install Mojave 10.14.3 supplemental update";
}

else if(osVer == "10.14.3")
{
  if(version_is_less(version:buildVer, test_version:"18D109"))
  {
    fix = "Install Mojave 10.14.3 Supplemental Update";
    osVer = osVer + " Build " + buildVer;
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:osVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}

exit(99);