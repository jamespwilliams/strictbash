{
  description = "Bash strict mode in one simple shebang";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        name = "strictbash";
        buildInputs = with pkgs; [ bash shellcheck ];
        script = (pkgs.writeScriptBin name (builtins.readFile ./strictbash)).overrideAttrs(old: {
          buildCommand = "${old.buildCommand}\n patchShebangs $out";
        });
      in rec {
        defaultPackage = packages.strictbash;
        packages.strictbash = pkgs.symlinkJoin {
          name = name;
          paths = [ script ] ++ buildInputs;
          buildInputs = [ pkgs.makeWrapper ];
          postBuild = "wrapProgram $out/bin/${name} --prefix PATH : $out/bin";
        };
      }
    );
}
