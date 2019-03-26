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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814933");
  script_version("$Revision: 13642 $");
  script_cve_id("CVE-2018-1835", "CVE-2019-5785", "CVE-2018-1851");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-02-13 16:21:09 +0100 (Wed, 13 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-02-13 15:50:10 +0530 (Wed, 13 Feb 2019)");
  script_name("Mozilla Firefox Security Updates(mfsa_2019-04_2019-05)-Windows");

  script_tag(name:"summary", value:"This host is installed with
  Mozilla Firefox and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - A use-after-free vulnerability in the Skia library can occur when
    creating a path, leading to a potentially exploitable crash.

  - An integer overflow vulnerability in the Skia library can occur after
    specific transform operations, leading to a potentially exploitable crash

  - Cross-origin images can be read from a canvas element in violation
    of the same-origin policy using the transferFromImageBitmap method.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause denial of service.");

  script_tag(name:"affected", value:"Mozilla Firefox version before 65.0.1 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox version 65.0.1
  or later, For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2019-04");
  script_xref(name:"URL", value:"https://www.mozilla.org");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
ffVer = infos['version'];
if(!ffVer){
  exit(0);
}

ffPath = infos['location'];
if(version_is_less(version:ffVer, test_version:"65.0.1"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"65.0.1", install_path:ffPath);
  security_message(data:report);
  exit(0);
}
exit(0);
