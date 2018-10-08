{ pkgs ? import <nixpkgs> {}
}:

with pkgs;

mkShell {
        nativeBuildInputs = [
                         gcc
                         binutils
                         cmake
                         git
        ];
}
