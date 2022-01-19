import 'dart:io';

import 'package:args/args.dart';
import 'package:ens_resolver/get_user_data.dart';
import 'package:ens_resolver/utils.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser();
  parser.addOption(
    'input',
    abbr: 'i',
    help: 'Address or ENS to resolve',
  );

  // parse and validate input data
  final args = _parseAndValidateArguments(parser, arguments);

  // fetches user data from the blockchain
  final result = await getUserData(args['input']);

  stdout.writeln(result);
  exit(0);
}

ArgResults _parseAndValidateArguments(
  ArgParser parser,
  List<String> arguments,
) {
  try {
    final args = parser.parse(arguments);

    if (args.arguments.isEmpty) {
      throw Exception(
        'No argument found, please provide a valid address or ENS: ${parser.usage}',
      );
    }

    _validateMandatoryArgs(args);
    return args;
  } on ArgParserException {
    stderr.writeln(
      'Could not parse argument, please use a valid argument: ${parser.usage}',
    );
    exit(0);
  } catch (e) {
    stderr.writeln(e);
    exit(0);
  }
}

void _validateMandatoryArgs(ArgResults args) {
  if (!args.wasParsed('input')) {
    throw Exception(
      'Please provide a address or ENS argument using the -i or --input parameter',
    );
  }

  if (!isAddressValid(args['input']) && !isEnsValid(args['input'])) {
    throw Exception(
      'Input value is neither a valid address nor a valid ENS. Please use a valid input',
    );
  }
}
