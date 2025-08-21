{ config, pkgs, ... }:

{
  services.samba = {
    enable = true;
    # Configure firewall manually
    openFirewall = false;
    
    # Global samba settings for security
    settings = {
      global = {
        workgroup = "JEDI";
        "server string" = "arc";
        "netbios name" = "arc";
        security = "user";
        "map to guest" = "never";
        # Disable older, insecure protocols
        "min protocol" = "SMB2";
        "client min protocol" = "SMB2";
      };
      
      transfers = {
        path = "/media/data/samba/transfers";
        browseable = true;
        writable = true;
        # Disable guest access for security
        "guest ok" = false;
        # Only allow specific users
        "valid users" = "jonw";
        # Set secure file permissions
        "create mask" = "0644";
        "directory mask" = "0755";
        # Additional security settings
        "force user" = "jonw";
        "force group" = "users";
      };
    };
  };
