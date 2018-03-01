{ stdenv, fetchurl, fetchpatch }:

stdenv.mkDerivation rec {
  name= "riot-web-${version}";
  version = "0.13.5";

  src = fetchurl {
    url = "https://github.com/vector-im/riot-web/releases/download/v${version}/riot-v${version}.tar.gz";
    sha256 = "1ap62ksi3dg7qijxxysjpnlmngzgh2jdldvb8s1jx14avanccch6";
  };

  installPhase = ''
    mkdir -p $out/
    cp -R . $out/
  '';

  meta = {
    description = "A glossy Matrix collaboration client for the web";
    homepage = http://riot.im/;
    maintainers = with stdenv.lib.maintainers; [ bachp ];
    license = stdenv.lib.licenses.asl20;
    platforms = stdenv.lib.platforms.all;
    hydraPlatforms = [];
  };
}
