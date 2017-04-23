{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
		];

	boot.loader.grub = {
		enable = true;
		version = 2;
		device = "/dev/sda"; # or "nodev" for efi only
			extraEntries = " 
			menuentry 'Ubuntu Linux' {
				configfile (hd0,6)/boot/grub/grub.cfg
			}
		";
	};

	networking.hostName = "enceladus"; # Define your hostname.
		networking.networkmanager.enable = true;

	# Select internationalisation properties.
	i18n = {
		consoleFont = "Lat2-Terminus16";
		consoleKeyMap = "us";
		defaultLocale = "en_US.UTF-8";
	};

	# Set your time zone.
	time.timeZone = "Europe/Zurich";

	programs.zsh.enable = true;

	# List packages installed in system profile. To search by name, run:
	# $ nix-env -qaP | grep wget
	nixpkgs.config = {
		allowUnfree = true;
		firefox = {
			enableGoogleTalkPlugin = true;
		};
	};
	
	environment.systemPackages = with pkgs; [
		gcc
		gnumake
		gitAndTools.gitFull
		exif
		binutils
		global
		clang
		python
		inetutils
		which
		
		htop
		iotop
		acpi
		acpitool
		tpacpi-bat
		tlp
		
		tmux
		screen
		terminator
		vim
		zsh
		wget
		curl
		inotify-tools
		stow
		xclip
		
		i3blocks
		i3status
		i3lock
		dmenu
		
		firefox-esr
		xfce.thunar
		xfce.thunar_volman
		xfce.xfce4volumed
		xfce.xfce4_power_manager
		volumeicon
		gnome3.networkmanagerapplet	
		gnome3.networkmanager_openvpn
		gnome3.cheese
		nitrogen
		cbatticon
		redshift
		xbrightness
		
		gnome3.gedit	
		zathura
		gpicview
		keepass
		ranger
		spotify
		transmission_gtk
		vlc
		
		openvpn
		franz
	];

	services = {
		# Enable the OpenSSH daemon.
		openssh.enable = true;
		
		# transmission
		transmission.enable = true;
	
		# Enable CUPS to print documents.
		printing.enable = true;
		
		# Let xfce4-powermanager handle lid close events	
		logind.extraConfig = "HandleLidSwitch=ignore";
		
		# Enable the X11 windowing system.
		xserver = {
			enable = true;
			layout = "us";
			xkbOptions = "ctrl:nocaps";
			displayManager.lightdm.enable = true;
			windowManager.i3.enable = true;
			synaptics = {
				enable = true;
				twoFingerScroll = true;
				palmDetect = true;
			};
		};
		
		# redshift
		redshift = {
			enable = true;
			latitude = "47.3769";
			longitude = "8.5417";
		};

		tlp.enable = true;
	};




	# getting trackpoint working
	hardware.trackpoint = {
		enable = true;
		emulateWheel = true;
	};

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.extraUsers.sri= {
		isNormalUser = true;
		uid = 1000;
		home = "/home/sri/";
		shell = "/run/current-system/sw/bin/zsh";
		extraGroups = [ "wheel" "networkmanager" "video" "audio" "transmission"];
	};

	fonts = {
		enableFontDir = true;
		enableGhostscriptFonts = true;
		fonts = with pkgs; [
			corefonts
				inconsolata
				ubuntu_font_family
				unifont
				font-awesome-ttf
		];
	};
	
	boot.extraModprobeConfig = ''
		options snd_hda_intel enable=0,1
		'';

# The NixOS release to be compatible with for stateful data such as databases.
	system.stateVersion = "17.03";

}
