# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = ProjectPlannerApplication

CONFIG += sailfishapp

SOURCES += src/ProjectPlannerApplication.cpp \
    src/category.cpp \
    src/categorylist.cpp \
    src/datastorer.cpp \
    src/datastorertask.cpp \
    src/task.cpp \
    src/tasklist.cpp

DISTFILES += qml/ProjectPlannerApplication.qml \
    qml/cover/CoverPage.qml \
    qml/pages/CategoryEditor.qml \
    qml/pages/CategoryViewPage.qml \
    qml/pages/FixedCategoryEditor.qml \
    qml/pages/Menu.qml \
    qml/pages/TaskEditor.qml \
    qml/pages/TaskViewPage.qml \
    qml/project_templates/fixed_categories.json \
    qml/project_templates/fixed_tasks.json \
    rpm/ProjectPlannerApplication.changes.in \
    rpm/ProjectPlannerApplication.changes.run.in \
    rpm/ProjectPlannerApplication.spec \
    rpm/ProjectPlannerApplication.yaml \
    translations/*.ts \
    ProjectPlannerApplication.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/ProjectPlannerApplication-ru.ts

HEADERS += \
    src/category.h \
    src/categorylist.h \
    src/datastorer.h \
    src/datastorertask.h \
    src/task.h \
    src/tasklist.h
