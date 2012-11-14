<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
  <head>
  <title>Overlay du BR</title>
</head>

<body>

<h2>Overlay</h2>
<p>
Ceci est l'overlay du BR, utilisé pour distribuer les différents paquets propres.<br />
Pour les autres, il suffit d'ajouter la ligne suivante dans <em>/etc/layman/layman.cfg</em>, à la suite de la ligne "standard" :
</p>
<code>http://overlay.eleves.polytechnique.fr/layman.xml</code>

<h3>Paquets disponibles</h3>
Les paquets suivants sont disponibles dans cet overlay :<br />
<?php
$pkgs_dir = "/home/overlay/rsync_export";
$versions = array();

// Read available ebuilds
$dir = opendir($pkgs_dir);
while(false !== ($cat = readdir($dir))) {
	if ($cat != "." && $cat != ".." && $cat != "profiles" && $cat != "metadata" && $cat != "README") {
		$cat_pkgs = opendir("$pkgs_dir/$cat");
		while(false !== ($pkgname = readdir($cat_pkgs))) {
			if($pkgname != "." && $pkgname != "..") {
				$pkg_full = "$cat/$pkgname";
				$versions[$pkg_full] = array();
				$pkg_versions = opendir("$pkgs_dir/$cat/$pkgname");
				while(false !== ($ebuild = readdir($pkg_versions))) {
					if(strlen($ebuild) > 7 && substr($ebuild, -7) == ".ebuild"){
						$version = substr($ebuild, strlen($pkgname)+1, -7);
						$versions[$pkg_full][] = $version;
					}
				}
				closedir($pkg_versions);
				sort($versions[$pkg_full]);
			}
		}
		closedir($cat_pkgs);
	}
}
closedir($dir);

ksort($versions);

echo "<ul>\n";
foreach($versions as $packet => $pkg_versions) {
	echo "\t<li>$packet: " . implode(", ", $pkg_versions) . "</li>\n";
}
echo "</ul>\n";
?>
</body>
</html>
