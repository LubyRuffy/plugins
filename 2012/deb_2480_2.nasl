# OpenVAS Vulnerability Test
# $Id: deb_2480_2.nasl 14275 2019-03-18 14:39:45Z cfischer $
# Description: Auto-generated from advisory DSA 2480-2 (request-tracker3.8)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.71359");
  script_version("$Revision: 14275 $");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:39:45 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2012-05-31 11:52:12 -0400 (Thu, 31 May 2012)");
  script_name("Debian Security Advisory DSA 2480-2 (request-tracker3.8)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB6");
  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202480-2");
  script_tag(name:"insight", value:"It was discovered that the recent request-tracker3.8 update,
DSA-2480-1, introduced a regression which caused outgoing mail to fail
when running under mod_perl.

Please note that if you run request-tracker3.8 under the Apache web
server, you must stop and start Apache manually.  The restart
mechanism is not recommended, especially when using mod_perl.

For the stable distribution (squeeze), this problem has been fixed in
version 3.8.8-7+squeeze3.");

  script_tag(name:"solution", value:"We recommend that you upgrade your request-tracker3.8 packages.");
  script_tag(name:"summary", value:"The remote host is missing an update to request-tracker3.8
announced via advisory DSA 2480-2.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"request-tracker3.8", ver:"3.8.8-7+squeeze3", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-apache2", ver:"3.8.8-7+squeeze3", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-clients", ver:"3.8.8-7+squeeze3", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-db-mysql", ver:"3.8.8-7+squeeze3", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-db-postgresql", ver:"3.8.8-7+squeeze3", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-db-sqlite", ver:"3.8.8-7+squeeze3", rls:"DEB6")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}