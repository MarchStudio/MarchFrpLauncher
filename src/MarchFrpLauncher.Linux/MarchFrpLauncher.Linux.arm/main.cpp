#include "work.cpp"
#include "libs.h"

#define Arch "arm"

MarchFrpLauncher marchfrplauncher(get_cur_executable_path_(), Arch);

int main() {
	return marchfrplauncher.main();
}