#!/bin/bash
PACKAGE_MANAGER=dnf
REFERENCE_LINK="https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/"

MESSAGE_TO_FIND=$("Group: Virtualisation Description: These packages provide a graphical virtualization environment. Mandatory Packages: virt-install Default Packages: libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-manager virt-viewer Optional Packages: libguestfs-tools python3-libguestfs virt-top" | tr ' ' '\n')

function install_virtualisation_software() {
	echo "Running : sudo $PACKAGE_MANAGER group install --with-optional virtualization"
	sudo $PACKAGE_MANAGER group install --with-optional virtualization
}

function pause() {
	echo "Pause, press enter to continue..."
	read nothingness
}

echo "Install kvm2"
echo "Read the specifics at: https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/"
echo "Checking if CPU has virtualization extensions"
echo "Running: egrep '^flags.*(vmx|svm)' /proc/cpuinfo"
LENGTH=$(egrep '^flags.*(vmx|svm)' /proc/cpuinfo)
echo "${LENGTH}"
if [ ${#LENGTH} -ne 0 ]
then
	echo "Your cpu does have the relevant virtualisation extensions."
else
	echo "Your cpu does not have the relevant virtualisation extensions."
	echo "Software virtualisation will be used, but will be slower"
fi
echo "Installing virtualisation software"
echo "Running: $PACKAGE_MANAGER groupinfo virtualization"
VIRT_GROUP=$($PACKAGE_MANAGER groupinfo virtualization)
VIRT_GROUP_PRESENT=$(echo "$VIRT_GROUP" | tr ' ' '\n' | grep -o $MESSAGE_TO_FIND)
if [ $(#VIRT_GROUP_PRESENT) -ne 0 ]
then
	echo "The virtualisation software is present"
else
	echo "Installing the required virtualisation software"
	install_virtualisation_software
fi
echo "Starting libvirt"
sudo ./auto_launch_libvirtd.sh -s
echo "Enabeling libvirt on startup"
sudo ./auto_launch_libvirtd.sh -e
echo "Displaying status:"
sudo ./auto_launch_libvirtd.sh --status
echo "Successefully installed/enabled libvirt"
echo "Checking if the modules are loaded"
KVM_MODULES=$(lsmod | grep kvm)
if [ ${#KVM_MODULES} -eq 0 ]
then
	echo "Failed to install/enable libvirt."
	echo "To try and fix your problem, please follow this tutorial: (${REFERENCE_LINK})."
	echo "This program will now terminate."
	pause
	exit 1
else
	echo "Modules are successefully loaded"
fi
echo "This program was created by (c) Henry Letellier"
