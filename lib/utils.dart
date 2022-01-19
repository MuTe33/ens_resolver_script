/// validates eth addresse ('0xb2ebc9b3a788afb1e942ed65b59e9e49a1ee500d')
/// must start with '0x' followed by max. 40 chars = total 42 chars allowed
bool isAddressValid(String address) {
  final addressRegExp = RegExp(r'^0x[0-9a-fA-F]{40}$');

  return addressRegExp.hasMatch(address);
}

/// validates ens name ('brantly.eth')
/// must have at least 1 starting char, no special chars and end with '.eth'
bool isEnsValid(String ens) {
  final ensRegExp = RegExp(r'^[0-9a-zA-Z]{1,}(.eth)$');

  return ensRegExp.hasMatch(ens);
}
