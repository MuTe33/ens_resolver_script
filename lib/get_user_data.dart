import 'package:ens_dart/ens_dart.dart';
import 'package:ens_resolver/setup_ens_client.dart';
import 'package:ens_resolver/utils.dart';

/// based on input, resolves public address or ENS name
Future<Map<String, dynamic>> getUserData(String addressOrEns) async {
  final ensClient = setupEnsClient();

  if (isAddressValid(addressOrEns)) {
    final ens = ensClient.withAddress(addressOrEns);

    String ensName = 'No ENS';
    try {
      ensName = await ens.getName();
    } catch (_) {
      // Throws, if there is no ENS registered for an address - therefore skipping
    }

    final textRecord = await ens.getTextRecord();

    return <String, dynamic>{
      'address': addressOrEns,
      'ens': ensName,
      'records': textRecord.toMap(),
    };
  } else {
    final ens = ensClient.withName(addressOrEns);

    final address = await ens.getAddress();
    final textRecord = await ens.getTextRecord();

    return <String, dynamic>{
      'address': address,
      'ens': addressOrEns,
      'records': textRecord.toMap(),
    };
  }
}
