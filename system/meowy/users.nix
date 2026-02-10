{...}: {
  users = {
    users.h4rl.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFq7yY1MfXBt9iX/gfV5VsIhvqGuy0Z2QRquLc4rTENN h4rl@nisemono"
    ];
    users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFq7yY1MfXBt9iX/gfV5VsIhvqGuy0Z2QRquLc4rTENN h4rl@nisemono"
    ];
  };
}
