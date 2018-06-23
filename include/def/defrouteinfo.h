#ifndef DEFROUTEINFO_H
#define DEFROUTEINFO_H

#include <vector>
#include <string>

#include "geometry.hpp"

using namespace std;

namespace def {
	class DEFRouteInfo{

	public:
		DEFRouteInfo();
		void addPoint(double x, double y);
		void setLayer(string s);
		void setVia(string s);

		vector<Point> getPoints();
		string getLayer();
		string getViaName();

	private:
		vector<Point> m_pointList;
		string m_layer;
		string m_viaName;
	};
}
#endif // DEFROUTEINFO_H
