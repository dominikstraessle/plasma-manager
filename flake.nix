{
  description = "Manage KDE Plasma with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    utils.url = "github:numtide/flake-utils";

    gomod2nix = {
      url = "github:tweag/gomod2nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.utils.follows = "utils";
    };
  };

  outputs = inputs@{ self, gomod2nix, ... }:
    let
      # Systems that can run tests:
      supportedSystems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];

      # Function to generate a set based on supported systems:
      forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

      # Attribute set of nixpkgs for each system:
      nixpkgsFor = forAllSystems (system:
        import inputs.nixpkgs {
          inherit system;
          overlays = [ gomod2nix.overlays.default ];
        });
    in {
      homeManagerModules.plasma-manager = { ... }: { imports = [ ./modules ]; };

      packages = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          default = self.packages.${system}.cmd;

          cmd = pkgs.gomod2nix.buildGoApplication {
            pname = "cmd";
            version = "1.0.0";
            src = ./.;
            modules = ./gomod2nix.toml;
          };

          demo = (inputs.nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              (import test/demo.nix {
                pkgs = nixpkgsFor.x86_64-linux;
                home-manager = inputs.home-manager;
                module = self.homeManagerModules.plasma-manager;
                extraPackages = with self.packages.${system}; [ cmd ];
              })
            ];
          }).config.system.build.vm;
        });

      apps = forAllSystems (system: {
        default = self.apps.${system}.cmd;

        demo = {
          type = "app";
          program = "${self.packages.${system}.demo}/bin/run-plasma-demo-vm";
        };

        cmd = {
          type = "app";
          program = "${self.packages.${system}.cmd}/bin/plasma-manager";
        };
      });

      checks = forAllSystems (system:
        let
          test = path:
            import path {
              pkgs = nixpkgsFor.${system};
              home-manager = inputs.home-manager;
              module = self.homeManagerModules.plasma-manager;
            };
        in { default = test ./test/basic.nix; });

      devShells = forAllSystems (system: {
        default = nixpkgsFor.${system}.mkShell {
          buildInputs = with nixpkgsFor.${system}; [
            go
            gopls
            gotools
            go-tools
            gomod2nix.packages.${system}.default
          ];
        };
      });
    };
}
