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

CPE = "cpe:/a:adobe:flash_player_chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814682");
  script_version("$Revision: 13652 $");
  script_cve_id("CVE-2019-7090");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-02-14 08:33:50 +0100 (Thu, 14 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-02-13 11:38:48 +0530 (Wed, 13 Feb 2019)");
  script_name("Adobe Flash Player Within Google Chrome Security Update(apsb19-06)- Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to an information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an out-of-bounds read
  error.");

  script_tag(name:"impact", value:"Successful exploitation allow attackers
  to conduct information disclosure in the context of the current user.");

  script_tag(name:"affected", value:"Adobe Flash Player prior to 32.0.0.142
  within Google Chrome on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player for Google Chrome
  32.0.0.142, or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb19-06.html");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_flash_player_within_google_chrome_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"32.0.0.142"))
{
  report =  report_fixed_ver(installed_version:vers, fixed_version:"32.0.0.142", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(99);
