# OpenVAS Vulnerability Test
# $Id: deb_2213_1.nasl 14275 2019-03-18 14:39:45Z cfischer $
# Description: Auto-generated from advisory DSA 2213-1 (x11-xserver-utils)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
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
#

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.69557");
  script_version("$Revision: 14275 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:39:45 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2011-05-12 19:21:50 +0200 (Thu, 12 May 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2011-0465");
  script_name("Debian Security Advisory DSA 2213-1 (x11-xserver-utils)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(5|6)");
  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202213-1");
  script_tag(name:"insight", value:"Sebastian Krahmer discovered that the xrdb utility of x11-xserver-utils,
a X server resource database utility, is not properly filtering crafted
hostnames.  This allows a remote attacker to execute arbitrary code with
root privileges given that either remote logins via xdmcp are allowed or
the attacker is able to place a rogue DHCP server into the victims network.


The oldstable distribution (lenny), this problem has been fixed in
version 7.3+6.

For the stable distribution (squeeze), this problem has been fixed in
version 7.5+3.

For the testing distribution (wheezy), this problem will be fixed soon.

For the testing distribution (sid), this problem has been fixed in
version 7.6+2.");

  script_tag(name:"solution", value:"We recommend that you upgrade your x11-xserver-utils packages.");
  script_tag(name:"summary", value:"The remote host is missing an update to x11-xserver-utils
announced via advisory DSA 2213-1.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"x11-xserver-utils", ver:"7.3+6", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"x11-xserver-utils", ver:"7.5+3", rls:"DEB6")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}