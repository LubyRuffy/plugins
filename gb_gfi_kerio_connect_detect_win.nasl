##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_gfi_kerio_connect_detect_win.nasl 12753 2018-12-11 08:48:01Z mmartin $
#
# GFI Kerio Connect Version Detection (Windows)
#
# Authors:
# Michael Martin <michael.martin@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH, http//www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.107400");
  script_version("$Revision: 12753 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-11 09:48:01 +0100 (Tue, 11 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-06 16:50:35 +0100 (Thu, 06 Dec 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("GFI Kerio Connect Version Detection (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);

  script_tag(name:"summary", value:"This script detects the installed version
  of GFI Kerio Connect for Windows.");

  script_tag(name:"qod_type", value:"registry");

  exit(0);
}

include("smb_nt.inc");
include("cpe.inc");
include("host_details.inc");
include("secpod_smb_func.inc");
include("version_func.inc");

os_arch = get_kb_item("SMB/Windows/Arch");
if (!os_arch)
  exit(0);

if ("x86" >< os_arch) {
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
} else if ("x64" >< os_arch) {
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                       "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

if (isnull(key_list)) exit(0);

foreach key (key_list) {
  foreach item (registry_enum_keys(key:key)) {

    appName = registry_get_sz(key:key + item, item:"DisplayName");

    if(!appName || appName !~ "Kerio Connect") continue;
    version = "unknown";
    concluded += "Kerio Connect";
    location = "unknown";

    loc = registry_get_sz(key:key + item, item:"InstallLocation");
    if(loc) location = loc;

    vers = registry_get_sz(key:key + item, item:"DisplayVersion");
    if(vers){
      version = vers;
      concluded += " " + vers;
    }

    set_kb_item(name:"kerio/connect/win/detected", value:TRUE);
    set_kb_item(name:"kerio/connect/win/ver", value:version);

    register_and_report_cpe(app:appName, ver:version, concluded:concluded,
    base:"cpe:/a:kerio:connect:", expr:"^([0-9.]+)", insloc:location, regService:"smb-login", regPort:0);

    exit(0);
  }
}

exit(0);