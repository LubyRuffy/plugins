# OpenVAS Vulnerability Test
# $Id: deb_2362_1.nasl 14275 2019-03-18 14:39:45Z cfischer $
# Description: Auto-generated from advisory DSA 2362-1 (acpid)
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
  script_oid("1.3.6.1.4.1.25623.1.0.70574");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2011-1159", "CVE-2011-2777", "CVE-2011-4578");
  script_version("$Revision: 14275 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:39:45 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2012-02-11 02:34:11 -0500 (Sat, 11 Feb 2012)");
  script_name("Debian Security Advisory DSA 2362-1 (acpid)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(5|6)");
  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202362-1");
  script_tag(name:"insight", value:"Multiple vulnerabilities were found in the acpid, the Advanced
Configuration and Power Interface event daemon:

CVE-2011-1159

Vasiliy Kulikov of OpenWall discovered that the socket handling
is vulnerable to denial of service.

CVE-2011-2777

Oliver-Tobias Ripka discovered that incorrect process handling in
the Debian-specific powerbtn.sh script could lead to local
privilege escalation. This issue doesn't affect oldstable. The
script is only shipped as an example in /usr/share/doc/acpid/examples.
See /usr/share/doc/acpid/README.Debian for details.

CVE-2011-4578

Helmut Grohne and Michael Biebl discovered that acpid sets a umask
of 0 when executing scripts, which could result in local privilege
escalation.

For the oldstable distribution (lenny), this problem has been fixed in
version 1.0.8-1lenny4.

For the stable distribution (squeeze), this problem has been fixed in
version 1:2.0.7-1squeeze3.

For the unstable distribution (sid), this problem will be fixed soon.");

  script_tag(name:"solution", value:"We recommend that you upgrade your acpid packages.");
  script_tag(name:"summary", value:"The remote host is missing an update to acpid
announced via advisory DSA 2362-1.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"acpid", ver:"1.0.8-1lenny4", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"acpid", ver:"1:2.0.7-1squeeze3", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"kacpimon", ver:"1:2.0.7-1squeeze3", rls:"DEB6")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}