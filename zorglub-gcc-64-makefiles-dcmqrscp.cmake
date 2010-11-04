# Client maintainer: mathieu . malaterre  gmail . com

set(CTEST_SITE "zorglub")
set(CTEST_BUILD_NAME "Linux-gcc-GIT-dcmqrscp")
set(CTEST_BUILD_CONFIGURATION Release)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(dashboard_root_name "MyTests")
SET(CTEST_BUILD_FLAGS "-j16")
set(dashboard_source_name "gdcm")
set(dashboard_binary_name "gdcm-nightly-dcmqrscp")
set(dashboard_do_memcheck FALSE)
set(dashboard_do_coverage FALSE)

SET(ENV{GDCM_DATA_ROOT} "$ENV{HOME}/Creatis/gdcmData")
SET(CTEST_GDCM_PIXEL_SPACING_DATA_ROOT "$ENV{HOME}/Dashboards/Theralys/pixelspacingtestimages")
#SET(ENV{CXXFLAGS} "-g -O0 -Wall -W -Wshadow -Wunused -Wno-system-headers -Wno-deprecated -Woverloaded-virtual -Wwrite-strings ")
#SET(ENV{CFLAGS}   "-g -O0 -Wall -W -pedantic -Wno-long-long")

macro(dashboard_hook_init)
  set( dashboard_cache "
GDCM_BUILD_SHARED_LIBS:BOOL=ON
GDCM_BUILD_APPLICATIONS:BOOL=ON

# setup DICOM Q/R
GDCM_DICOM_CLIENT_AETITLE:STRING=ACME1
GDCM_DICOM_SERVER_AETITLE:STRING=ACME_STORE
GDCM_DICOM_SERVER_PEER:STRING=gotlib
GDCM_DICOM_SERVER_PORT:STRING=5678
    "
    )
endmacro(dashboard_hook_init)

include(${CTEST_SCRIPT_DIRECTORY}/gdcm_common.cmake)
