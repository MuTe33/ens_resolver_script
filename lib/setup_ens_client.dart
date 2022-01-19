import 'package:ens_dart/ens_dart.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

/// setup client to connect directly to the blockchain via infura
Ens setupEnsClient() {
  // get a free infura API key from https://infura.io/
  const infuraKey = 'YOUR_API_KEY';
  const rpcUrl = 'https://mainnet.infura.io/v3/$infuraKey';

  final client = Web3Client(rpcUrl, Client());

  return Ens(client: client);
}
