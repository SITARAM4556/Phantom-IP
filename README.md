# 🕵️‍♂️ PhantomIP

**PhantomIP** is a stealthy, rotating VPN switcher that changes your IP address every 10 seconds using multiple WireGuard configs. Designed for true privacy ninjas.

## 🔧 Features
- Rapid IP rotation (default: every 10 seconds)
- Works on Linux, macOS, and Termux
- WireGuard-based privacy
- Optional kill switch for leak-proof rotation

## 📁 Setup

1. Add your `.conf` files inside `wg_confs/`:
      Mullvad (Recommended for Privacy)
      Create an account: Mullvad Registration
      After logging in, go to the WireGuard section.
      Generate a WireGuard config: Mullvad allows you to generate custom configuration files for various locations.
      Download the .conf files for the regions you want to use.

2. Make the script executable:
```bash
chmod +x rotate.sh

3. Run it:
sudo ./rotate.sh

🔐 Kill Switch (Optional)
sudo iptables -I OUTPUT ! -o wg0 -m mark ! --mark 51820 -j DROP

Use this to block all traffic that doesn't go through WireGuard.





