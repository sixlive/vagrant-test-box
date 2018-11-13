#  Vagrant Test Box(s)
The goal for this box is to be able to provide a generic, multi-purpose, test box(s). One of the primary uses is for local testing of Ansible configurations or multi-server deployment workflows.

## User Accounts
This box automatically creates a local user for your account using the `whoami` comman and it adds your public ssh key from `~/.ssh/id_rsa.pub` to that users `authorized_keys` file.

### ⚠️ SSH Host Keys
To avoid SSH host key collisions it re-uses the same SSH host keys. If there is a collision edit your `~/.ssh/known_hosts` file and search for any of the IP addresses listed in the `Vagrantfile`.

## Hosts
The configuration ships with 3 hosts out of the box. To enable the other hosts just uncomment them in the Vagrant file. You can easily add more if you need by copying and pasting the configuration and updating the hostname + IP.

| Hostname | IP | Enabled |
|:-:|:-:|:-:|
| web01 | 192.168.33.10 | ✅ |
| web02 | 192.168.33.11 | ❌ |
| web03 | 192.168.33.12 | ❌ |

## Security
If you discover any security related issues, please email oss@tjmiller.co instead of using the issue tracker.

## Credits
- [TJ Miller](https://github.com/sixlive)
- [All Contributors](../../contributors)

## License
The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
