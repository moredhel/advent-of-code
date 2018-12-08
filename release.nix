{ mkDerivation, aeson, base, parsec, stdenv, text, turtle }:
mkDerivation {
  pname = "advent-of-code";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ aeson base parsec text turtle ];
  license = stdenv.lib.licenses.bsd3;
}
