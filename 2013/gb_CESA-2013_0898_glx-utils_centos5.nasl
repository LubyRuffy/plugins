###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for glx-utils CESA-2013:0898 centos5
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.881745");
  script_version("$Revision: 14222 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 13:50:48 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2013-06-04 09:19:12 +0530 (Tue, 04 Jun 2013)");
  script_cve_id("CVE-2013-1993");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("CentOS Update for glx-utils CESA-2013:0898 centos5");

  script_xref(name:"CESA", value:"2013:0898");
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2013-June/019773.html");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'glx-utils'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms", re:"ssh/login/release=CentOS5");
  script_tag(name:"affected", value:"glx-utils on CentOS 5");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_tag(name:"insight", value:"Mesa provides a 3D graphics API that is compatible with Open Graphics
  Library (OpenGL). It also provides hardware-accelerated drivers for many
  popular graphics chips.

  It was found that Mesa did not correctly validate messages from the X
  server. A malicious X server could cause an application using Mesa to crash
  or, potentially, execute arbitrary code with the privileges of the user
  running the application. (CVE-2013-1993)

  All users of Mesa are advised to upgrade to these updated packages, which
  contain backported patches to correct these issues. All running
  applications linked against Mesa must be restarted for this update to take
  effect.");
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

  if ((res = isrpmvuln(pkg:"glx-utils", rpm:"glx-utils~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-libGL", rpm:"mesa-libGL~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-libGL-devel", rpm:"mesa-libGL-devel~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-libGLU", rpm:"mesa-libGLU~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-libGLU-devel", rpm:"mesa-libGLU-devel~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-libGLw", rpm:"mesa-libGLw~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-libGLw-devel", rpm:"mesa-libGLw-devel~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-libOSMesa", rpm:"mesa-libOSMesa~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-libOSMesa-devel", rpm:"mesa-libOSMesa-devel~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa-source", rpm:"mesa-source~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mesa", rpm:"mesa~6.5.1~7.11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
