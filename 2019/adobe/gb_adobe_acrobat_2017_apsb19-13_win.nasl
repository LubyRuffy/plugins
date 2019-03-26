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

CPE = "cpe:/a:adobe:acrobat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814934");
  script_version("$Revision: 13849 $");
  script_cve_id("CVE-2019-7815");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-02-25 13:56:39 +0100 (Mon, 25 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-02-25 12:14:10 +0530 (Mon, 25 Feb 2019)");

  script_name("Adobe Acrobat 2017 Security Updates(apsb19-13)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Acrobat 2017
  and is prone to an information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to leakage of sensitive data.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain access to sensitive information which may aid further attacks.");

  script_tag(name:"affected", value:"Adobe Acrobat 2017 version 2017.011.30120
  and earlier on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Acrobat 2017.011.30127 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/acrobat/apsb19-13.html");
  script_xref(name:"URL", value:"https://helpx.adobe.com");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_win.nasl");
  script_mandatory_keys("Adobe/Acrobat/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

## 2017.011.30120 == 17.011.30120
if(version_in_range(version:vers, test_version:"17.0", test_version2:"17.011.30120"))
{
  report =  report_fixed_ver(installed_version:vers, fixed_version:"2017.011.30127", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(99);
