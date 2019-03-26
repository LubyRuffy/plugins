###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_mult_vuln_july15_macosx.nasl 12391 2018-11-16 16:12:15Z cfischer $
#
# Apple Safari Multiple Vulnerabilities-01 July15 (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:apple:safari";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805675");
  script_version("$Revision: 12391 $");
  script_cve_id("CVE-2015-3727", "CVE-2015-3660", "CVE-2015-3659", "CVE-2015-3658");
  script_bugtraq_id(75492, 75494);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 17:12:15 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-07-08 15:01:56 +0530 (Wed, 08 Jul 2015)");
  script_name("Apple Safari Multiple Vulnerabilities-01 July15 (Mac OS X)");

  script_tag(name:"summary", value:"This host is installed with Apple Safari
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An error in WebKit that does not properly restrict rename operations
    on WebSQL tables.

  - An error in the PDF functionality in WebKit.

  - An error in SQLite authorizer in the Storage functionality in WebKit
    that does not properly restrict access to SQL functions.

  - An error in Page Loading functionality in WebKit that does not properly
    consider redirects during decisions about sending an Origin header.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  remote attackers to access an arbitrary web site's database, inject arbitrary
  web script or HTML, execute arbitrary code or cause a denial of service and
  bypass CSRF protection mechanisms.");

  script_tag(name:"affected", value:"Apple Safari versions before 6.2.7, 7.x
  before 7.1.7, and 8.x before 8.0.7");

  script_tag(name:"solution", value:"Upgrade to Apple Safari version 6.2.7 or
  7.1.7 or 8.0.7 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT204941");
  script_xref(name:"URL", value:"http://lists.apple.com/archives/security-announce/2015/Apr/msg00000.html");
  script_xref(name:"URL", value:"http://lists.apple.com/archives/security-announce/2015/Jun/msg00004.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("macosx_safari_detect.nasl");
  script_mandatory_keys("AppleSafari/MacOSX/Version");
  script_xref(name:"URL", value:"http://www.apple.com/support");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!safVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:safVer, test_version:"6.2.7"))
{
  fix = "6.2.7";
  VULN = TRUE;
}

if(version_in_range(version:safVer, test_version:"7.0", test_version2:"7.1.6"))
{
  fix = "7.1.7";
  VULN = TRUE;
}

if(version_in_range(version:safVer, test_version:"8.0", test_version2:"8.0.6"))
{
  fix = "8.0.7";
  VULN = TRUE;
}

if(VULN)
{
  report = 'Installed version: ' + safVer + '\n' +
           'Fixed version:     ' + fix + '\n';
  security_message(data:report);
  exit(0);
}