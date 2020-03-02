# create_ap_usage
Base usage of create_ap in Linux

### ***This manual is base on a script in github named [create_ap](https://github.com/oblique/create_ap)***

## 1. Download the script

```
git clone https://github.com/oblique/create_ap.git
```

## 2. Install dependency

```
apt install bash util-linux procps hostapd iproute2 iw
```

## 2. Configuration

### 2.1 Enter the floder
```
cd ~/create_ap
```

### 2.2 Install ***create_ap***

```
make install
```

Then, you could delete the directory

```
cd ~
rm -r ~/create_ap
```

### 2.3 Get information of Network Interface

```
ifconfig
```

Get two Interface Names:

***Physical/Internet Interface***: First two letters are ***"en"***

***WLAN Interface***: First two letters are ***"wl"***

### 2.4 Configure file( `/etc/create_ap.conf` )


Adjust these items:

```
WIFI_IFACE=wlp3s0          #Your WLAN Interface Name
NTERNET_IFACE=enp2s0       #Your Physical/Internet Interface Name
SSID=GKD                   #Your WiFi Name
PASSPHRASE=200403404       #Your WiFi Password
```

### 2.5 Start/Enable/Restart/Status
```
systemctl start create_ap.service
systemctl enable create_ap.service  #Optional
systemctl status create_ap.service
```
