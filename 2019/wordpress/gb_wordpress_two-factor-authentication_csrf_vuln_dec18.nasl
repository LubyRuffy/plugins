# Copyright (C) 2019 Greenbone Networks GmbH
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112518");
  script_version("$Revision: 13730 $");
  script_tag(name:"last_modification", value:"$Date: 2019-02-18 11:06:01 +0100 (Mon, 18 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-02-18 10:18:00 +0100 (Mon, 18 Feb 2019)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2018-20231");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Two Factor Authentication Plugin before 1.3.13 CSRF Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name:"summary", value:"The Wordpress plugin Two Factor Authentication is prone to a CSRF vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"affected", value:"WordPress Two Factor Authentication plugin before version 1.3.13.");
  script_tag(name:"solution", value:"Upgrade to version 1.3.13 or later.");

  script_xref(name:"URL", value:"https://wordpress.org/plugins/two-factor-authentication/#developers");
  script_xref(name:"URL", value:"https://wpvulndb.com/vulnerabilities/9187");

  exit(0);
}

CPE = "cpe:/a:wordpress:wordpress";

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if(!port = get_app_port(cpe: CPE))
  exit(0);

if(!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if(dir == "/")
  dir = "";

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/two-factor-authentication/readme.txt");

if("=== Two Factor Authentication ===" >< res && "Changelog" >< res) {

  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);

  if(!isnull(vers[1]) && version_is_less(version: vers[1], test_version: "1.3.13")) {
    report = report_fixed_ver(installed_version: vers[1], fixed_version: "1.3.13");
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(99);
