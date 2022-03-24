#include "work.cpp"
#include "libDarwin.cpp"

#define Arch "amd64"
#define Darwin "Darwin"

MarchFrpLauncher marchfrplauncher(get_cur_executable_path_(), Arch, Darwin);

int main() {
	return marchfrplauncher.main();
}