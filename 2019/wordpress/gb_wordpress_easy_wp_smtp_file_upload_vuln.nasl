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

CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142166");
  script_version("2019-03-29T09:25:06+0000");
  script_tag(name:"last_modification", value:"2019-03-29 09:25:06 +0000 (Fri, 29 Mar 2019)");
  script_tag(name:"creation_date", value:"2019-03-26 09:35:55 +0000 (Tue, 26 Mar 2019)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Easy WP SMTP Plugin 1.3.9 RCE Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name:"summary", value:"WordPress Easy WP SMTP Plugin is prone to a remote code execution
vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"WordPress Easy WP SMTP plugin version 1.3.9.");

  script_tag(name:"solution", value:"Update to version 1.3.9.1 or later.");

  script_xref(name:"URL", value:"https://blog.nintechnet.com/critical-0day-vulnerability-fixed-in-wordpress-easy-wp-smtp-plugin/");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

url = dir + "/wp-content/plugins/easy-wp-smtp/readme.txt";
res = http_get_cache(port: port, item: url);

if ("Easy WP SMTP" >< res && "Changelog" >< res) {

  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);

  if (vers[1] && version_is_equal(version: vers[1], test_version: "1.3.9")) {
    report = report_fixed_ver(installed_version: vers[1], fixed_version: "1.3.9.1", file_checked: url);
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(99);