include stdlib

class quest (
  $user       = $::quest::params::user,
  $quest_repo = $::quest::params::quest_repo
) inherits ::quest::params {

  package { 'rubygems':
    ensure => present,
  }
  
  package { 'ruby-devel':
    ensure => present,
  }

  package { 'git':
    ensure => present,
  }

  vcsrepo { '/usr/src/courseware-lvm':
    ensure   => present,
    provider => git,
    source   => $quest_repo,
  }

# Install the quest gem
  package { 'quest':
    ensure   => present,
    provider => 'gem',
  }

#install tmux
  package { 'tmux':
    ensure => present,
  }

# Set up tmux to display quest status
  file { "/${user}/.tmux.conf":
    ensure => present,
    source => 'puppet:///modules/quest/tmux.conf',
  }

# Set bash_history to update after every command.
  file_line { 'always_update_bash_history':
    path => "/${user}/.bashrc",
    line => "PROMPT_COMMAND='history -a'"
  }

}
