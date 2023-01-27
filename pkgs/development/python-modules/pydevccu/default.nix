{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pydevccu";
  version = "0.1.5";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "danielperna84";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-scgWD40jjt8qPGygV11Rfd4Z1voBlErScabLLcmQqGg=";
  };

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [
    "pydevccu"
  ];

  meta = with lib; {
    description = "HomeMatic CCU XML-RPC Server with fake devices";
    homepage = "https://github.com/danielperna84/pydevccu";
    changelog = "https://github.com/danielperna84/pydevccu/releases/tag/${version}";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
