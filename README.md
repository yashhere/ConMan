# ConMan
> A python script to manage configuration files in Linux and automatically symlink them to their desired place.

```
 _______  _____  __   _ _______ _______ __   _
 |       |     | | \  | |  |  | |_____| | \  |
 |_____  |_____| |  \_| |  |  | |     | |  \_|

```

## Features
- Written in Python 3, so it is easy to set it up on fresh installation.
- Can manage configurations kept in different directories and can symlink them to their desired locations.
- You just need to write one configuration file to manage all your configuration files.
- All configuration files are backed up before symlinking, so no data loss possibility.
- As everything is symlinked, it is very easy to modify any configuration and get commit and push it.
- Each and every configuration folder and file reside in one folder, hence it is very easy to track and version control it.
- Stupidly [easy to use](https://github.com/yashhere/ConMan#usage). Just setup the `dotfiles.json` file and then run `configure.py`


## Installation
No need to install anything. Just clone and use.

```bash
git clone https://github.com/yashhere/ConMan
```

# Details
Let's have a look at the directory structure
```
|-- configure.py
|-- current_status
|-- dotfiles
|   |-- dunst
|   |-- gtk-3.0
|   |-- i3
|   |-- nvim.vimrc
|   |-- polybar
|   |-- README.md
|   |-- redshift.conf
|   |-- sublime
|   |-- termite
|   `-- vimrc
|-- dotfiles.json
|-- LICENSE
|-- Pipfile
|-- Pipfile.lock
`-- README.md
```

- During the initial setup, only `configure.py`, `dotfiles.json` and `dotfiles` directory is needed. Your dotfiles and configuration files go inside the `dotfiles` directory. This directory can be downloaded from any git repository also.

- The `dotfiles.json` contains all the details about src and dest locations of your config files and folders.

- The backups directory directory will create backups of your current configuration files and folders if any found at the destination location given in `dotfiles.json`.

- The current_status file contains the details of all the configurations that have been symlinked using this script.

## Usage
It is recommended to use a virtual environment to set up the dependencies of this script. I recommend using [pipenv](http://pipenv.readthedocs.io/en/latest/install) for this purpose. Once you have setup a virtual environment, install all the dependencies.

- If your configuration files are online, then you don't need to do anything. The script will automatically download the files from the location specified in the dotfiles.json. If you already have all the files and folders in place, then the script will first backup them before doing any symlinking.
- Place `dotfiles.json` in the same folder. A sample `dotfiles.json` is provided with this repository. Edit this file to suit your needs.
- Then run the script with `python configure.py`. The script will first take the backup of all the existing files and folders and then symlinks the configuration files in dotfiles folder to their respective locations.

## Contributing
- If you encounter any bug or want any new feature, feel free to open an issue.
- Pull requests are welcome.
