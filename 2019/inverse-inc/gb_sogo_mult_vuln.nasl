# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) of the respective author(s)
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

CPE = "cpe:/a:inverse-inc:sogo";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142123");
  script_version("$Revision: 14092 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-11 11:10:08 +0100 (Mon, 11 Mar 2019) $");
  script_tag(name:"creation_date", value:"2019-03-11 17:01:19 +0700 (Mon, 11 Mar 2019)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");

  script_cve_id("CVE-2016-6189", "CVE-2016-6190");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("SOGo Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_inverseinc_sogo_detect.nasl");
  script_mandatory_keys("inverse/sogo/detected");

  script_tag(name:"summary", value:"SOGo is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"SOGo prior to version 2.3.12 and 3.1.1.");

  script_tag(name:"solution", value:"Upgrade to version 2.3.12, 3.1.1 or later.");

  script_xref(name:"URL", value:"https://sogo.nu/bugs/view.php?id=3695");
  script_xref(name:"URL", value:"https://sogo.nu/bugs/view.php?id=3696");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2.3.12")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.3.12");
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range(version: version, test_version: "3.0", test_version2: "3.1.0")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "3.1.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
