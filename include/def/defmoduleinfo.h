#ifndef DEFMODULEINFO_H
#define DEFMODULEINFO_H

#include <string>

using namespace std;

namespace def {
	class DEFModuleInfo {
	public:
		DEFModuleInfo();
		string macro_name;
		string instance_name;
		string orient;
		double x, y;
	};
}

#endif // DEFMODULEINFO_H
