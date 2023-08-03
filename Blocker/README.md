# Blocker

Blocker is a Simple Bash Script for dealing with IP Address Blocking Using iptables.

## Installation

Use your package manager to install iptables persistent. and copy it to your system Path; for example /usr/local/bin.


```bash
sudo cp blocker.sh /usr/local/bin && sudo chmod +x /usr/local/bin/blocker.sh
```
## Optional

if you want to ckeck the logs for dropped IP Addresses, consider creating new chain:

```bash
iptables -N block
iptables -A block -j LOG --log-prefix "Source host denied"
iptables -A block -j DROP
```

## Usage

```python
sudo blocker {block|unblock|list} IP_ADDRESS

# values used in this script and meanings:
# block: Get List of Blocked IP Addresses
# unblock: Add the Given Address to iptables
# list: Delete the Given ip Address from iptables block list

```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change or send an Email to:
prezaeiw@gmail.com

Please make sure to update tests as appropriate.

## License

[GPL v3.0](https://choosealicense.com/licenses/gpl-3.0/)
