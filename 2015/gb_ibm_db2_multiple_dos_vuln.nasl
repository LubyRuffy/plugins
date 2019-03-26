###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_multiple_dos_vuln.nasl 14286 2019-03-18 15:20:15Z ckuersteiner $
#
# IBM DB2 Multiple Denial of Service Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:ibm:db2";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805035");
  script_version("$Revision: 14286 $");
  script_cve_id("CVE-2014-6209", "CVE-2014-8901");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 16:20:15 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2015-01-08 13:04:41 +0530 (Thu, 08 Jan 2015)");

  script_name("IBM DB2 Multiple Denial of Service Vulnerabilities");

  script_tag(name:"summary", value:"This host is running IBM DB2 and is
  prone to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaws are due to

  - An error during the handling of a specially crafted ALTER TABLE statement on an identity column.

  - An error when handling a specially crafted XML query, which can result in a consumption of CPU resources.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to cause the server to terminate abnormally and cause a denial of service.");

  script_tag(name:"affected", value:"IBM DB2 versions 9.5 through FP10

  IBM DB2 versions 9.7 through FP10

  IBM DB2 versions 9.8 through FP5

  IBM DB2 versions 10.1 through FP4

  IBM DB2 versions 10.5 through FP4");

  script_tag(name:"solution", value:"Apply the appropriate fix from the referenced advisory.");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/99110");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/98684");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21690787");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21692358");

  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("gb_ibm_db2_remote_detect.nasl");
  script_mandatory_keys("IBM-DB2/installed");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

infos = get_app_version_and_proto(cpe: CPE, port: port, exit_no_version: TRUE);
version = infos["version"];
proto = infos["proto"];

if (version =~ "^09\.05\.") {
  if (version_is_less_equal(version: version, test_version: "09.05.10")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^09\.07\.") {
  if (version_is_less_equal(version: version, test_version: "09.07.10")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^09\.08\.") {
  if (version_is_less_equal(version: version, test_version: "09.08.5")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^10\.01\.") {
  if (version_is_less_equal(version: version, test_version: "10.01.4")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^10\.05\.") {
  if (version_is_less_equal(version: version, test_version: "10.05.4")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

exit(99);
