###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for slock FEDORA-2016-7e817cbf55
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.809242");
  script_version("$Revision: 14223 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 14:49:35 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2016-09-10 06:03:40 +0200 (Sat, 10 Sep 2016)");
  script_cve_id("CVE-2016-6866");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for slock FEDORA-2016-7e817cbf55");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'slock'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"affected", value:"slock on Fedora 23");
  script_tag(name:"solution", value:"Please install the updated package(s).");
  script_xref(name:"FEDORA", value:"2016-7e817cbf55");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3VZYLWZDI7EXV4L3AFXZ2WOOLF53PZG7");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC23");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";

if(release == "FC23")
{

  if ((res = isrpmvuln(pkg:"slock", rpm:"slock~1.3~2.fc23", rls:"FC23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
