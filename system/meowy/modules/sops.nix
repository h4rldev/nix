{...}:
{
  sops = {
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/home/h4rl/.config/sops/age/keys.txt";
    };

    secrets = {
      anubis_h4rl_dev = {
        format = "dotenv";
        sopsFile = ../../../.secrets/meowy/anubis_h4rl_dev.env;
      };
      
      anubis_nagai_cc = {
        format = "dotenv";
        sopsFile = ../../../.secrets/meowy/anubis_nagai_cc.env;
      };
      
      anubis_webring_pet = {
        format = "dotenv";
	sopsFile = ../../../.secrets/meowy/anubis_webring_pet.env;
      };
      
      collar = {
        format = "dotenv";
	sopsFile = ../../../.secrets/meowy/collar.env;
      };
      
      petring = {
        format = "dotenv";
	sopsFile = ../../../.secrets/meowy/petring.env;
      };
      
      tuwunel = {
        format = "dotenv";
	sopsFile = ../../../.secrets/meowy/tuwunel.env;
      };
      
      livekit = {
        format = "dotenv";
	sopsFile = ../../../.secrets/meowy/livekit.env;
      };
    };
  };
}
