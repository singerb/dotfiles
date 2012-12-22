function fish_prompt
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __my_fish_prompt_hostname
        set -g __my_fish_prompt_hostname (hostname | cut -d . -f 1)
    end

    if test -e /etc/debian_chroot; and not set -q __my_fish_chrootname
        set -g __my_fish_chrootname (cat /etc/debian_chroot)
    end

    if set -q __my_fish_chrootname
        echo -n \({$__my_fish_chrootname}\)
        echo -n ' '
    end

    echo -n {$USER}@{$__my_fish_prompt_hostname}:
    set_color $fish_color_cwd
    echo -n (pwd | sed -e "s|$HOME|~|")
    set_color normal
    echo -n ' > '
end
