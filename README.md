# Quest

## Module Description
Set up the [quest](https://github.com/puppetlabs/quest) tool.


## Usage

### Default

This will set up the quest tool and content for the Learning VM Quest Guide.

```
include quest
```

### Set quest content repository

```
  class { 'quest':
    quest_repo => 'https://github.com/puppetlabs/courseware-lvm/',
  }
```
