###############################################################################
# OpenVAS Vulnerability Test
# $Id: cvstrac_filediff.nasl 13975 2019-03-04 09:32:08Z cfischer $
#
# CVSTrac filediff vulnerability
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Netwok Security
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

# Ref: Richard Ngo (August 2004)

CPE = "cpe:/a:cvstrac:cvstrac";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.14220");
  script_version("$Revision: 13975 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-04 10:32:08 +0100 (Mon, 04 Mar 2019) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-1456");
  script_bugtraq_id(10878);
  script_xref(name:"OSVDB", value:"8373");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("CVSTrac filediff vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("cvstrac_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("cvstrac/detected");

  script_tag(name:"solution", value:"Update to version 1.1.4 or disable this CGI suite.");

  script_tag(name:"summary", value:"The remote host seems to be running cvstrac,
  a web-based bug and patch-set tracking system for CVS.

  This version of filediff has a flaw in the input sanitation
  which, when exploited, can lead to a remote attacker
  executing arbitrary commands on the system.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( ereg( pattern:"^(0\.|1\.(0|1\.[0-3]([^0-9]|$)))", string:vers ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.1.4" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );