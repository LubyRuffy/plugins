###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for cpio CESA-2010:0144 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2010-March/016557.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880653");
  script_version("$Revision: 14222 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 13:50:48 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name:"CESA", value:"2010:0144");
  script_cve_id("CVE-2007-4476", "CVE-2010-0624");
  script_name("CentOS Update for cpio CESA-2010:0144 centos5 i386");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'cpio'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms", re:"ssh/login/release=CentOS5");
  script_tag(name:"affected", value:"cpio on CentOS 5");
  script_tag(name:"insight", value:"GNU cpio copies files into or out of a cpio or tar archive.

  A heap-based buffer overflow flaw was found in the way cpio expanded
  archive files. If a user were tricked into expanding a specially-crafted
  archive, it could cause the cpio executable to crash or execute arbitrary
  code with the privileges of the user running cpio. (CVE-2010-0624)

  Red Hat would like to thank Jakob Lell for responsibly reporting the
  CVE-2010-0624 issue.

  A denial of service flaw was found in the way cpio expanded archive files.
  If a user expanded a specially-crafted archive, it could cause the cpio
  executable to crash. (CVE-2007-4476)

  Users of cpio are advised to upgrade to this updated package, which
  contains backported patches to correct these issues.");
  script_tag(name:"solution", value:"Please install the updated packages.");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"cpio", rpm:"cpio~2.6~23.el5_4.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
