with import <nixpkgs> {}; {
     dotfiles = stdenv.mkDerivation rec {
          name = "dotfiles";
          version = "1.1.1.1";
          buildInputs = [ 
		stow
          ];
     };
}
