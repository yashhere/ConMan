echo "loading bash_profile"
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

source ~/.profile

# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

. /etc/infinality-settings.sh

#SSH_ENV="$HOME/.ssh/environment"

# function start_agent {
    # echo "Initialising new SSH agent..."
    # /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    # echo succeeded
    # chmod 600 "${SSH_ENV}"
    # . "${SSH_ENV}" > /dev/null
    # /usr/bin/ssh-add;
# }

# Source SSH settings, if applicable

# if [ -f "${SSH_ENV}" ]; then
    # . "${SSH_ENV}" > /dev/null
    # ps ${SSH_AGENT_PID} doesn't work under cywgin
    # ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        # start_agent;
    # }
# else
    # start_agent;
# fi
