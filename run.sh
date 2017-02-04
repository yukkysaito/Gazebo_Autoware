#! /bin/bash
MY_PATH=$(readlink -f  $(dirname $0))

# what type of terminal
OPTION_TITLE='--title'
OPTION_WORKING_DIR='working-directory'
OPTION_CORE_GEOMETRY='--geometry=50x10+0+0'
OPTION_RM_GEOMETRY='--geometry=50x10+500+0'
OPTION_COMMAND='--command'

if [ $(which gnome-terminal) ]; then
    TERMINAL=gnome-terminal
elif [ $(which mate-terminal) ]; then
    TERMINAL=mate-terminal
elif [ $(which xfce4-terminal) ]; then
    TERMINAL=xfce4-terminal
elif [ $(which lxterminal) ]; then
    TERMINAL=lxterminal
elif [ $(which konsole) ]; then
    TERMINAL=konsole
    OPTION_WORKING_DIR='workdir'
    OPTION_CORE_GEOMETRY=''
    OPTION_RM_GEOMETRY=''
    OPTION_PM_GEOMETRY=''
    OPTION_COMMAND='-e'
    OPTION_TITLE='-T'
fi

echo "Process Manager"

# boot gzserver
${TERMINAL} ${OPTION_CORE_GEOMETRY} ${OPTION_TITLE}="gzserver" --${OPTION_WORKING_DIR}=${MY_PATH} ${OPTION_COMMAND}="bash -c 'source ./devel/setup.bash; roslaunch catvehicle catvehicle_skidpan.launch'"&

# boot runtime_manager
${TERMINAL} ${OPTION_RM_GEOMETRY} ${OPTION_TITLE}="runtime_manager" --${OPTION_WORKING_DIR}=${MY_PATH} ${OPTION_COMMAND}="bash -c 'source ./devel/setup.bash; gzclient'"