#!/bin/bash
echo -e "\e[1m----------------------------------------"
echo -e "\e[1m       Umbraco Template Installer"
echo -e "\e[1m----------------------------------------"
echo ""
echo "This will install the following;"
echo ""
echo -e "\e[1m----------------------------------------"
echo -e "\e[0m"
echo "- Umbraco Template 0.5 Alpha 001"
echo ""

if [[ $EUID -ne 0 ]]; then
   echo -e "\e[1;31mThis script must be run as root" 
   exit 1
fi

echo -e "\e[0m"
echo -e "\e[1m----------------------------------------"
echo -e "\e[1m         Adding Nuget Feed"
echo -e "\e[1m----------------------------------------"
echo -e "\e[0m"

dotnet nuget add source "https://www.myget.org/F/umbracoprereleases/api/v3/index.json" -n "Umbraco Prereleases"

echo -e "\e[0m"
echo -e "\e[1m----------------------------------------"
echo -e "\e[1m     Installing the Template"
echo -e "\e[1m----------------------------------------"
echo -e "\e[0m"

dotnet new -i Umbraco.Templates::0.5.0-alpha001

echo -e "\e[0m"
echo -e "\e[1m----------------------------------------"
echo -e "\e[1m              ALL DONE!"
echo -e "\e[1m----------------------------------------"
echo -e "\e[0m"

