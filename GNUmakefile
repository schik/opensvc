
# Install into the system root by default
GNUSTEP_INSTALLATION_DOMAIN=LOCAL

include $(GNUSTEP_MAKEFILES)/common.make

# The application to be compiled
APP_NAME=opensvc

opensvc_APPLICATION_ICON=AppIcon.tiff

#
# Additional libraries
#
opensvc_GUI_LIBS =

#
# Resource files
#

opensvc_RESOURCE_FILES = \
	Images/*.tiff

opensvc_LANGUAGES = English

# The Objective-C source files to be compiled

opensvc_OBJC_FILES = main.m \
	Controller.m

-include GNUmakefile.preamble

-include GNUmakefile.local

include $(GNUSTEP_MAKEFILES)/aggregate.make
include $(GNUSTEP_MAKEFILES)/application.make

-include GNUmakefile.postamble

