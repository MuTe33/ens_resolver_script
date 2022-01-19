# Super simple ENS/Address Resolver Dart Script

## Usage

Before running the script, had over to [Infura](https://infura.io/) and get a free API key. Assign
the API key to `infuraKey` at `setup_ens_client.dart`. After that you can call the script with the 
below commands.

### Using an ENS
```
dart bin/ens_resolver.dart -i brantly.eth
```

### Using an Address
```
dart bin/ens_resolver.dart -i 0x983110309620d911731ac0932219af06091b6744
```