NAME = ext_piratebox
VERSION = 0.7.0

ARCH = all
IPK = $(NAME)_$(VERSION)_$(ARCH).ipk
IPKDIR = src
WRT_DEPENDENCIES =  python lighttpd lighttpd-mod-cgi lighttpd-mod-redirect lighttpd-mod-alias lighttpd-mod-setenv
WRT_SOURCE = package/$(Name)
WRT_SECTION = net
WRT_STATUS  = unknown ok not-installed 
WRT_ESSENTIAL = no
WRT_PRIORITY = optional
WRT_MAINTAINER = Matthias Strubel <matthias.strubel@aod-rpg.de> 
WRT_DESCRIPTION = installs PirateBox to ext_mnt


.DEFAULT_GOAL = all

$(IPKDIR)/control.tar.gz: $(IPKDIR)/control
	tar czf $@ -C $(IPKDIR)/control .

control: $(IPKDIR)/control.tar.gz  $(IPKDIR)/control/control
	
$(IPKDIR)/control/control:
	echo "Package: "$(NAME)   >   $@
	echo "Version: "$(VERSION)  >>  $@
	echo "Depends: "$(WRT_DEPENDENCIES) >> $@
	echo "Provides: "           >> $@
	echo "Source: "$(WRT_SOURCE) >> $@
	echo "Section: "$(WRT_SECTION) >> $@
	echo "Status: "$(WRT_STATUS) >> $@
	echo "Essential: "$(WRT_ESSENTIAL) >> $@
	echo "Priority: "$(WRT_PRIORITY)  >> $@
	echo "Maintainer: "'$(WRT_MAINTAINER)' >> $@
	echo "Architecture: "$(ARCH)  >> $@
	echo "Installed-Size: "36864  >> $@
# temp	echo "Installed-Size: "  `du -cb $(IPKDIR)/data | tail -n 1 | awk -F \b '{print $1}'` >> $@
	echo "Description: "$(WRT_DESCRIPTION) >> $@

$(IPKDIR)/data.tar.gz: $(IPKDIR)/data
	tar czf $@ -C $(IPKDIR)/data .

data: $(IPKDIR)/data.tar.gz 

$(IPK): $(IPKDIR)/control/control $(IPKDIR)/control.tar.gz $(IPKDIR)/data.tar.gz $(IPKDIR)/control $(IPKDIR)/data 
	tar czf $@ -C $(IPKDIR) control.tar.gz data.tar.gz debian-binary

all: $(IPK) 

cleanbuild:
	-rm -f $(IPKDIR)/control/control
	-rm -f $(IPKDIR)/control.tar.gz
	-rm -f $(IPKDIR)/data.tar.gz

clean: cleanbuild
	-rm -f $(IPK)

.PHONY: all clean

