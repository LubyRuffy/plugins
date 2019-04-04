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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704414");
  script_version("2019-04-03T11:45:59+0000");
  script_cve_id("CVE-2019-3877", "CVE-2019-3878");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-04-03 11:45:59 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-03-22 22:00:00 +0000 (Fri, 22 Mar 2019)");
  script_name("Debian Security Advisory DSA 4414-1 (libapache2-mod-auth-mellon - security update)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9");

  script_xref(name:"URL", value:"https://www.debian.org/security/2019/dsa-4414.html");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DSA-4414-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libapache2-mod-auth-mellon'
  package(s) announced via the DSA-4414-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Several issues have been discovered in Apache module auth_mellon, which
provides SAML 2.0 authentication.

CVE-2019-3877
It was possible to bypass the redirect URL checking on logout, so
the module could be used as an open redirect facility.

CVE-2019-3878
When mod_auth_mellon is used in an Apache configuration which
serves as a remote proxy with the http_proxy module, it was
possible to bypass authentication by sending SAML ECP headers.");

  script_tag(name:"affected", value:"'libapache2-mod-auth-mellon' package(s) on Debian Linux.");

  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 0.12.0-2+deb9u1.

We recommend that you upgrade your libapache2-mod-auth-mellon packages.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"libapache2-mod-auth-mellon", ver:"0.12.0-2+deb9u1", rls:"DEB9"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}

exit(0);