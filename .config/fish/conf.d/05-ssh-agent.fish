# SSH agent management
set -l SSH_ENV $HOME/.ssh/agent_env

function __start_ssh_agent
    eval (ssh-agent -s) > /dev/null
    ssh-add -q ~/.ssh/id_ed25519 2>/dev/null
    echo "set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK" > $SSH_ENV
    echo "set -gx SSH_AGENT_PID $SSH_AGENT_PID" >> $SSH_ENV
    chmod 600 $SSH_ENV
end

if test -z "$SSH_AUTH_SOCK"; or not ssh-add -l &>/dev/null
    if test -f $SSH_ENV
        source $SSH_ENV > /dev/null 2>&1
    end
    if test -z "$SSH_AGENT_PID"; or not kill -0 $SSH_AGENT_PID 2>/dev/null
        __start_ssh_agent &
    end
end
