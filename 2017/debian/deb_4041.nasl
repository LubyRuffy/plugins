###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4041.nasl 14284 2019-03-18 15:02:15Z cfischer $
#
# Auto-generated from advisory DSA 4041-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704041");
  script_version("$Revision: 14284 $");
  script_cve_id("CVE-2017-16844");
  script_name("Debian Security Advisory DSA 4041-1 (procmail - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 16:02:15 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2017-11-19 00:00:00 +0100 (Sun, 19 Nov 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4041.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(9|8)");
  script_tag(name:"affected", value:"procmail on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 3.22-24+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 3.22-25+deb9u1.

We recommend that you upgrade your procmail packages.

For the detailed security status of procmail please refer to its
security tracker page linked at the references.");

  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/procmail");
  script_tag(name:"summary", value:"Jakub Wilk reported a heap-based buffer overflow vulnerability in
procmail's formail utility when processing specially-crafted email
headers. A remote attacker could use this flaw to cause formail to
crash, resulting in a denial of service or data loss.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"procmail", ver:"3.22-25+deb9u1", rls:"DEB9")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"procmail", ver:"3.22-24+deb8u1", rls:"DEB8")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}