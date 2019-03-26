###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_HT208475.nasl 14293 2019-03-18 18:52:01Z cfischer $
#
# Apple Safari Security Updates( HT208475 )
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.812665");
  script_version("$Revision: 14293 $");
  script_cve_id("CVE-2018-4088", "CVE-2018-4089", "CVE-2018-4096");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 19:52:01 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2018-01-24 11:54:25 +0530 (Wed, 24 Jan 2018)");
  script_name("Apple Safari Security Updates( HT208475 )");

  script_tag(name:"summary", value:"This host is installed with Apple Safari
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists as multiple memory
  corruption issues were addressed with improved memory handling.");

  script_tag(name:"impact", value:"Successful exploitation of these
  vulnerabilities will allow remote attackers to execute arbitrary code on
  affected system.");

  script_tag(name:"affected", value:"Apple Safari versions before 11.0.3");

  script_tag(name:"solution", value:"Upgrade to Apple Safari 11.0.3 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT208475");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("macosx_safari_detect.nasl");
  script_mandatory_keys("AppleSafari/MacOSX/Version", "ssh/login/osx_name", "ssh/login/osx_version");
  script_xref(name:"URL", value:"http://www.apple.com/support");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

osName = get_kb_item("ssh/login/osx_name");
osVer = get_kb_item("ssh/login/osx_version");
if((!osName && "Mac OS X" >!< osName) || !osVer){
  exit (0);
}

if(version_is_less(version:osVer, test_version:"10.11.6"))
{
  fix = "Upgrade Apple Mac OS X to version 10.11.6 and Update Apple Safari to version 11.0.3" ;
  installedVer = "Apple Mac OS X " + osVer ;
}
else if(version_in_range(version:osVer, test_version:"10.12", test_version2:"10.12.5"))
{
  fix = "Upgrade Apple Mac OS X to version 10.12.6 and Update Apple Safari to version 11.0.3";
  installedVer = "Apple Mac OS X " + osVer ;
}
else if(version_in_range(version:osVer, test_version:"10.13", test_version2:"10.13.2"))
{
  fix = "Upgrade Apple Mac OS X to version 10.13.3 and Update Apple Safari to version 11.0.3";
  installedVer = "Apple Mac OS X " + osVer ;
}

else
{
  infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE );
  safVer = infos['version'];
  safPath = infos['location'];

  if(version_is_less(version:safVer, test_version:"11.0.3"))
  {
    fix = "11.0.3";
    installedVer = "Apple Safari " + safVer ;
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:installedVer, fixed_version:fix, install_path:safPath);
  security_message(data:report);
  exit(0);
}

exit(99);