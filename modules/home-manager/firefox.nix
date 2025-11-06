{ config, lib, ... }:
with lib;
  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
  options = {
    dan.firefox = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable firefox";
      };
    };
  };

  config.programs = mkIf config.dan.firefox.enable {
    firefox = {
      enable = true;
      languagePacks = [ "en-US" ];

      # TODO why this no work?
      # profiles = {
      #   default = {
      #     bookmarks = {
      #     };
      #   };
      # };

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "always"; # "always", "never", or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        OfferToSaveLogins = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        SearchBar = "unified"; # alternative: "separate"
        SearchEngines = {
          default = "DuckDuckGo";
          preventInstalls = true;
        };

        /* ---- EXTENSIONS ---- */
        # Check about:support for extension/add-on ID strings. (or search for "guid" in page source}
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            # install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4598854/ublock_origin-1.67.0.xpi";
            installation_mode = "force_installed";
          };
          # Privacy Badger:
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };
          # Dark Reader
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4488139/darkreader-4.9.106.xpi";
            installation_mode = "force_installed";
          };
          # BitWarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4493940/bitwarden_password_manager-2025.5.0.xpi";
            installation_mode = "force_installed";
          };
          # Old Reddit Redirect
          "{9063c2e9-e07c-4c2c-9646-cfe7ca8d0498}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4472856/old_reddit_redirect-2.0.5.xpi";
            installation_mode = "force_installed";
          };
          # Sponsor block
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4608179/sponsorblock-6.1.0.xpi";
            installation_mode = "force_installed";
          };
          # Hide Youtube shorts
          "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4579182/hide_youtube_shorts-1.8.8.xpi";
            installation_mode = "force_installed";
          };
        };

        /* ---- PREFERENCES ---- */
        # Check about:config for options.
        Preferences = {
          "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;
          "browser.search.suggest.enabled" = lock-false;
          "browser.search.suggest.enabled.private" = lock-false;
          "browser.urlbar.suggest.searches" = lock-false;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        };
      };
    };
  };
}
