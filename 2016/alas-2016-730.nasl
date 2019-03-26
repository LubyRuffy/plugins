###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2016-730.nasl 11703 2018-10-01 08:05:31Z cfischer $
#
# Amazon Linux security check
#
# Authors:
# Autogenerated by alas-generator developed by Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.120719");
  script_version("$Revision: 11703 $");
  script_tag(name:"creation_date", value:"2016-10-26 15:38:18 +0300 (Wed, 26 Oct 2016)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 10:05:31 +0200 (Mon, 01 Oct 2018) $");
  script_name("Amazon Linux Local Check: alas-2016-730");
  script_tag(name:"insight", value:"curl and libcurl before 7.50.1 do not prevent TLS session resumption when the client certificate has changed, which allows remote attackers to bypass intended restrictions by resuming a session. (CVE-2016-5419 )curl and libcurl before 7.50.1 do not check the client certificate when choosing the TLS connection to reuse, which might allow remote attackers to hijack the authentication of the connection by leveraging a previously created connection with a different client certificate. (CVE-2016-5420 )libcurl before 7.50.1 allows attackers to control which connection is used or possibly have unspecified other impact via unknown vectors. (CVE-2016-5421 )");
  script_tag(name:"solution", value:"Run yum update curl to update your system.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2016-730.html");
  script_cve_id("CVE-2016-5421", "CVE-2016-5420", "CVE-2016-5419");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Amazon Linux Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "AMAZON")
{
  if ((res = isrpmvuln(pkg:"libcurl", rpm:"libcurl~7.40.0~8.59.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"curl-debuginfo", rpm:"curl-debuginfo~7.40.0~8.59.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"libcurl-devel", rpm:"libcurl-devel~7.40.0~8.59.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"curl", rpm:"curl~7.40.0~8.59.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
    exit(0);
}