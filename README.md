# pretty-exit-status
Shell include that shows the status of the last-executed process

To use:

1) Save pretty-exit-status.sh somewhere sensible.
(e.g., ~/.pretty_exit_status.sh)

2) In your .bashrc or .bash_profile, add the following:

    source ~/.pretty_exit_status.sh

(or wherever you saved the script)

3) Later on in that same .bashrc or .bash_profile, put the following
somewhere in the PS1 variable:

    $(pretty_exit_status $?)

For example, if you just want to prefix your current prompt,
just do:

    export PS1='$(pretty_exit_status $?)\n'$PS1

That’s it! :)
