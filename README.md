# create_ap_usage
Base usage of create_ap in Linux

There are 2 choices

## Choice1:Automatic (Recommended)

Only Use `bash go.sh` to configure it!

## Choice2:Manual

### ***This manual is base on a project in github named [create_ap](https://github.com/oblique/create_ap)***

## 1. Download the project

```
git clone https://github.com/oblique/create_ap.git
```

## 2. Install dependencies

```
apt install bash util-linux procps hostapd iproute2 iw
```

## 3. Configuration

### 3.1 Enter the floder
```
cd ~/create_ap
```

### 3.2 Install ***create_ap***

```
make install
```

Then, you could delete the directory

```
cd ~
rm -r ~/create_ap
```

### 3.3 Check information of Network Interface

```
ifconfig
```

#### Record two Interface Names:

#### Diffrent kinds of Network Devices may have diffrent names, You chould use these rules to identify them below.

<1> ***Physical/Internet Interface***: First two letters are ***"en"***

<2> ***WLAN Interface***: First two letters are ***"wl"***

### 3.4 Configure file( `/etc/create_ap.conf` )


Adjust these items:

```
WIFI_IFACE=wlp3s0          #Your WLAN Interface Name
INTERNET_IFACE=enp2s0       #Your Physical/Internet Interface Name
SSID=GKD                   #Your WiFi Name
PASSPHRASE=200403404       #Your WiFi Password
```

## 4 Start/Enable/Restart/Status
```
systemctl start create_ap.service
systemctl enable create_ap.service  #Optional
systemctl status create_ap.service
```
