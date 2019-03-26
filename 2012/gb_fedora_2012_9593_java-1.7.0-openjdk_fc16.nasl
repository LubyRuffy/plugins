###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for java-1.7.0-openjdk FEDORA-2012-9593
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
  script_xref(name:"URL", value:"http://lists.fedoraproject.org/pipermail/package-announce/2012-June/082422.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864471");
  script_version("$Revision: 14223 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 14:49:35 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2012-06-19 09:38:13 +0530 (Tue, 19 Jun 2012)");
  script_cve_id("CVE-2012-1711", "CVE-2012-1717", "CVE-2012-1716", "CVE-2012-1713",
                "CVE-2012-1719", "CVE-2012-1718", "CVE-2012-1723", "CVE-2012-1724",
                "CVE-2012-1725", "CVE-2012-0497", "CVE-2011-3571", "CVE-2012-0503",
                "CVE-2012-0505", "CVE-2012-0502", "CVE-2011-3563", "CVE-2011-5035",
                "CVE-2012-0501", "CVE-2012-0506", "CVE-2011-3547", "CVE-2011-3548",
                "CVE-2011-3551", "CVE-2011-3552", "CVE-2011-3544", "CVE-2011-3521",
                "CVE-2011-3554", "CVE-2011-3389", "CVE-2011-3558", "CVE-2011-3556",
                "CVE-2011-3557", "CVE-2011-3560");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"FEDORA", value:"2012-9593");
  script_name("Fedora Update for java-1.7.0-openjdk FEDORA-2012-9593");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'java-1.7.0-openjdk'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC16");
  script_tag(name:"affected", value:"java-1.7.0-openjdk on Fedora 16");
  script_tag(name:"solution", value:"Please install the updated package(s).");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.3~2.2.1.fc16.7", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
