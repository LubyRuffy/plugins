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
  script_oid("1.3.6.1.4.1.25623.1.0.815003");
  script_version("2019-03-22T10:32:36+0000");
  script_cve_id("CVE-2019-9790", "CVE-2019-9791", "CVE-2019-9792", "CVE-2019-9793",
                "CVE-2019-9789", "CVE-2019-9795", "CVE-2019-9796", "CVE-2019-9797",
                "CVE-2019-9788", "CVE-2019-9799", "CVE-2019-9804", "CVE-2019-9802",
                "CVE-2019-9803", "CVE-2019-9808", "CVE-2019-9805", "CVE-2019-9806",
                "CVE-2019-9807", "CVE-2019-9809");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2019-03-22 10:32:36 +0000 (Fri, 22 Mar 2019)");
  script_tag(name:"creation_date", value:"2019-03-20 12:38:52 +0530 (Wed, 20 Mar 2019)");
  script_name("Mozilla Firefox Security Updates(mfsa_2019-06_2019-08)-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with
  Mozilla Firefox and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - An integer overflow error in Skia.

  - An use-after-free error when removing in-use DOM elements.

  - Multiple type confusion errors through on-stack replacement with IonMonkey.

  - An error in IonMonkey just-in-time (JIT) compiler.

  - An improper bounds checks when Spectre mitigations are disabled.

  - A type confusion error in IonMonkey JIT compiler.

  - An use-after-free error with SMIL animation controller.

  - Cross-origin theft of images with createImageBitmap.

  - An insufficient bounds checking of data during inter-process communication.

  - A memory read error in Chrome process.

  - Upgrade-Insecure-Requests incorrectly enforced for same-origin navigation.

  - Use of uninitialized memory in Prio library.

  - A vulnerability exists during authorization prompting for FTP transaction.

  - Text sent through FTP connection can be incorporated into alert messages.

  - WebRTC permissions can display incorrect origin with data: and blob: URLs.

  - An error in handling FTP modal alert error messages.

  - An error in Firefox Developer Tools through 'Copy as cURL'.

  - Memory safety bugs.");

  script_tag(name:"impact", value:"Successful exploitation allow attackers
  to run arbitrary code, cause denial of service, disclose sensitive information
  and bypass security restrictions.");

  script_tag(name:"affected", value:"Mozilla Firefox version before
  66 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox version 66
  or later, For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2019-07/");
  script_xref(name:"URL", value:"https://www.mozilla.org");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)) exit(0);
ffVer = infos['version'];
ffPath = infos['location'];

if(version_is_less(version:ffVer, test_version:"66"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"66", install_path:ffPath);
  security_message(data:report);
  exit(0);
}

exit(0);
