# Copyright (C) 2019 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.113353");
  script_version("$Revision: 14245 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 07:33:51 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2019-03-12 13:34:54 +0200 (Tue, 12 Mar 2019)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2019-9692", "CVE-2019-9693");

  script_name("CMS Made Simple < 2.2.10 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("cms_made_simple_detect.nasl");
  script_mandatory_keys("cmsmadesimple/installed");

  script_tag(name:"summary", value:"CMS Made Simple is prone to multiple vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Following vulnerabilities exist:

  - class.showtime2_image.php does not ensure that a watermark file
    has a standard image file extension

  - an authenticated user can achieve SQL Injection in class.showtime2_data.php
    via the functions _updateshow (parameter show_id), _inputshow (parameter show_id),
    _Getshowinfo (parameter show_id), _Getpictureinfo (parameter picture_id),
    _AdjustNameSeq (parameter shownumber), _Updatepicture (parameter picture_id)
    and _Deletepicture (parameter picture_id)");
  script_tag(name:"impact", value:"Successful exploitation would allow an attacker to read sensitive information
  and modify the target system.");
  script_tag(name:"affected", value:"CMS Made Simple through version 2.2.9.");
  script_tag(name:"solution", value:"Update to version 2.2.10.");

  script_xref(name:"URL", value:"https://forum.cmsmadesimple.org/viewtopic.php?f=1&t=80285");

  exit(0);
}

CPE = "cpe:/a:cmsmadesimple:cms_made_simple";

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) ) exit( 0 );
if( ! version = get_app_version( cpe: CPE, port: port ) ) exit( 0 );

if( version_is_less( version: version, test_version: "2.2.10" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "2.2.10" );
  security_message( data: report, port: port );
  exit( 0 );
}

exit( 99 );
