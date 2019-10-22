# Utility Tools for Raspi

**List of apps**:

1. Take screenshot: Capture screen display to picture file and upload to Dropbox - `See configuration for Dropbox upload`
2. [Dropbox Uploader](https://github.com/andreafabrizi/Dropbox-Uploader) - Download / Upload files from Dropbox - only need **cURL**

## Quick Install

`curl -sL https://raw.githubusercontent.com/neural-display/tools/master/installer.sh | bash -`

## How to Use

1. Use alone in Raspbian

`./take_screenshot`

2. Use with Balena Cloud
> Please mind to read [Balena Getting Started]() to learn how to create `Multicontainer app` first. This `tools` run as a `container service` in Balena application.
> Ater you build Balena application succesfully (see a awesome unicorn rise up), follow belows.

On [Balena.io](https://dashboard.balena-cloud.com/apps), configure `Service Variables` as belows:

```sh
# Dropbox configurations
DROPBOX_SECRET=<Your Dropbox Secret>

# Screenshot configurations, any number that fixed your screen resolution
SCREEN_HEIGHT=1920
SCREEN_WIDTH=1080
```

- Open [Balena Dashboard](https://dashboard.balena-cloud.com/apps).
- Go to your application. eg `awesome-app`
- Click on a device you want to check eg. `awesome-dev`, chose `tools` in the **Terminal - Selec a target**

- Just type `./take_screenshot` and voilà :].

### Take Screenshot

Small bash script to take screenshot and named output file as format below:

Filename format: `<device-name>-<device-id>-<timestamp>.bmp`

And use `dropxbox_uploader.sh` to upload direct to my Dropbox - I will get Dropbox notification when upload finish.

### Dropbox Tools

I already download `dropbox_uploader.sh` for easy to build docker app. You can download the script manually using this command:

`curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh`

and edit dropbox config file location

`CONFIG_FILE=.dropbox_uploader`

Read more in [Dropbox Uploader](https://github.com/andreafabrizi/Dropbox-Uploader) for details.

### Balena Dockerfile

I included `Dockerfile.template` for [Balena](balena.io) service for convenient.