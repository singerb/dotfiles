set -x JAVA_HOME /usr/lib/jvm/java-6-sun
set -x P4CONFIG .p4rc
set -x EDITOR vim
set -x PATH /usr/local/bin $PATH

if test "$DISPLAY" != ""
    set -x P4DIFF tkdiff
else
    set -x P4DIFF diff
end
