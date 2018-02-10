#!/bin/sh
# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
ZENITY_COMMON=(--no-wrap --title="Borg backup" )
gui_warn() { zenity --warning "${ZENITY_COMMON[@]}" --text="$*" >/dev/null 2>&1; }
gui_error() { zenity --error "${ZENITY_COMMON[@]}" --text="$*" >/dev/null 2>&1; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

# Setting this, so you won't be asked for your repository passphrase:
until BORG_PASSPHRASE=$(python /home/hanny/.bin/pass.py copy 'Borg backup'); do
    info "Invalid password. Try again!"
done
export BORG_PASSPHRASE="${BORG_PASSPHRASE}"

# or this to ask an external program to supply the passphrase:
#export BORG_PASSCOMMAND="zenity --password ${ZENITY_COMMON[@]} 2>/dev/null"

if ! mount | grep 'files-users' > /dev/null; then
    info "Mounting target filesystem"

    if ! /home/hanny/.bin/mount-files.sh; then
        info "Failed to mount target filesystem"
        gui_error "Failed to mount target filesystem"
        exit 1
    fi
fi

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

run_backup() {
    borg create                         \
        --verbose                       \
        --filter AME                    \
        --list                          \
        --stats                         \
        --show-rc                       \
        --compression lz4               \
        --exclude-caches                \
        --exclude '/home/*/.cache/*'    \
        --exclude '/var/cache/*'        \
        --exclude '/var/tmp/*'          \
        --exclude '/home/hanny/.cache' \
        --exclude '/home/hanny/.gradle/caches' \
        --exclude '/home/hanny/.m2/repository' \
        --exclude '/home/hanny/.ivy2/cache' \
        --exclude '/home/hanny/.coursier' \
        --exclude '/home/hanny/.cargo' \
        --exclude '/home/hanny/VirtualBox VMs' \
        --exclude '/home/hanny/.IntelliJIdea2017.3/system' \
        --exclude '/home/hanny/.gradle' \
        --exclude '/home/hanny/.rustup' \
        --exclude '/home/hanny/.local/share/Trash/' \
        --exclude '/home/hanny/pCloudDrive' \
        --exclude '/home/hanny/.pcloud' \
        ::'{hostname}-{now}'            \
        /home/hanny                     \

    backup_exit=$?
    info "Pruning repository"

    borg prune                          \
        --list                          \
        --prefix '{hostname}-'          \
        --show-rc                       \
        --keep-daily    7               \
        --keep-weekly   4               \
        --keep-monthly  6               \

    prune_exit=$?

    # use highest exit code as global exit code
    global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

    if [ ${global_exit} -eq 1 ];
    then
        info "Backup and/or Prune finished with a warning"
        gui_warn "Backup and/or Prune finished with a warning"
    fi

    if [ ${global_exit} -gt 1 ];
    then
        info "Backup and/or Prune finished with an error"
        gui_error "Backup and/or Prune finished with an error"
    fi
}

export BORG_REPO=/mnt/strnad/borg
#run_backup

export BORG_REPO=/home/hanny/pCloudDrive/Backup/Borg
run_backup
