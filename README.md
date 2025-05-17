# nix

This is a NixOS configuration that I use on my home computer and laptop.

## Installation

To install this configuration, run the following command:

```bash
curl -L https://raw.githubusercontent.com/h4rldev/nix/main/install | bash
```

This will install the NixOS configuration to your `${XDG_CONFIG_HOME}/nix` directory.

> [!NOTE]
> Be sure to enable the flakes feature in your NixOS configuration before running this script.

## Usage

To update the NixOS configuration, run the following command:

```bash
update-nix
```

This will update the NixOS configuration to the latest version.
For more information, run the following command:

```bash
update-nix --help
```

## Contributing

Contributions are welcome! If you have any suggestions or improvements, please open an issue or submit a pull request.

## License

This project is not licensed, and under the public domain, it was created by me, h4rl, and is available for anyone to use and modify.
I do not claim any ownership for any projects installed using this configuration, and I am not responsible for any damage caused by using this configuration.
