#ifndef DEFDATAPIN_H
#define DEFDATAPIN_H

#include <string>

namespace def {

	using namespace std;
	
	class DEFDataPin
	{
	public:
		DEFDataPin();
		string m_name;
		string m_signal;
		string m_layer;
		double m_x, m_y;
		double m_w, m_h;
	};
}

#endif // DEFDATAPIN_H
