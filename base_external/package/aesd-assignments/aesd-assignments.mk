
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '1f92d67046fe549ced07076c736a043e8affb007'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-AAAAAustin.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	# assignment 4
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	# assignment 5
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
# PERSONAL NOTE: -d on line 24, confusion?  Why is there -d instead of -m, ask TA perhaps
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# assignment 4
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/     
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh* $(TARGET_DIR)/usr/bin

	# assignment 5
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
