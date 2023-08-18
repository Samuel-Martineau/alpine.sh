# Copyright 2021,2022 Henrique Borges

profile_custom() {
    profile_standard
    title="Custom"
    desc="Alpine with a custom answerfile and post-installation script"
    profile_abbrev="cst"
    apks="$apks alpine.sh"
}
