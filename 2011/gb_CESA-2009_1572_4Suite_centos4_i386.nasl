###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for 4Suite CESA-2009:1572 centos4 i386
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
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2009-November/016314.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880742");
  script_version("$Revision: 14222 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 13:50:48 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name:"CESA", value:"2009:1572");
  script_cve_id("CVE-2009-3720");
  script_name("CentOS Update for 4Suite CESA-2009:1572 centos4 i386");

  script_tag(name:"summary", value:"The remote host is missing an update for the '4Suite'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms", re:"ssh/login/release=CentOS4");
  script_tag(name:"affected", value:"4Suite on CentOS 4");
  script_tag(name:"insight", value:"The 4Suite package contains XML-related tools and libraries for Python,
  including 4DOM, 4XSLT, 4XPath, 4RDF, and 4XPointer.

  A buffer over-read flaw was found in the way 4Suite's XML parser handles
  malformed UTF-8 sequences when processing XML files. A specially-crafted
  XML file could cause applications using the 4Suite library to crash while
  parsing the file. (CVE-2009-3720)

  Note: In Red Hat Enterprise Linux 3, this flaw only affects a non-default
  configuration of the 4Suite package: configurations where the beta version
  of the cDomlette module is enabled.

  All 4Suite users should upgrade to this updated package, which contains a
  backported patch to correct this issue. After installing the updated
  package, applications using the 4Suite XML-related tools and libraries must
  be restarted for the update to take effect.");
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"4Suite", rpm:"4Suite~1.0~3.el4_8.1", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
