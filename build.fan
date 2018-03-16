using build

class Build : BuildPod {

	new make() {
		podName = "cryptoPals"
		summary = "My Awesome CryptoPals Project"
		version = Version("1.0")

		meta = [
			"proj.name" : "CryptoPals"
		]

		depends = [
			"sys 1.0",
				"web 1.0"
		]

		srcDirs = [`fan/`, `fan/set1/`, `fan/utils/`, `fan/utils/lang/`, `test/`, `test/challanges/`]
		resDirs = [,]

		docApi = true
		docSrc = true
	}
}
